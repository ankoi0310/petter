import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/user/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmail(SignUpParams params);

  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Stream<UserModel?> get authStateChange;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<UserModel> get _usersCollection => _firestore
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) =>
            UserModel.fromFirestore(snapshot),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Future<UserModel> signUpWithEmail(SignUpParams params) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    if (credential.user == null) {
      throw const AuthException('User not found');
    }

    final user = credential.user!;

    // await user.linkWithPhoneNumber(params.phoneNumber);
    await user.updateProfile(displayName: params.name);
    await user.reload();

    final newUser = UserModel(
      uid: user.uid,
      email: params.email,
      name: params.name,
      phone: params.phone,
      createdAt: DateTime.now(),
    );

    try {
      await _usersCollection.doc(user.uid).set(newUser);
      return newUser;
    } on Exception catch (error) {
      await credential.user?.delete();
      throw _mapError(error);
    }
  }

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = await _usersCollection
          .doc(credential.user!.uid)
          .get();

      return doc.data() ??
          UserModel.fromFirebaseUser(credential.user!);
    } catch (error) {
      throw _mapError(error);
    }
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Stream<UserModel?> get authStateChange {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      final doc = await _usersCollection.doc(user.uid).get();
      return doc.data() ?? UserModel.fromFirebaseUser(user);
    });
  }

  Exception _mapError(Object error) {
    if (error is FirebaseAuthException) {
      return switch (error.code) {
        'user-not-found' => const AuthException(
          'Account is not exist',
        ),
        'wrong-password' => const AuthException('Wrong password'),
        'email-already-in-use' => const AuthException(
          'Email already in use',
        ),
        'invalid-email' => const AuthException('Email is invalid'),
        'weak-password' => const AuthException(
          'Password is too weak',
        ),
        _ => AuthException(error.message ?? 'Authentication Error'),
      };
    }

    return UnknownException(toString());
  }
}
