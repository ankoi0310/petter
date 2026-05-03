import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/notification_type.dart';

part 'notification.freezed.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String receiverId,
    required String title,
    required String body,
    required NotificationType type,
    required Map<String, dynamic> data,
    required DateTime createdAt,
    required bool isRead,
  }) = _Notification;
}
