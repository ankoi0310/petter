import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/category/domain/entities/category.dart';
import 'package:petter/features/category/domain/repositories/category_repository.dart';

class WatchCategoriesUseCase
    implements StreamUseCase<List<Category>, NoParams> {
  const WatchCategoriesUseCase(this._repository);

  final CategoryRepository _repository;
  @override
  ResultStreamList<Category> call(NoParams params) {
    return _repository.categories;
  }
}
