import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';

abstract class UserRepository {
  ResultFuture<User> getProfile(String uid);
}
