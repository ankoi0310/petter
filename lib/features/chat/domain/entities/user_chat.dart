import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/features/user/domain/entities/user.dart';

part 'user_chat.freezed.dart';

@freezed
abstract class UserChat with _$UserChat {
  @TimestampConverter()
  const factory UserChat({
    required User user,
    required bool isOnline,
    DateTime? lastSeen,
  }) = _UserChat;
}
