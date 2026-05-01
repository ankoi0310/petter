import 'package:petter/features/chat/data/models/chat_room_model.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';

extension ChatRoomMapper on ChatRoomModel {
  ChatRoom toEntity() {
    return ChatRoom(
      id: id,
      members: members,
      lastMessage: lastMessage,
      lastMessageSent: lastMessageSent,
      unreadCount: unreadCount,
    );
  }
}
