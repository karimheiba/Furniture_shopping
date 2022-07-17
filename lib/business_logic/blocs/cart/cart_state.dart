part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class UserCartState extends CartState {
  final bool isInCart;

  const UserCartState({required this.isInCart});
  @override
  List<Object> get props => [isInCart];
}

class UserCartLoading extends CartState {}

class UserCartLoaded extends CartState {
  final List<CartDataModel> cartProducts;

  const UserCartLoaded({required this.cartProducts});
  @override
  List<Object> get props => [cartProducts];
}

class Error extends CartState {
  final String message;

  const Error({required this.message});
  @override
  List<Object> get props => [message];
}

class UpdatedCountProduct extends CartState {
  final int count;
  const UpdatedCountProduct({required this.count});
  @override
  List<Object> get props => [count];
}
