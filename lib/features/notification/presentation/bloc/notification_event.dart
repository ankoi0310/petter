part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications() =
      _GetNotifications;

  const factory NotificationEvent.createNotification(
    CreateNotificationParams params,
  ) = _CreateNotification;

  const factory NotificationEvent.readNotification(String id) =
      _ReadNotification;
  const factory NotificationEvent.readAllNotifications() =
      _ReadAllNotifications;
}
