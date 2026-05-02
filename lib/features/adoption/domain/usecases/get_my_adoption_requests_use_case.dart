import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/repositories/adoption_repository.dart';

class GetMyAdoptionRequestsUseCase
    implements UseCase<List<AdoptionRequest>, NoParams> {
  const GetMyAdoptionRequestsUseCase(this._repository);

  final AdoptionRepository _repository;

  @override
  ResultFuture<List<AdoptionRequest>> call(NoParams params) {
    return _repository.getUserAdoptionRequests();
  }
}
