import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/get_my_profile_use_case.dart';
import 'package:petter/features/user/domain/usecases/get_user_profile_use_case.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required GetUserProfileUseCase getUserProfile,
    required GetMyProfileUseCase getMyProfile,
    required UpdateProfileUseCase updateProfile,
  }) : _getUserProfile = getUserProfile,
       _getMyProfile = getMyProfile,
       _updateProfile = updateProfile,
       super(const .initial()) {
    on<_GetUserProfile>(_onGetUserProfile);
    on<_GetMyProfile>(_onGetMyProfile);
    on<_UpdateProfile>(_onUpdateProfile);
  }

  final GetUserProfileUseCase _getUserProfile;
  final GetMyProfileUseCase _getMyProfile;
  final UpdateProfileUseCase _updateProfile;

  Future<void> _onGetUserProfile(
    _GetUserProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const .loading());

    final result = await _getUserProfile(event.uid);
    result.fold(
      (failure) => emit(.error(failure.message)),
      (user) => emit(.loaded(user)),
    );
  }

  Future<void> _onGetMyProfile(
    _GetMyProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const .loading());

    final result = await _getMyProfile(NoParams());
    result.fold(
      (failure) => emit(.error(failure.message)),
      (user) => emit(.loaded(user)),
    );
  }

  Future<void> _onUpdateProfile(
    _UpdateProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const .updating());

    final result = await _updateProfile(event.params);
    result.fold((failure) => emit(.error(failure.message)), (user) {
      emit(.updateSuccess(user));
      add(const .getMyProfile());
    });
  }
}
