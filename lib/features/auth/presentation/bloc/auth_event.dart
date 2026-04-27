part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.signUp(String email, String password) =
      _SignUp;
  const factory AuthEvent.signIn(String email, String password) =
      _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
