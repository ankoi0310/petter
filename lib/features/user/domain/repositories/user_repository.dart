import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

abstract class UserRepository {
  ResultFuture<User> getProfile(String uid);
  ResultFuture<User> updateProfile(UpdateProfileParams params);
}
