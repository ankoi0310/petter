import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';

class GetProfileUseCase implements UseCase<User, String> {
  const GetProfileUseCase(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<User> call(String uid) {
    return _repository.getProfile(uid);
  }
}
