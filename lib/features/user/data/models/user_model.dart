import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    String? name,
    String? phone,
    String? avatar,
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromFirebaseUser(User user) => UserModel(
    uid: user.uid,
    email: user.email ?? '',
    name: user.displayName,
    phone: user.phoneNumber,
    avatar: user.photoURL,
  );

  factory UserModel.fromFirestore(
    DocumentSnapshot<JsonData> snapshot,
  ) {
    final data = snapshot.data()!;
    return UserModel(
      uid: data['id'] as String,
      email: data['email'] as String,
      name: data['name'] as String?,
      phone: data['phone'] as String?,
      avatar: data['avatar'] as String?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
    );
  }

  factory UserModel.fromJson(JsonData json) =>
      _$UserModelFromJson(json);
}
