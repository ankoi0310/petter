import 'package:petter/features/adoption/data/models/adoption_request_model.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';

extension AdoptionRequestMapper on AdoptionRequestModel {
  AdoptionRequest toEntity() {
    return AdoptionRequest(
      id: id,
      petId: petId,
      adopterId: adopterId,
      createAt: createAt,
      updatedAt: updatedAt,
      status: status,
      rejectionReason: rejectionReason,
    );
  }
}
