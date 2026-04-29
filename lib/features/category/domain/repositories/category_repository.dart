import 'package:petter/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Stream<List<Category>> get categories;
}
