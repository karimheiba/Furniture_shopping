part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ErrorProductsLoaded extends ProductsState {
  final String message;

  const ErrorProductsLoaded({required this.message});
  @override
  List<Object> get props => [message];
}

class ProductsLoaded extends ProductsState {
  final List<ProductDataModel> products;

  const ProductsLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class SearchedProductsLoading extends ProductsState {}

class SearchedProductsLoaded extends ProductsState {
  final List<ProductDataModel> products;

  const SearchedProductsLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class CategoryProductsLoaded extends ProductsState {
  final List<ProductDataModel> products;

  const CategoryProductsLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class IsSearchedProductState extends ProductsState {
  final bool isSearched;

  const IsSearchedProductState({required this.isSearched});
  @override
  List<Object> get props => [isSearched];
}
