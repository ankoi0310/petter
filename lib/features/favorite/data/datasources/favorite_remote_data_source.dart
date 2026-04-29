import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteModel>> getFavorites(String uid);

  Future<FavoriteModel> addToFavorite({
    required String uid,
    required String petId,
  });

  Future<void> removeFromFavorite({
    required String uid,
    required String petId,
  });
}

class FavoriteRemoteDataSourceImpl
    implements FavoriteRemoteDataSource {
  const FavoriteRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<FavoriteModel> get _favoritesCollection =>
      _firestore
          .collection('favorites')
          .withConverter<FavoriteModel>(
            fromFirestore: (snapshot, _) {
              return FavoriteModel.fromJson(snapshot.data()!);
            },
            toFirestore: (favorite, _) => favorite.toJson(),
          );

  @override
  Future<List<FavoriteModel>> getFavorites(String uid) async {
    final snapshot = await _favoritesCollection
        .where('uid', isEqualTo: uid)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<FavoriteModel> addToFavorite({
    required String uid,
    required String petId,
  }) async {
    try {
      final docRef = _favoritesCollection.doc();
      final newFavorite = FavoriteModel(
        id: docRef.id,
        uid: uid,
        petId: petId,
      );
      await _favoritesCollection.doc(docRef.id).set(newFavorite);

      return newFavorite;
    } catch (e) {
      throw ServerException('Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFromFavorite({
    required String uid,
    required String petId,
  }) async {
    try {
      final query = await _favoritesCollection
          .where('uid', isEqualTo: uid)
          .where('petId', isEqualTo: petId)
          .get();

      for (var doc in query.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw ServerException('Failed to remove: $e');
    }
  }
}
