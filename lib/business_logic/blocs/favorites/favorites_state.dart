part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritiesInitial extends FavoritesState {}

class UserFavoritesState extends FavoritesState {
  final bool isFavorite;

  const UserFavoritesState({required this.isFavorite});
  @override
  List<Object> get props => [isFavorite];
}

class FavoriteLoading extends FavoritesState {}

class FavoriteLoaded extends FavoritesState {
  final List<ProductDataModel> products;

  const FavoriteLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class Error extends FavoritesState {
  final String message;

  const Error({required this.message});
  @override
  List<Object> get props => [message];
}
