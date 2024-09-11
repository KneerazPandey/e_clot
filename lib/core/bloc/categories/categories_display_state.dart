import 'package:e_clot/domain/category/entities/category_entity.dart';

abstract class CategoriesDisplayState {}

class CategoriesLoadingState extends CategoriesDisplayState {}

class CategoriesLoadedState extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesLoadedState({required this.categories});
}

class CategoriesFailureState extends CategoriesDisplayState {
  final String message;

  CategoriesFailureState({required this.message});
}
