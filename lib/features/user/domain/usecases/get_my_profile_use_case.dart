import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';

class GetMyProfileUseCase implements UseCase<User, NoParams> {
  const GetMyProfileUseCase(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<User> call(NoParams params) {
    return _repository.getMyProfile();
  }
}
