import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/request_status.dart';

part 'adoption_request.freezed.dart';

@freezed
abstract class AdoptionRequest with _$AdoptionRequest {
  const factory AdoptionRequest({
    required String id,
    required String petId,
    required String adopterId,
    required DateTime createAt,
    required DateTime updatedAt,
    required RequestStatus status,
    String? rejectionReason,
  }) = _AdoptionRequest;
}
