part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoading extends ProductsState{}
class ProductsSuccess extends ProductsState{
  ProductsResponse productsResponse;
  ProductsSuccess(this.productsResponse);
}
class ProductsError extends ProductsState{
  String errorMessage;
  ProductsError(this.errorMessage);
}


