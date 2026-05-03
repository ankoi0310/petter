import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';

class ReadNotificationUseCase implements UseCase<void, String> {
  const ReadNotificationUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  ResultFuture<void> call(String id) {
    return _repository.readNotification(id);
  }
}
