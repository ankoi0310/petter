import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/data/datasources/pet_remote_data_source.dart';
import 'package:petter/features/pet/data/mapper/pet_mapper.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

class PetRepositoryImpl implements PetRepository {
  const PetRepositoryImpl(this._remoteDataSource);

  final PetRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Pet>> getPets() async {
    try {
      final pets = await _remoteDataSource.getPets();
      return right(pets.map((pet) => pet.toEntity()).toList());
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  ResultFuture<List<Pet>> getUserPets(String uid) async {
    try {
      final pets = await _remoteDataSource.getUserPets(uid);
      return right(pets.map((pet) => pet.toEntity()).toList());
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  ResultFuture<Pet> getPet(String id) async {
    try {
      final pet = await _remoteDataSource.getPet(id);
      return right(pet.toEntity());
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  ResultFuture<Pet> createPet(CreatePetParams params) async {
    try {
      final pet = await _remoteDataSource.createPet(params);
      return right(pet.toEntity());
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  ResultFuture<Pet> updatePet(UpdatePetParams params) async {
    try {
      final pet = await _remoteDataSource.updatePet(params);
      return right(pet.toEntity());
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
