part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserState {}

class UserDataLoading extends UserState {}

class UserDataLoaded extends UserState {
  final UserData user;

  const UserDataLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserFavoritesState extends UserState {
  final bool isFavorite;

  const UserFavoritesState({required this.isFavorite});
  @override
  List<Object> get props => [isFavorite];
}

class UserCartState extends UserState {
  final bool isInCart;

  const UserCartState({required this.isInCart});
  @override
  List<Object> get props => [isInCart];
}

class UserCartLoading extends UserState {}

class UserCartLoaded extends UserState {
  final List<Map<String,dynamic>> cartProducts;

  const UserCartLoaded({required this.cartProducts});
  @override
  List<Object> get props => [cartProducts];
}

class Error extends UserState {
  final String message;

  const Error({required this.message});
  @override
  List<Object> get props => [message];
}
