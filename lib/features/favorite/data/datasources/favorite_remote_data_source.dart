import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteModel>> getFavorites();

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
  const FavoriteRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
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
  Future<List<FavoriteModel>> getFavorites() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw const AuthException('Người dùng chưa đăng nhập');
    }

    final snapshot = await _favoritesCollection
        .where('uid', isEqualTo: currentUser.uid)
        .orderBy('createdAt', descending: true)
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
        createdAt: DateTime.now(),
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

      for (final doc in query.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw ServerException('Failed to remove: $e');
    }
  }
}
