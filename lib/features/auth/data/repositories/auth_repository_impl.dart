import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/user/data/mapper/user_mapper.dart';
import 'package:petter/features/user/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<User> signUp(SignUpParams params) {
    return TaskEither.tryCatch(
      () => _remoteDataSource.signUpWithEmail(params),
      (error, _) => _mapError(error),
    ).map((user) => user.toEntity()).run();
  }

  @override
  ResultFuture<User> signIn({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(
      () => _remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      ),
      (error, _) => _mapError(error),
    ).map((user) => user.toEntity()).run();
  }

  @override
  VoidFuture signOut() => TaskEither.tryCatch(
    _remoteDataSource.signOut,
    (error, _) => _mapError(error),
  ).map((_) => unit).run();

  @override
  Stream<User?> get user => _remoteDataSource.authStateChange.map(
    (user) => user?.toEntity(),
  );

  Failure _mapError(Object error) {
    if (error is FirebaseAuthException) {
      return switch (error.code) {
        'user-not-found' => const Failure.auth(
          'Account is not exist',
        ),
        'wrong-password' => const Failure.auth('Wrong password'),
        'email-already-in-use' => const Failure.auth(
          'Email already in use',
        ),
        'invalid-email' => const Failure.auth('Email is invalid'),
        'weak-password' => const Failure.auth('Password is too weak'),
        _ => Failure.auth(error.message ?? 'Authentication Error'),
      };
    }

    return Failure.unknown(toString());
  }
}
