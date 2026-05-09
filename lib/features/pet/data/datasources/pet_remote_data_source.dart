import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mime/mime.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/services/supabase_storage_service.dart';
import 'package:petter/core/utils/image_util.dart';
import 'package:petter/features/pet/data/models/address_model.dart';
import 'package:petter/features/pet/data/models/pet_model.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

abstract class PetRemoteDataSource {
  Future<List<PetModel>> getPets(PetFilterParams params);

  Future<List<PetModel>> getUserPets(String uid);

  Future<PetModel> getPet(String id);

  Future<PetModel> createPet(CreatePetParams params);

  Future<PetModel> updatePet(UpdatePetParams params);
}

class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  const PetRemoteDataSourceImpl(
    this._auth,
    this._firestore,
    this._storageService,
  );

  final FirebaseAuth _auth;
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

      final contentType = lookupMimeType(imageFile.path);

      if (contentType == null) {
        throw const ServerException(
          'Không tìm thấy định dạng của tệp',
        );
      }

      final ext = extensionFromMime(contentType);
      final timestamp = DateTime.now().millisecondsSinceEpoch;

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
  Future<List<PetModel>> getPets(PetFilterParams params) async {
    // 1. Trường hợp đặc biệt: Lấy danh sách thú cưng yêu thích (Favorite)
    if (params.favoriteIds != null) {
      if (params.favoriteIds!.isEmpty) return [];

      // Chia nhỏ ids thành từng cụm 30 phần tử
      final chunks = <List<String>>[];
      for (var i = 0; i < params.favoriteIds!.length; i += 30) {
        chunks.add(
          params.favoriteIds!.sublist(
            i,
            i + 30 > params.favoriteIds!.length
                ? params.favoriteIds!.length
                : i + 30,
          ),
        );
      }

      // Chạy song song các query để tối ưu hiệu suất
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

    // 2. Trường hợp lọc thông thường (Filter & Search)
    var query = _petsCollection.where('isDeleted', isEqualTo: false);

    if (params.speciesId != null) {
      query = query.where('speciesId', isEqualTo: params.speciesId);
    }

    if (params.gender != null) {
      query = query.where('gender', isEqualTo: params.gender!.name);
    }

    if (!params.showAdopted) {
      query = query.where('isAdopted', isEqualTo: false);
    }

    // Prefix Search theo tên
    if (params.searchTerm != null && params.searchTerm!.isNotEmpty) {
      query = query
          .where('name', isGreaterThanOrEqualTo: params.searchTerm)
          .where(
            'name',
            isLessThanOrEqualTo: '${params.searchTerm!}\uf8ff',
          );
    }

    if (params.limit != null) {
      query = query.limit(params.limit!);
    }

    // Sắp xếp
    query = query.orderBy(
      params.sortBy,
      descending: params.descending,
    );

    final snapshot = await query.get();
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
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('Người dùng chưa đăng nhập');
    }

    try {
      final docRef = _petsCollection.doc();

      var imageUrl = '';
      final uploadedUrl = await _uploadPetImage(
        docRef.id,
        params.imageFile,
      );
      if (uploadedUrl != null) {
        imageUrl = uploadedUrl;
      }

      final pet = PetModel(
        id: docRef.id,
        uid: currentUser.uid,
        name: params.name,
        address: AddressModel(
          detail: params.addressDetail,
          ward: params.ward.name,
          province: params.province.name,
          wardCode: params.ward.code,
          provinceCode: params.province.code,
          fullAddress: params.fullAddress,
        ),
        gender: params.gender,
        speciesId: params.speciesId,
        bleed: params.bleed,
        age: params.age,
        weight: params.weight,
        description: params.description,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await docRef.set(pet);
      return pet;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Tạo thú cưng không thành công: $e');
    }
  }

  @override
  Future<PetModel> updatePet(UpdatePetParams params) async {
    try {
      final updateData = params.toJson();

      if (params.imageFile != null &&
          params.currentImageUrl != null) {
        final uploadedUrl = await _uploadPetImage(
          params.id,
          params.imageFile!,
        );
        if (uploadedUrl != null) {
          await CachedNetworkImage.evictFromCache(
            params.currentImageUrl!,
            cacheKey: params.id,
          );

          if (params.currentImageUrl!.isNotEmpty) {
            final oldPath = extractPathFromStorage(
              params.currentImageUrl!,
            );
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
}
