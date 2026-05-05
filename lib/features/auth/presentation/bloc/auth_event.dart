part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.signUp({
    required String displayName,
    required String phoneNumber,
    required String email,
    required String password,
  }) = _SignUp;

  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _SignIn;

  const factory AuthEvent.resetPassword({required String email}) =
      _ResetPassword;

  const factory AuthEvent.signOut() = _SignOut;
}
