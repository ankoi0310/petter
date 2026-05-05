import 'package:petter/features/species/data/models/species_model.dart';
import 'package:petter/features/species/domain/entities/species.dart';

extension SpeciesMapper on SpeciesModel {
  Species toEntity() {
    return Species(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isActive: isActive,
    );
  }
}
