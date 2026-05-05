import 'dart:io';

import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';

class UpdateProfileParams {
  const UpdateProfileParams({
    required this.id,
    this.name,
    this.currentImageUrl,
    this.imageFile,
  });

  final String id;
  final String? name;
  final String? currentImageUrl;
  final File? imageFile;
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
