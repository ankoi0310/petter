import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/notification/domain/entities/notification.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';
import 'package:petter/features/notification/domain/usecases/get_notifications_use_case.dart';
import 'package:petter/features/notification/domain/usecases/read_all_notifications_use_case.dart';
import 'package:petter/features/notification/domain/usecases/read_notification_use_case.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc
    extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required GetNotificationsUseCase getNotifications,
    required CreateNotificationUseCase createNotification,
    required ReadNotificationUseCase readNotification,
    required ReadAllNotificationsUseCase readAllNotifications,
  }) : _getNotifications = getNotifications,
       _createNotification = createNotification,
       _readNotification = readNotification,
       _readAllNotifications = readAllNotifications,
       super(const NotificationState.initial()) {
    on<_GetNotifications>(_onGetNotifications);
    on<_CreateNotification>(_onCreateNotification);
    on<_ReadNotification>(_onReadNotification);
    on<_ReadAllNotifications>(_onReadAllNotifications);
  }

  final GetNotificationsUseCase _getNotifications;
  final CreateNotificationUseCase _createNotification;
  final ReadNotificationUseCase _readNotification;
  final ReadAllNotificationsUseCase _readAllNotifications;

  List<Notification> _notifications = [];

  Future<void> _onGetNotifications(
    _GetNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const .loading());

    final result = await _getNotifications(NoParams());

    result.fold((failure) => emit(.error(failure.message)), (
      notifications,
    ) {
      _notifications = notifications;
      emit(.loaded(_notifications));
    });
  }

  Future<void> _onCreateNotification(
    _CreateNotification event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _createNotification(event.params);

    result.fold((failure) => emit(.error(failure.message)), (
      notification,
    ) {
      _notifications = [notification, ..._notifications];
      emit(.loaded(List.from(_notifications)));
    });
  }

  Future<void> _onReadNotification(
    _ReadNotification event,
    Emitter<NotificationState> emit,
  ) async {
    final currentNotifications = (state as _Loaded).notifications;

    final result = await _readNotification(event.id);

    result.fold((failure) => emit(.error(failure.message)), (_) {
      final updatedNotifications = currentNotifications.map((noti) {
        if (noti.id == event.id) {
          return noti.copyWith(isRead: true);
        }
        return noti;
      }).toList();

      _notifications = updatedNotifications;

      emit(NotificationState.loaded(updatedNotifications));
    });
  }

  Future<void> _onReadAllNotifications(
    _ReadAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _readAllNotifications(NoParams());

    result.fold((failure) => emit(.error(failure.message)), (_) {
      final updatedNotifications = _notifications
          .map((n) => n.copyWith(isRead: true))
          .toList();

      _notifications = updatedNotifications;
      emit(.loaded(updatedNotifications));
    });
  }
}
