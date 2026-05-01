import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  @TimestampConverter()
  const factory Message({
    required String id,
    required String senderId,
    required String text,
    required DateTime createdAt,
    @Default(false) bool isRead,
    String? attachment,
  }) = _Message;
}
