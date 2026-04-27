import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getProfile(String uid);
  // Future<UserModel> updateProfile();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl(this._firestore);

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
}
