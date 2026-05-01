import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/adoption/data/datasources/adoption_remote_data_source.dart';
import 'package:petter/features/adoption/data/mapper/adoption_request_mapper.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/domain/repositories/adoption_repository.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';

class AdoptionRepositoryImpl implements AdoptionRepository {
  const AdoptionRepositoryImpl(this._remoteDataSource);

  final AdoptionRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<AdoptionRequest> createAdoptionRequest(
    CreateAdoptionRequestParams params,
  ) async {
    try {
      final model = await _remoteDataSource.createAdoptionRequest(
        params,
      );
      return right(model.toEntity());
    } on ServerException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  VoidFuture updateAdoptionRequest(
    UpdateAdoptionRequestParams params,
  ) async {
    try {
      await _remoteDataSource.updateAdoptionRequest(params);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
