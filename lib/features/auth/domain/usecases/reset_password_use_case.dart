import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<void, String> {
  const ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<void> call(String email) {
    return _repository.resetPassword(email);
  }
}
