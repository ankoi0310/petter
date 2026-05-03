import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';

class ReadAllNotificationsUseCase implements UseCase<void, NoParams> {
  const ReadAllNotificationsUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  ResultFuture<void> call(NoParams params) {
    return _repository.readAllNotifications();
  }
}
