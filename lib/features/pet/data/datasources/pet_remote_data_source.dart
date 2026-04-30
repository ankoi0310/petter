import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/services/supabase_storage_service.dart';
import 'package:petter/features/pet/data/models/pet_model.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

abstract class PetRemoteDataSource {
  Future<List<PetModel>> getPets({List<String>? ids});

  Future<List<PetModel>> getUserPets(String uid);

  Future<PetModel> getPet(String id);

  Future<PetModel> createPet(CreatePetParams params);

  Future<PetModel> updatePet(UpdatePetParams params);
}

class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  const PetRemoteDataSourceImpl(
    this._firestore,
    this._storageService,
  );

  final FirebaseFirestore _firestore;
  final SupabaseStorageService _storageService;

  CollectionReference<PetModel> get _petsCollection => _firestore
      .collection('pets')
      .withConverter<PetModel>(
        fromFirestore: (snapshot, _) {
          return PetModel.fromJson(snapshot.data()!);
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  Future<String?> _uploadPetImage(String id, File imageFile) async {
    try {
      if (!imageFile.existsSync()) return null;

      final ext = imageFile.path.split('.').last.toLowerCase();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final contentType = switch (ext) {
        'png' => 'image/png',
        'webp' => 'image/webp',
        'gif' => 'image/gif',
        _ => 'image/jpeg',
      };

      final fileName = '${id}_$timestamp.$ext';
      final path = 'pets/$fileName';

      return _storageService.uploadImage(
        bucket: 'images',
        path: path,
        file: imageFile,
        contentType: contentType,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to upload pet image: $e');
    }
  }

  @override
  Future<List<PetModel>> getPets({List<String>? ids}) async {
    if (ids != null) {
      if (ids.isEmpty) return [];

      final chunks = <List<String>>[];
      for (var i = 0; i < ids.length; i += 30) {
        chunks.add(
          ids.sublist(i, i + 30 > ids.length ? ids.length : i + 30),
        );
      }

      final results = await Future.wait(
        chunks.map(
          (chunk) => _petsCollection
              .where(FieldPath.documentId, whereIn: chunk)
              .get(),
        ),
      );

      return results
          .expand((snap) => snap.docs)
          .map((doc) => doc.data())
          .toList();
    }

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
    try {
      final docRef = _petsCollection.doc();

      var imageUrl = '';
      if (params.imageFile != null) {
        final uploadedUrl = await _uploadPetImage(
          docRef.id,
          params.imageFile!,
        );
        if (uploadedUrl != null) {
          imageUrl = uploadedUrl;
        }
      }

      final pet = PetModel(
        id: docRef.id,
        uid: params.uid,
        name: params.name,
        address: params.address,
        gender: params.gender,
        categoryId: params.categoryId,
        species: params.species,
        age: params.age,
        weight: params.weight,
        description: params.description,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isAdopted: false,
        isDeleted: false,
      );

      await docRef.set(pet);
      return pet;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to create pet: $e');
    }
  }

  @override
  Future<PetModel> updatePet(UpdatePetParams params) async {
    try {
      final updateData = params.toJson();

      if (params.imageFile != null) {
        final uploadedUrl = await _uploadPetImage(
          params.id,
          params.imageFile!,
        );
        if (uploadedUrl != null) {
          await CachedNetworkImage.evictFromCache(
            params.currentImageUrl,
            cacheKey: params.id,
          );

          if (params.currentImageUrl.isNotEmpty) {
            final oldPath = _extractPath(params.currentImageUrl);
            await _storageService.deleteFile(
              bucket: 'images',
              path: oldPath,
            );
          }
          updateData['imageUrl'] = uploadedUrl;
        }
      }

      await _petsCollection.doc(params.id).update({
        ...updateData,
        'updatedAt': DateTime.now(),
      });
      final doc = await _petsCollection.doc(params.id).get();

      return doc.data()!;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  String _extractPath(String url) {
    final uri = Uri.parse(url);
    final cleanPath = uri.path;
    return cleanPath.split('/object/public/images/').last;
  }
}
