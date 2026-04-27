import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';

class UpdateProfileParams {
  const UpdateProfileParams({
    required this.uid,
    this.name,
    this.phone,
    this.avatar,
  });

  final String uid;
  final String? name;
  final String? phone;
  final String? avatar;
}

class UpdateProfileUseCase
    implements UseCase<User, UpdateProfileParams> {
  const UpdateProfileUseCase(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<User> call(UpdateProfileParams params) {
    return _repository.updateProfile(params);
  }
}
