import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/category/data/datasources/category_remote_data_source.dart';
import 'package:petter/features/category/data/mapper/category_mapper.dart';
import 'package:petter/features/category/domain/entities/category.dart';
import 'package:petter/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl(this._remoteDataSource);

  final CategoryRemoteDataSource _remoteDataSource;

  @override
  ResultStreamList<Category> get categories {
    return _remoteDataSource.categoryListChange
        .map<Either<Failure, List<Category>>>((models) {
          final entities = models
              .map((model) => model.toEntity())
              .toList();
          return right(entities);
        })
        .handleError((dynamic error) {
          return left<Failure, List<Category>>(
            Failure.server(error.toString()),
          );
        });
  }
}
