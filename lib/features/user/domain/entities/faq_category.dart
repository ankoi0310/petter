import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/features/user/domain/entities/faq_item.dart';

part 'faq_category.freezed.dart';

@freezed
abstract class FaqCategory with _$FaqCategory {
  const factory FaqCategory({
    required String title,
    required List<FaqItem> items,
  }) = _FaqCategory;
}
