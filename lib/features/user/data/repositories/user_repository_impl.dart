import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/user/data/datasources/user_remote_data_source.dart';
import 'package:petter/features/user/data/mapper/user_mapper.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<User> getUserProfile(String uid) async {
    try {
      final user = await _remoteDataSource.getUserProfile(uid);
      return right(user.toEntity());
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }

  @override
  ResultFuture<User> getMyProfile() async {
    try {
      final user = await _remoteDataSource.getMyProfile();
      return right(user.toEntity());
    } on AuthException catch (e) {
      return left(.auth(e.message));
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }

  @override
  ResultFuture<User> updateProfile(UpdateProfileParams params) async {
    try {
      final user = await _remoteDataSource.updateProfile(params);
      return right(user.toEntity());
    } on ServerException catch (e) {
      return left(.server(e.message));
    }
  }
}
