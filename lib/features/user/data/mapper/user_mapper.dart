import 'package:petter/features/user/data/models/user_model.dart';
import 'package:petter/features/user/domain/entities/user.dart';

extension UserMapper on UserModel {
  User toEntity() {
    return User(
      uid: uid,
      name: name,
      phone: phone,
      email: email,
      avatar: avatar,
      createdAt: createdAt,
    );
  }
}
