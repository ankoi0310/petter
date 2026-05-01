import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/data/models/user_model.dart';

part 'user_chat_model.freezed.dart';

part 'user_chat_model.g.dart';

@freezed
abstract class UserChatModel with _$UserChatModel {
  @TimestampConverterNullable()
  const factory UserChatModel({
    required UserModel user,
    required bool isOnline,
    DateTime? lastSeen,
  }) = _UserChatModel;

  factory UserChatModel.fromJson(JsonData json) =>
      _$UserChatModelFromJson(json);
}
