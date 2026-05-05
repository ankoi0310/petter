import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/request_status.dart';

part 'adoption_request.freezed.dart';

@freezed
abstract class AdoptionRequest with _$AdoptionRequest {
  const factory AdoptionRequest({
    required String id,
    required String petId,
    required String petOwnerId,
    required String petName,
    required String petImageUrl,
    required String adopterId,
    required String adopterName,
    required String? adopterAvatar,
    required String adopterPhone,
    required DateTime createdAt,
    required DateTime updatedAt,
    required RequestStatus status,
    String? rejectionReason,
  }) = _AdoptionRequest;
}
