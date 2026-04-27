part of 'user_bloc.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(User user) = _Loaded;
  const factory UserState.updating() = _Updating;
  const factory UserState.updateSuccess(User user) = _UpdateSuccess;
  const factory UserState.error(String message) = _Error;
}
