import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/entities/message.dart';
import 'package:petter/features/chat/domain/usecases/create_chat_room.dart';
import 'package:petter/features/chat/domain/usecases/send_message.dart';

abstract class ChatRepository {
  ResultStreamList<ChatRoom> watchChatRooms();

  ResultFuture<ChatRoom> createChatRoom(CreateChatRoomParams params);

  ResultStreamList<Message> watchMessages(String roomId);

  VoidFuture sendMessage(SendMessageParams params);
}
