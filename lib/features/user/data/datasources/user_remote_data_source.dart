import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/user/data/models/user_model.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getProfile(String uid);

  Future<UserModel> updateProfile(UpdateProfileParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl(this._auth, this._firestore);

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
  Future<UserModel> getProfile(String uid) async {
    final doc = await _usersCollection.doc(uid).get();

    if (!doc.exists) throw const ServerException('User not found');

    return doc.data()!;
  }

  @override
  Future<UserModel> updateProfile(UpdateProfileParams params) async {
    final data = {
      if (params.name != null) 'name': params.name,
      if (params.phone != null) 'phone': params.phone,
      if (params.avatar != null) 'avatar': params.avatar,
    };

    await _usersCollection.doc(params.uid).update(data);

    final user = _auth.currentUser;

    if (params.name != null || params.avatar != null) {
      await user?.updateProfile(
        displayName: params.name,
        photoURL: params.avatar,
      );
      await user?.reload();
    }

    final doc = await _usersCollection.doc(params.uid).get();

    if (!doc.exists) throw const ServerException('User not found');

    return doc.data()!;
  }
}
