import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';

abstract class NotificationRepository {
  ResultFutureList<Notification> getNotifications();
  ResultFuture<Notification> createNotification(
    CreateNotificationParams params,
  );
  VoidFuture readNotification(String id);
  VoidFuture readAllNotifications();
}
