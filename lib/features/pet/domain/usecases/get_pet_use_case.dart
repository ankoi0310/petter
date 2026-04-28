import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class GetPetUseCase implements UseCase<Pet, String> {
  const GetPetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<Pet> call(String id) {
    return _repository.getPet(id);
  }
}
