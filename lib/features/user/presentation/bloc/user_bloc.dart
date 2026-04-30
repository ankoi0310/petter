import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/get_profile_use_case.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required GetProfileUseCase getProfile,
    required UpdateProfileUseCase updateProfile,
  }) : _getProfile = getProfile,
       _updateProfile = updateProfile,
       super(const UserState.initial()) {
    on<_GetProfile>(_onGetProfile);
    on<_UpdateProfile>(_onUpdateProfile);
  }

  final GetProfileUseCase _getProfile;
  final UpdateProfileUseCase _updateProfile;

  Future<void> _onGetProfile(
    _GetProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final result = await _getProfile(event.uid);
    result.fold(
      (failure) => emit(
        UserState.error(
          failure.when(
            auth: (message) => message,
            chat: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (user) => emit(UserState.loaded(user)),
    );
  }

  Future<void> _onUpdateProfile(
    _UpdateProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updating());

    final result = await _updateProfile(event.params);
    result.fold(
      (failure) => emit(
        UserState.error(
          failure.when(
            auth: (message) => message,
            chat: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (user) {
        emit(UserState.updateSuccess(user));
        emit(UserState.loaded(user));
      },
    );
  }
}
