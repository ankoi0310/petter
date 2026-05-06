import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

abstract class UserRepository {
  ResultFuture<User> getUserProfile(String uid);
  ResultFuture<User> getMyProfile();
  ResultFuture<User> updateProfile(UpdateProfileParams params);
}
