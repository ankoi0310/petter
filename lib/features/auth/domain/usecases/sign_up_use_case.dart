import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/user/domain/entities/user.dart';

class SignUpParams {
  const SignUpParams({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  final String name;
  final String phone;
  final String email;
  final String password;

  JsonData toJson() {
    return {'name': name, 'phone': phone, 'email': email};
  }
}

class SignUpUseCase implements UseCase<User, SignUpParams> {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<User> call(SignUpParams params) {
    return _repository.signUp(params);
  }
}
