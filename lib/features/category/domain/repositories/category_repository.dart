import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  ResultStreamList<Category> get categories;
}
