import 'package:petter/features/auth/data/models/user_model.dart';
import 'package:petter/features/auth/domain/entities/user.dart';

extension UserMapper on UserModel {
  User toEntity() {
    return User(
      id: id,
      name: name,
      phone: phone,
      email: email,
      avatar: avatar,
      createdAt: createdAt,
    );
  }
}
