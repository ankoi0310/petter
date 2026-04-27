import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';

class WatchAuthStateUseCase implements StreamUseCase<bool, NoParams> {
  const WatchAuthStateUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Stream<bool> call(NoParams params) => _repository.isAuthenticated;
}
