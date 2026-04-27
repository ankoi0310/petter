import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Stream<User?> get authStateChange;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) => _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  @override
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) => _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Stream<User?> get authStateChange => _auth.authStateChanges();
}
