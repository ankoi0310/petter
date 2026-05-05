import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/species/domain/entities/species.dart';

abstract class SpeciesRepository {
  ResultStreamList<Species> get species;
}
