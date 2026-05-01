import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/request_status.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'adoption_request_model.freezed.dart';

part 'adoption_request_model.g.dart';

@freezed
abstract class AdoptionRequestModel with _$AdoptionRequestModel {
  @TimestampConverter()
  const factory AdoptionRequestModel({
    required String id,
    required String petId,
    required String adopterId,
    required DateTime createAt,
    required DateTime updatedAt,
    @Default(RequestStatus.pending) RequestStatus status,
    String? rejectionReason,
  }) = _AdoptionRequestModel;

  factory AdoptionRequestModel.fromJson(JsonData json) =>
      _$AdoptionRequestModelFromJson(json);
}
