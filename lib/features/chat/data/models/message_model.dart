import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  @TimestampConverter()
  const factory MessageModel({
    required String id,
    required String senderId,
    required String text,
    required DateTime createdAt,
    @Default(false) bool isRead,
    String? attachment,
  }) = _MessageModel;

  factory MessageModel.fromJson(JsonData json) =>
      _$MessageModelFromJson(json);
}
