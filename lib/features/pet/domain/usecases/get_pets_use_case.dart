import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class GetPetsUseCase implements UseCase<List<Pet>, PetFilterParams> {
  const GetPetsUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<List<Pet>> call(PetFilterParams params) {
    return _repository.getPets(params);
  }
}
