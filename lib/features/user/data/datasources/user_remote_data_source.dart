import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/services/supabase_storage_service.dart';
import 'package:petter/core/utils/image_util.dart';
import 'package:petter/features/user/data/models/user_model.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserProfile(String uid);

  Future<UserModel> getMyProfile();

  Future<UserModel> updateProfile(UpdateProfileParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl(
    this._auth,
    this._firestore,
    this._storageService,
  );

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final SupabaseStorageService _storageService;

  CollectionReference<UserModel> get _usersCollection => _firestore
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => .fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Future<UserModel> getUserProfile(String uid) async {
    final doc = await _usersCollection.doc(uid).get();

    if (!doc.exists) {
      throw const ServerException(
        'Không tìm thấy dữ liệu người dùng',
      );
    }

    return doc.data()!;
  }

  @override
  Future<UserModel> getMyProfile() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('Người dùng chưa đăng nhập');
    }

    final doc = await _usersCollection.doc(currentUser.uid).get();

    if (!doc.exists) {
      throw const ServerException(
        'Không tìm thấy dữ liệu người dùng',
      );
    }

    return doc.data()!;
  }

  Future<String?> _uploadAvatar(String id, File imageFile) async {
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
      final path = 'users/$fileName';

      return _storageService.uploadImage(
        bucket: 'images',
        path: path,
        file: imageFile,
        contentType: contentType,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Không thể tải ảnh đại diện lên: $e');
    }
  }

  @override
  Future<UserModel> updateProfile(UpdateProfileParams params) async {
    final updateData = {if (params.name != null) 'name': params.name};

    if (params.imageFile != null) {
      final uploadedUrl = await _uploadAvatar(
        params.id,
        params.imageFile!,
      );

      if (uploadedUrl != null) {
        final freshUrl =
            '$uploadedUrl?t=${DateTime.now().millisecondsSinceEpoch}';
        updateData['avatar'] = freshUrl;
        if (params.currentImageUrl != null) {
          unawaited(
            CachedNetworkImage.evictFromCache(
              params.currentImageUrl!,
            ),
          );
        }

        if (params.currentImageUrl?.isNotEmpty == true) {
          try {
            final oldPath = extractPathFromStorage(
              params.currentImageUrl!,
            );
            await _storageService.deleteFile(
              bucket: 'images',
              path: oldPath,
            );
          } catch (e) {
            debugPrint('Xoá ảnh đại diện cũ thất bại: $e');
          }
        }
      }
    }

    if (updateData.isEmpty) {
      final doc = await _usersCollection.doc(params.id).get();
      if (!doc.exists) {
        throw const ServerException('Không tìm thấy người dùng');
      }
      return doc.data()!;
    }

    final currentUser = _auth.currentUser;

    await Future.wait([
      _usersCollection.doc(params.id).update(updateData),
      if (updateData['avatar'] != null)
        currentUser?.updatePhotoURL(updateData['avatar']) ??
            Future<dynamic>.value(),
      if (params.name != null)
        currentUser?.updateDisplayName(params.name) ??
            Future<dynamic>.value(),
    ]);
    await _auth.currentUser?.reload();

    final doc = await _usersCollection.doc(params.id).get();
    if (!doc.exists) {
      throw const ServerException('Không tìm thấy người dùng');
    }
    return doc.data()!;
  }
}
