import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/species/domain/entities/species.dart';
import 'package:petter/features/species/domain/repositories/species_repository.dart';

class WatchSpeciesUseCase
    implements StreamUseCase<List<Species>, NoParams> {
  const WatchSpeciesUseCase(this._repository);

  final SpeciesRepository _repository;
  @override
  ResultStreamList<Species> call(NoParams params) {
    return _repository.species;
  }
}
