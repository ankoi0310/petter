import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
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
       super(const .initial()) {
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

  List<Pet> _homePets = [];
  List<Pet> _searchPets = [];
  List<Pet> _userPets = [];

  void _emitLoaded(Emitter<PetState> emit, {Pet? selectedPet}) {
    emit(
      .loaded(
        homePets: _homePets,
        searchPets: _searchPets,
        userPets: _userPets,
        pet: selectedPet,
      ),
    );
  }

  Future<void> _onGetPets(
    _GetPets event,
    Emitter<PetState> emit,
  ) async {
    emit(const .loading());
    final result = await _getPets(event.params);
    result.fold((failure) => emit(.error(failure.message)), (pets) {
      if (event.isSearch) {
        _searchPets = pets;
      } else {
        _homePets = pets;
      }
      _emitLoaded(emit);
    });
  }

  Future<void> _onGetUserPets(
    _GetUserPets event,
    Emitter<PetState> emit,
  ) async {
    emit(const .loading());
    final result = await _getUserPets(NoParams());
    result.fold((failure) => emit(.error(failure.message)), (pets) {
      _userPets = pets;
      _emitLoaded(emit);
    });
  }

  Future<void> _onGetPet(
    _GetPet event,
    Emitter<PetState> emit,
  ) async {
    final result = await _getPet(event.id);
    result.fold(
      (failure) => emit(.error(failure.message)),
      (pet) => _emitLoaded(emit),
    );
  }

  Future<void> _onCreatePet(
    _CreatePet event,
    Emitter<PetState> emit,
  ) async {
    emit(const .creating());
    final result = await _createPet(event.params);
    result.fold((failure) => emit(.error(failure.message)), (pet) {
      _homePets = _homePets.append(pet).take(10).toList();
      _searchPets = [pet, ..._searchPets];
      _userPets = [pet, ..._userPets];
      emit(const .createPetSuccess());
      _emitLoaded(emit);
    });
  }

  Future<void> _onUpdatePet(
    _UpdatePet event,
    Emitter<PetState> emit,
  ) async {
    emit(const .updating());
    final result = await _updatePet(event.params);
    result.fold((failure) => emit(.error(failure.message)), (
      updatedPet,
    ) {
      _homePets = _homePets
          .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
          .toList();
      _searchPets = _searchPets
          .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
          .toList();
      _userPets = _userPets
          .map((pet) => pet.id == updatedPet.id ? updatedPet : pet)
          .toList();
      emit(const .updatePetSuccess());
      _emitLoaded(emit);
    });
  }

  // Future<void> _onDeletePet(
  //   _DeletePet event,
  //   Emitter<PetState> emit,
  // ) async {
  //   final result = await _updatePet(event.params);
  //   result.fold((failure) => emit(.error(failure.message)), (
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
