import 'package:petter/core/enums/notification_type.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';

class CreateNotificationParams {
  const CreateNotificationParams({
    required this.receiverId,
    required this.title,
    required this.body,
    required this.type,
    this.data = const {},
  });

  final String receiverId;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic> data;
}

class CreateNotificationUseCase
    implements UseCase<Notification, CreateNotificationParams> {
  const CreateNotificationUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  ResultFuture<Notification> call(CreateNotificationParams params) {
    return _repository.createNotification(params);
  }
}
