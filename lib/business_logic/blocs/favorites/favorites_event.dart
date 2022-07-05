part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsInFavoriteEvent extends FavoritesEvent {}

class AddProductToFavoriteEvent extends FavoritesEvent {
  final ProductDataModel favoriteProduct;
  bool isFavorite = false;
  AddProductToFavoriteEvent({required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct, isFavorite];
}

class RemoveProductFromFavoriteEvent extends FavoritesEvent {
  final ProductDataModel favoriteProduct;

  const RemoveProductFromFavoriteEvent({required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct];
}

class StartSearchEvent extends FavoritesEvent {}

class CloseSearchEvent extends FavoritesEvent {}

