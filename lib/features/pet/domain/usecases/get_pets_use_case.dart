import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class GetPetsUseCase implements UseCase<List<Pet>, NoParams> {
  const GetPetsUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<List<Pet>> call(NoParams params) {
    return _repository.getPets();
  }
}
