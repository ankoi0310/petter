import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';

class GetUserProfileUseCase implements UseCase<User, String> {
  const GetUserProfileUseCase(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<User> call(String uid) {
    return _repository.getUserProfile(uid);
  }
}
