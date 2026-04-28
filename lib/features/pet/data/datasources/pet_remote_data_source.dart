import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/pet/data/models/pet_model.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

abstract class PetRemoteDataSource {
  Future<List<PetModel>> getPets();

  Future<List<PetModel>> getUserPets(String uid);

  Future<PetModel> getPet(String id);

  Future<PetModel> createPet(CreatePetParams params);

  Future<PetModel> updatePet(UpdatePetParams params);
}

class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  const PetRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<PetModel> get _petsCollection => _firestore
      .collection('pets')
      .withConverter<PetModel>(
        fromFirestore: (snapshot, _) {
          return PetModel.fromJson(snapshot.data()!);
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  @override
  Future<List<PetModel>> getPets() async {
    final snapshot = await _petsCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<List<PetModel>> getUserPets(String uid) async {
    final snapshot = await _petsCollection
        .where('uid', isEqualTo: uid)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<PetModel> getPet(String id) async {
    final snapshot = await _petsCollection.doc(id).get();

    if (!snapshot.exists) {
      throw const ServerException('Pet not found');
    }

    return snapshot.data()!;
  }

  @override
  Future<PetModel> createPet(CreatePetParams params) async {
    final docRef = _petsCollection.doc();

    final pet = PetModel(
      id: docRef.id,
      uid: params.uid,
      name: params.name,
      gender: params.gender,
      weight: params.weight,
      age: params.age,
      description: params.description,
      imageUrl: params.imageUrl,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isAdopted: false,
      isDeleted: false,
    );

    await docRef.set(pet);
    return pet;
  }

  @override
  Future<PetModel> updatePet(UpdatePetParams params) async {
    await _petsCollection.doc(params.id).update({
      ...params.toJson(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    final doc = await _petsCollection.doc(params.id).get();

    return doc.data()!;
  }
}
