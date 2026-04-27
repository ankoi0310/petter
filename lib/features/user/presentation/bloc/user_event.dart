part of 'user_bloc.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.getProfile(String uid) = _GetProfile;

  const factory UserEvent.updateProfile(UpdateProfileParams params) =
      _UpdateProfile;
}
