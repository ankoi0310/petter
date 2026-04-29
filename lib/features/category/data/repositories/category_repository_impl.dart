import 'package:petter/features/category/data/datasources/category_remote_data_source.dart';
import 'package:petter/features/category/data/mapper/category_mapper.dart';
import 'package:petter/features/category/domain/entities/category.dart';
import 'package:petter/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl(this._remoteDataSource);

  final CategoryRemoteDataSource _remoteDataSource;

  @override
  Stream<List<Category>> get categories {
    return _remoteDataSource.categoryListChange.map((models) {
      return models.map((model) {
        return model.toEntity();
      }).toList();
    });
  }
}
