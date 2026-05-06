part of 'user_bloc.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.getUserProfile(String uid) =
      _GetUserProfile;
  const factory UserEvent.getMyProfile() = _GetMyProfile;

  const factory UserEvent.updateProfile(UpdateProfileParams params) =
      _UpdateProfile;
}
