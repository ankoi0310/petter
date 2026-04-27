import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/user/domain/entities/user.dart';

class WatchAuthStateUseCase
    implements StreamUseCase<User?, NoParams> {
  const WatchAuthStateUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Stream<User?> call(NoParams params) => _repository.user;
}
