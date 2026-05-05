import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/features/species/data/models/species_model.dart';

abstract class SpeciesRemoteDataSource {
  Stream<List<SpeciesModel>> get speciesListChange;
}

class SpeciesRemoteDataSourceImpl implements SpeciesRemoteDataSource {
  const SpeciesRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<SpeciesModel> get _speciesCollection =>
      _firestore
          .collection('species')
          .withConverter<SpeciesModel>(
            fromFirestore: (snapshot, _) {
              return SpeciesModel.fromJson(snapshot.data()!);
            },
            toFirestore: (species, _) => species.toJson(),
          );

  @override
  Stream<List<SpeciesModel>> get speciesListChange {
    return _speciesCollection
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return doc.data();
          }).toList();
        });
  }
}
