part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends UserEvent {}
class GetAllProductsInCartEvent extends UserEvent{}

class AddProductToFavoriteEvent extends UserEvent {
  final ProductDataModel favoriteProduct;

  const AddProductToFavoriteEvent({required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct];
}

class RemoveProductToFavoriteEvent extends UserEvent {
  final ProductDataModel favoriteProduct;

  const RemoveProductToFavoriteEvent({required this.favoriteProduct});
  @override
  List<Object> get props => [favoriteProduct];
}

class AddProductToCartEvent extends UserEvent {
  //final List<Map<String, dynamic>> cartProducts;
  final ProductDataModel product;

  const AddProductToCartEvent(
      {required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends UserEvent {
  final List<Map<String, dynamic>> cartProducts;
  final String productId;

  const RemoveProductFromCartEvent({required this.cartProducts,required this.productId});
  @override
  List<Object> get props => [cartProducts,productId];
}
