import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';

class SignUpParams {
  const SignUpParams({required this.email, required this.password});

  final String email;
  final String password;
}

class SignUpUseCase implements UseCase<void, SignUpParams> {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  VoidFuture call(SignUpParams params) {
    return _repository.signUp(
      email: params.email,
      password: params.password,
    );
  }
}
