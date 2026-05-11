import 'dart:io';

import 'package:petter/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseStorageService {
  Future<String> uploadImage({
    required String bucket,
    required String path,
    required File file,
    required String contentType,
  });

  Future<void> deleteFile({
    required String bucket,
    required String path,
  });

  String getPublicUrl({required String bucket, required String path});
}

class SupabaseStorageServiceImpl implements SupabaseStorageService {
  const SupabaseStorageServiceImpl({required this.client});

  final SupabaseClient client;

  @override
  Future<String> uploadImage({
    required String bucket,
    required String path,
    required File file,
    required String contentType,
  }) async {
    try {
      await client.storage
          .from(bucket)
          .upload(
            path,
            file,
            fileOptions: FileOptions(contentType: contentType),
          );

      return getPublicUrl(bucket: bucket, path: path);
    } catch (e) {
      throw ServerException('Tải ảnh không thành công: $e');
    }
  }

  @override
  Future<void> deleteFile({
    required String bucket,
    required String path,
  }) async {
    try {
      await client.storage.from(bucket).remove([path]);
    } catch (e) {
      throw ServerException('Xoá ảnh không thành công: $e');
    }
  }

  @override
  String getPublicUrl({
    required String bucket,
    required String path,
  }) {
    return client.storage.from(bucket).getPublicUrl(path);
  }
}
