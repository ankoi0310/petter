import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';

part 'chat_room.freezed.dart';

@freezed
abstract class ChatRoom with _$ChatRoom {
  @TimestampConverter()
  const factory ChatRoom({
    required String id,
    required List<String> memberIds,
    required Map<String, String> memberNames,
    required Map<String, String?> memberAvatars,
    required Map<String, int> unreadCount,
    String? lastMessage,
    DateTime? lastMessageSent,
  }) = _ChatRoom;
}
