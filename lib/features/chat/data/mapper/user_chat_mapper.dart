import 'package:petter/features/chat/data/models/user_chat_model.dart';
import 'package:petter/features/chat/domain/entities/user_chat.dart';
import 'package:petter/features/user/data/mapper/user_mapper.dart';

extension UserChatMapper on UserChatModel {
  UserChat toEntity() {
    return UserChat(
      user: user.toEntity(),
      isOnline: isOnline,
      lastSeen: lastSeen,
    );
  }
}
