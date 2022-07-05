part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsInCartEvent extends CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final ProductDataModel product;

  const AddProductToCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends CartEvent {
  final ProductDataModel product;

  const RemoveProductFromCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class UpdateCountProduct extends CartEvent {
  final CartDataModel product;

  const UpdateCountProduct({required this.product});
  @override
  List<Object> get props => [product];
}

