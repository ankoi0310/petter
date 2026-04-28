import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class GetUserPetsUseCase implements UseCase<List<Pet>, String> {
  const GetUserPetsUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<List<Pet>> call(String uid) {
    return _repository.getUserPets(uid);
  }
}
