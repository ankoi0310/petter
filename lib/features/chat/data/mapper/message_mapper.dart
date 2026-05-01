import 'package:petter/features/chat/data/models/message_model.dart';
import 'package:petter/features/chat/domain/entities/message.dart';

extension MessageMapper on MessageModel {
  Message toEntity() {
    return Message(
      id: id,
      senderId: senderId,
      text: text,
      createdAt: createdAt,
      isRead: isRead,
      attachment: attachment,
    );
  }
}
