import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/repositories/adoption_repository.dart';

class CreateAdoptionRequestParams {
  const CreateAdoptionRequestParams({
    required this.petId,
    required this.adopterId,
  });

  final String petId;
  final String adopterId;
}

class CreateAdoptionRequestUseCase
    implements UseCase<AdoptionRequest, CreateAdoptionRequestParams> {
  const CreateAdoptionRequestUseCase(this._repository);

  final AdoptionRepository _repository;

  @override
  ResultFuture<AdoptionRequest> call(
    CreateAdoptionRequestParams params,
  ) {
    return _repository.createAdoptionRequest(params);
  }
}
