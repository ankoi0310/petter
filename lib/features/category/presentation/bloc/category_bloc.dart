import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/category/domain/entities/category.dart';
import 'package:petter/features/category/domain/usecases/watch_categories_use_case.dart';

part 'category_event.dart';

part 'category_state.dart';

part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required WatchCategoriesUseCase watchCategories})
    : _watchCategories = watchCategories,
      super(const CategoryState.initial()) {
    on<_Started>((event, emit) async {
      emit(const CategoryState.loading());

      await _categorySubcription?.cancel();
      _categorySubcription = _watchCategories(NoParams()).listen(
        (result) {
          result.fold((failure) {}, (categories) {
            add(CategoryEvent.categoriesUpdated(categories));
          });
        },
        onError: (dynamic e) =>
            emit(CategoryState.error(e.toString())),
      );
    });
    on<_CategoriesUpdated>((event, emit) {
      emit(CategoryState.loaded(event.categories));
    });
  }

  final WatchCategoriesUseCase _watchCategories;
  StreamSubscription<Either<Failure, List<Category>>>?
  _categorySubcription;

  @override
  Future<void> close() async {
    await _categorySubcription?.cancel();
    return super.close();
  }
}
