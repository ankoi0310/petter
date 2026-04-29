import 'package:petter/features/category/data/models/category_model.dart';
import 'package:petter/features/category/domain/entities/category.dart';

extension CategoryMapper on CategoryModel {
  Category toEntity() {
    return Category(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isActive: isActive,
    );
  }
}
