part of 'all_categories_cubit.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoading extends AllCategoriesState {}

class AllCategoriesSuccess extends AllCategoriesState {
  AllCategoriesResponse allCategoriesResponse;
  AllCategoriesSuccess(this.allCategoriesResponse);
}

class AllCategoriesError extends AllCategoriesState {
  String message;
  AllCategoriesError(this.message);
}

