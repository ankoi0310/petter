import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:petter/features/notification/data/mapper/notification_mapper.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(this._remoteDataSource);

  final NotificationRemoteDataSource _remoteDataSource;

  @override
  ResultFutureList<Notification> getNotifications() async {
    try {
      final models = await _remoteDataSource.getNotifications();
      return right(models.map((model) => model.toEntity()).toList());
    } on AuthException catch (e) {
      return left(.auth(e.message));
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }

  @override
  ResultFuture<Notification> createNotification(
    CreateNotificationParams params,
  ) async {
    try {
      final model = await _remoteDataSource.createNotification(
        params,
      );
      return right(model.toEntity());
    } on AuthException catch (e) {
      return left(.auth(e.message));
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }

  @override
  VoidFuture readNotification(String id) async {
    try {
      await _remoteDataSource.readAllNotifications();
      return right(unit);
    } on AuthException catch (e) {
      return left(.auth(e.message));
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }

  @override
  VoidFuture readAllNotifications() async {
    try {
      await _remoteDataSource.readAllNotifications();
      return right(unit);
    } on AuthException catch (e) {
      return left(.auth(e.message));
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }
}
