import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class DeletePetUseCase implements UseCase<void, String> {
  const DeletePetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<void> call(String id) {
    return _repository.deletePet(id);
  }
}
