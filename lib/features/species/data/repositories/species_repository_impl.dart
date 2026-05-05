import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/species/data/datasources/species_remote_data_source.dart';
import 'package:petter/features/species/data/mapper/species_mapper.dart';
import 'package:petter/features/species/domain/entities/species.dart';
import 'package:petter/features/species/domain/repositories/species_repository.dart';

class SpeciesRepositoryImpl implements SpeciesRepository {
  const SpeciesRepositoryImpl(this._remoteDataSource);

  final SpeciesRemoteDataSource _remoteDataSource;

  @override
  ResultStreamList<Species> get species {
    return _remoteDataSource.speciesListChange
        .map<Either<Failure, List<Species>>>((models) {
          final entities = models
              .map((model) => model.toEntity())
              .toList();
          return right(entities);
        })
        .handleError((dynamic error) {
          return left<Failure, List<Species>>(
            Failure.server(error.toString()),
          );
        });
  }
}
