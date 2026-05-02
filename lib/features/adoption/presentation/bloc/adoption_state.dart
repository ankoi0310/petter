part of 'adoption_bloc.dart';

@freezed
class AdoptionState with _$AdoptionState {
  const factory AdoptionState.initial() = _Initial;
  const factory AdoptionState.loading() = _Loading;
  const factory AdoptionState.loaded(
    List<AdoptionRequest> adoptionRequests,
  ) = _Loaded;
  const factory AdoptionState.createRequestSuccess() =
      _CreateRequestSuccess;
  const factory AdoptionState.updateRequestSuccess() =
      _UpdateRequestSuccess;
  const factory AdoptionState.error(String message) = _Error;
}
