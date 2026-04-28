import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class CreatePetParams {
  const CreatePetParams({
    required this.uid,
    required this.name,
    required this.address,
    required this.gender,
    required this.age,
    required this.weight,
    required this.description,
    this.imageUrl = '',
  });

  final String uid;
  final String name;
  final String address;
  final Gender gender;
  final String age;
  final double weight;
  final String description;
  final String imageUrl;
}

class CreatePetUseCase implements UseCase<Pet, CreatePetParams> {
  const CreatePetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<Pet> call(CreatePetParams params) {
    return _repository.createPet(params);
  }
}
