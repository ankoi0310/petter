import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';

abstract class AuthRepository {
  VoidFuture signUp(SignUpParams params);

  VoidFuture signIn({
    required String email,
    required String password,
  });

  VoidFuture signOut();
  Stream<bool> get isAuthenticated;
}
