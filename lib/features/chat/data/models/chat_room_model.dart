import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'chat_room_model.freezed.dart';

part 'chat_room_model.g.dart';

@freezed
abstract class ChatRoomModel with _$ChatRoomModel {
  @TimestampConverterNullable()
  const factory ChatRoomModel({
    required String id,
    required List<String> memberIds,
    required Map<String, String> memberNames,
    required Map<String, String?> memberAvatars,
    required Map<String, int> unreadCount,
    String? lastMessage,
    DateTime? lastMessageSent,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(JsonData json) =>
      _$ChatRoomModelFromJson(json);
}
