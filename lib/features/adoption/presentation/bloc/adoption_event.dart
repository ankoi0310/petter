part of 'adoption_bloc.dart';

@freezed
class AdoptionEvent with _$AdoptionEvent {
  const factory AdoptionEvent.getAdoptionRequests() =
      _GetAdoptionRequests;
  const factory AdoptionEvent.getMyAdoptionRequests() =
      _GetMyAdoptionRequests;

  const factory AdoptionEvent.createAdoptionRequest(
    CreateAdoptionRequestParams params,
  ) = _CreateAdoptionRequest;

  const factory AdoptionEvent.updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  ) = _UpdateAdoptionRequest;
}
