import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_user_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

part 'pet_event.dart';

part 'pet_state.dart';

part 'pet_bloc.freezed.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc({
    required GetPetsUseCase getPets,
    required GetUserPetsUseCase getUserPets,
    required GetPetUseCase getPet,
    required CreatePetUseCase createPet,
    required UpdatePetUseCase updatePet,
  }) : _getPets = getPets,
       _getUserPets = getUserPets,
       _getPet = getPet,
       _createPet = createPet,
       _updatePet = updatePet,
       super(const PetState.initial()) {
    on<_GetPets>(_onGetPets);
    on<_GetUserPets>(_onGetUserPets);
    on<_GetPet>(_onGetPet);
    on<_CreatePet>(_onCreatePet);
    on<_UpdatePet>(_onUpdatePet);
  }

  final GetPetsUseCase _getPets;
  final GetUserPetsUseCase _getUserPets;
  final GetPetUseCase _getPet;
  final CreatePetUseCase _createPet;
  final UpdatePetUseCase _updatePet;

  List<Pet> _pets = [];
  List<Pet> _userPets = [];

  void _emitLoaded(Emitter<PetState> emit) =>
      emit(PetState.loaded(pets: _pets, userPets: _userPets));

  Future<void> _onGetPets(
    _GetPets event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetState.loading());
    final result = await _getPets(NoParams());
    result.fold(
      (failure) => emit(
        PetState.error(
          failure.when(
            auth: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (pets) {
        _pets = pets;
        _emitLoaded(emit);
      },
    );
  }

  Future<void> _onGetUserPets(
    _GetUserPets event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetState.loading());
    final result = await _getUserPets(event.uid);
    result.fold(
      (failure) => emit(
        PetState.error(
          failure.when(
            auth: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (pets) {
        _userPets = pets;
        _emitLoaded(emit);
      },
    );
  }

  Future<void> _onGetPet(
    _GetPet event,
    Emitter<PetState> emit,
  ) async {
    final result = await _getPet(event.id);
    result.fold(
      (failure) => emit(
        PetState.error(
          failure.when(
            auth: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (pet) => emit(
        PetState.loaded(pets: _pets, userPets: _userPets, pet: pet),
      ),
    );
  }

  Future<void> _onCreatePet(
    _CreatePet event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetState.creating());
    final result = await _createPet(event.params);
    result.fold(
      (failure) => emit(
        PetState.error(
          failure.when(
            auth: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (pet) {
        _pets = [..._pets, pet];
        _userPets = [..._userPets, pet];
        emit(const PetState.createPetSuccess());
        _emitLoaded(emit);
      },
    );
  }

  Future<void> _onUpdatePet(
    _UpdatePet event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetState.updating());
    final result = await _updatePet(event.params);
    result.fold(
      (failure) => emit(
        PetState.error(
          failure.when(
            auth: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (updatedPet) {
        _pets = _pets
            .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
            .toList();
        _userPets = _userPets
            .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
            .toList();
        emit(const PetState.updatePetSuccess());
        _emitLoaded(emit);
      },
    );
  }

  // Future<void> _onDeletePet(
  //   _DeletePet event,
  //   Emitter<PetState> emit,
  // ) async {
  //   final result = await _updatePet(event.params);
  //   result.fold((failure) => emit(PetState.error(failure.message)), (
  //     updatedPet,
  //   ) {
  //     _pets = _pets
  //         .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
  //         .toList();
  //     _userPets = _userPets
  //         .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
  //         .toList();
  //     _emitLoaded(emit);
  //   });
  // }
}
