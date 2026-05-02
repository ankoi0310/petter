import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

abstract class AdoptionRepository {
  ResultFuture<List<AdoptionRequest>> getAdoptionRequests();
  ResultFuture<List<AdoptionRequest>> getUserAdoptionRequests();

  ResultFuture<AdoptionRequest> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  );

  ResultFuture<AdoptionRequest> updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  );
}
