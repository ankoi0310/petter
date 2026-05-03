import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/notification_type.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String receiverId,
    required String title,
    required String body,
    required NotificationType type,
    required DateTime createdAt,
    @Default({}) Map<String, dynamic> data,
    @Default(false) bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(JsonData json) =>
      _$NotificationModelFromJson(json);
}
