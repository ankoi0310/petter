import 'package:petter/core/utils/typedefs.dart';

abstract class AuthRepository {
  VoidFuture signUp({
    required String email,
    required String password,
  });

  VoidFuture signIn({
    required String email,
    required String password,
  });

  VoidFuture signOut();
  Stream<bool> get isAuthenticated;
}
