import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/user/domain/entities/user.dart';

abstract class AuthRepository {
  ResultFuture<User> signUp(SignUpParams params);

  ResultFuture<User> signIn({
    required String email,
    required String password,
  });

  VoidFuture signOut();
  ResultStream<User?> get user;
}
