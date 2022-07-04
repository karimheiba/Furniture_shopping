part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends UserEvent {}

class GetAllProductsInFavoriteEvent extends UserEvent {}

class AddProductToFavoriteEvent extends UserEvent {
  final ProductDataModel favoriteProduct;
   bool isFavorite = false;
   AddProductToFavoriteEvent(
      {required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct,isFavorite];
}

class RemoveProductToFavoriteEvent extends UserEvent {
  final ProductDataModel favoriteProduct;

  const RemoveProductToFavoriteEvent({required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct];
}

class GetAllProductsInCartEvent extends UserEvent {}

class AddProductToCartEvent extends UserEvent {
  final ProductDataModel product;

  const AddProductToCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends UserEvent {
  final ProductDataModel product;

  const RemoveProductFromCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}
