import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/get_adoption_requests_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

part 'adoption_event.dart';

part 'adoption_state.dart';

part 'adoption_bloc.freezed.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  AdoptionBloc({
    required GetAdoptionRequestsUseCase getAdoptionRequests,
    required CreateAdoptionRequestUseCase createAdoptionRequest,
    required UpdateAdoptionRequestUseCase updateAdoptionRequest,
  }) : _getAdoptionRequests = getAdoptionRequests,
       _createAdoptionRequest = createAdoptionRequest,
       _updateAdoptionRequest = updateAdoptionRequest,
       super(const AdoptionState.initial()) {
    on<_GetAdoptionRequests>(_onGetAdoptionRequests);
    on<_CreateAdoptionRequest>(_onCreateAdoptionRequest);
    on<_UpdateAdoptionRequest>(_onUpdateAdoptionRequest);
  }

  final GetAdoptionRequestsUseCase _getAdoptionRequests;
  final CreateAdoptionRequestUseCase _createAdoptionRequest;
  final UpdateAdoptionRequestUseCase _updateAdoptionRequest;

  List<AdoptionRequest> _requests = <AdoptionRequest>[];

  Future<void> _onGetAdoptionRequests(
    _GetAdoptionRequests event,
    Emitter<AdoptionState> emit,
  ) async {
    emit(const AdoptionState.loading());

    final result = await _getAdoptionRequests(NoParams());

    result.fold(
      (failure) => emit(AdoptionState.error(failure.message)),
      (adoptionRequests) {
        print(adoptionRequests);
        _requests = adoptionRequests;
        emit(AdoptionState.loaded(_requests));
      },
    );
  }

  Future<void> _onCreateAdoptionRequest(
    _CreateAdoptionRequest event,
    Emitter<AdoptionState> emit,
  ) async {
    final result = await _createAdoptionRequest(event.params);

    result.fold(
      (failure) => emit(AdoptionState.error(failure.message)),
      (adoptionRequest) {
        _requests = [adoptionRequest, ..._requests];
        emit(AdoptionState.loaded(_requests));
      },
    );
  }

  Future<void> _onUpdateAdoptionRequest(
    _UpdateAdoptionRequest event,
    Emitter<AdoptionState> emit,
  ) async {
    final result = await _updateAdoptionRequest(event.params);

    result.fold(
      (failure) => emit(AdoptionState.error(failure.message)),
      (_) {
        // emit(AdoptionState.loaded(_requests));
      },
    );
  }
}
