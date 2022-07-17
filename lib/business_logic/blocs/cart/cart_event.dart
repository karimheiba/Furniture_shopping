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

class IncrementCounter extends CartEvent {
  final ProductDataModel product;
  final int count;

  const IncrementCounter({required this.product,required this.count});
  @override
  List<Object> get props => [product,count];
}

class DecrementCounter extends CartEvent {final ProductDataModel product;
  final int count;

  const DecrementCounter({required this.product,required this.count});
  @override
  List<Object> get props => [product,count];}
