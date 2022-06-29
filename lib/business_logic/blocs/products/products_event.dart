part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {}

class StartSearchEvent extends ProductsEvent {}

class CloseSearchEvent extends ProductsEvent {}

class GetSearchProductsEvent extends ProductsEvent {
  final String productName;

  const GetSearchProductsEvent({required this.productName});

  @override
  List<Object> get props => [productName];
}

class GetProductsInCategoryEvent extends ProductsEvent {
  final String categoryId;

  const GetProductsInCategoryEvent({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
