import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  VoidFuture signUp(SignUpParams params) => TaskEither.tryCatch(
    () => _remoteDataSource.signUpWithEmail(params),
    (error, _) => _mapError(error),
  ).map((_) => unit).run();

  @override
  VoidFuture signIn({
    required String email,
    required String password,
  }) => TaskEither.tryCatch(
    () => _remoteDataSource.signInWithEmail(
      email: email,
      password: password,
    ),
    (error, _) => _mapError(error),
  ).map((_) => unit).run();

  @override
  VoidFuture signOut() => TaskEither.tryCatch(
    _remoteDataSource.signOut,
    (error, _) => _mapError(error),
  ).map((_) => unit).run();

  @override
  Stream<bool> get isAuthenticated =>
      _remoteDataSource.authStateChange.map((user) => user != null);

  Failure _mapError(Object error) {
    if (error is FirebaseAuthException) {
      return switch (error.code) {
        'user-not-found' => const AuthFailure('Account is not exist'),
        'wrong-password' => const AuthFailure('Wrong password'),
        'email-already-in-use' => const AuthFailure(
          'Email already in use',
        ),
        'invalid-email' => const AuthFailure('Email is invalid'),
        'weak-password' => const AuthFailure('Password is too weak'),
        _ => AuthFailure(error.message ?? 'Authentication Error'),
      };
    }

    return UnknownFailure(toString());
  }
}
