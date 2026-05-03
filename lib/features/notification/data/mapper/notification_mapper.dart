import 'package:petter/features/notification/data/models/notification_model.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';

extension NotificationMapper on NotificationModel {
  Notification toEntity() {
    return Notification(
      id: id,
      receiverId: receiverId,
      title: title,
      body: body,
      type: type,
      data: data,
      createdAt: createdAt,
      isRead: isRead,
    );
  }
}
