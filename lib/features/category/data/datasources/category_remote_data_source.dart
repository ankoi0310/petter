import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/features/category/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Stream<List<CategoryModel>> get categoryListChange;
}

class CategoryRemoteDataSourceImpl
    implements CategoryRemoteDataSource {
  const CategoryRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<CategoryModel> get _categoriesCollection =>
      _firestore
          .collection('categories')
          .withConverter<CategoryModel>(
            fromFirestore: (snapshot, _) {
              return CategoryModel.fromJson(snapshot.data()!);
            },
            toFirestore: (category, _) => category.toJson(),
          );

  @override
  Stream<List<CategoryModel>> get categoryListChange {
    return _categoriesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
