import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';

class GetNotificationsUseCase
    implements UseCase<List<Notification>, NoParams> {
  const GetNotificationsUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  ResultFutureList<Notification> call(NoParams params) {
    return _repository.getNotifications();
  }
}
