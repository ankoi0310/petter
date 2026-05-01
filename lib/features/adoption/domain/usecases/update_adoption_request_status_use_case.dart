import 'package:petter/core/enums/request_status.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/adoption/domain/repositories/adoption_repository.dart';

class UpdateAdoptionRequestParams {
  const UpdateAdoptionRequestParams({
    required this.id,
    required this.status,
    this.rejectionReason,
  });

  final String id;
  final RequestStatus status;
  final String? rejectionReason;
}

class UpdateAdoptionRequestUseCase
    implements UseCase<void, UpdateAdoptionRequestParams> {
  const UpdateAdoptionRequestUseCase(this._repository);

  final AdoptionRepository _repository;

  @override
  ResultFuture<void> call(UpdateAdoptionRequestParams params) {
    return _repository.updateAdoptionRequest(params);
  }
}
