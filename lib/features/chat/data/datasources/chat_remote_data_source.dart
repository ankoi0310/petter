import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/chat/data/models/chat_room_model.dart';
import 'package:petter/features/chat/data/models/message_model.dart';
import 'package:petter/features/chat/domain/usecases/create_chat_room.dart';
import 'package:petter/features/chat/domain/usecases/send_message.dart';

abstract class ChatRemoteDataSource {
  Stream<List<ChatRoomModel>> watchChatRooms();

  Stream<List<MessageModel>> watchMessages(String roomId);

  Future<ChatRoomModel> createChatRoom(CreateChatRoomParams params);

  Future<void> sendMessage(SendMessageParams params);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  const ChatRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<ChatRoomModel> get _roomsCollection =>
      _firestore
          .collection('rooms')
          .withConverter<ChatRoomModel>(
            fromFirestore: (snapshot, _) {
              return ChatRoomModel.fromJson(snapshot.data()!);
            },
            toFirestore: (room, _) => room.toJson(),
          );

  CollectionReference<MessageModel> _messagesCollection(
    String roomId,
  ) => _firestore
      .collection('rooms')
      .doc(roomId)
      .collection('messages')
      .withConverter<MessageModel>(
        fromFirestore: (snapshot, _) {
          return MessageModel.fromJson(snapshot.data()!);
        },
        toFirestore: (message, _) => message.toJson(),
      );

  @override
  Stream<List<ChatRoomModel>> watchChatRooms() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value([]);

    return _roomsCollection
        .where('members', arrayContains: user.uid)
        .orderBy('lastMessageSent', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => doc.data()).toList();
        });
  }

  @override
  Stream<List<MessageModel>> watchMessages(String roomId) {
    return _messagesCollection(roomId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => doc.data()).toList();
        });
  }

  @override
  Future<ChatRoomModel> createChatRoom(
    CreateChatRoomParams params,
  ) async {
    final members = List<String>.from(params.members)..sort();
    final roomId = members.join('_');

    final roomDoc = _roomsCollection.doc(roomId);
    final snapshot = await roomDoc.get();

    if (!snapshot.exists) {
      final newRoom = ChatRoomModel(
        id: roomId,
        members: params.members,
        unreadCount: {for (final id in params.members) id: 0},
      );

      await roomDoc.set(newRoom);
      return newRoom;
    } else {
      return snapshot.data()!;
    }
  }

  @override
  Future<void> sendMessage(SendMessageParams params) async {
    final currentUserId = _auth.currentUser?.uid;

    if (currentUserId == null) {
      throw const ServerException('User not signed in');
    }

    final roomsRef = _roomsCollection.doc(params.roomId);
    final messagesRef = _messagesCollection(roomsRef.id).doc();

    final messageData = MessageModel(
      id: messagesRef.id,
      senderId: currentUserId,
      text: params.text,
      createdAt: DateTime.now(),
    );

    final roomDoc = await roomsRef.get();
    if (!roomDoc.exists) {
      throw const ServerException('Room not found');
    }

    final members = List<String>.from(
      roomDoc.data()?.members as List? ?? [],
    );
    final otherMembers = members
        .where((id) => id != currentUserId)
        .toList();

    final batch = _firestore.batch()..set(messagesRef, messageData);

    final roomUpdate = {
      'lastMessage': params.text,
      'lastMessageSent': FieldValue.serverTimestamp(),
    };

    for (final receiverId in otherMembers) {
      roomUpdate['unreadCount.$receiverId'] = FieldValue.increment(1);
    }

    roomUpdate['unreadCount.$currentUserId'] = 0;

    batch.update(roomsRef, roomUpdate);

    await batch.commit();
  }
}
