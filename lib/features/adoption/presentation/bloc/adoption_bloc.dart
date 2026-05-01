import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

part 'adoption_event.dart';

part 'adoption_state.dart';

part 'adoption_bloc.freezed.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  AdoptionBloc({
    required CreateAdoptionRequestUseCase createAdoptionRequest,
    required UpdateAdoptionRequestUseCase updateAdoptionRequest,
  }) : _createAdoptionRequest = createAdoptionRequest,
       _updateAdoptionRequest = updateAdoptionRequest,
       super(const AdoptionState.initial()) {
    on<AdoptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final CreateAdoptionRequestUseCase _createAdoptionRequest;
  final UpdateAdoptionRequestUseCase _updateAdoptionRequest;
}
