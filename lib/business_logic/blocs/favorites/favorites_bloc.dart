import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/repositories/user_repo.dart';

import '../../../data/models/products_data_model.dart';
import '../../../data/repositories/favorites_repo.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepoImpl favoritesRepo;
  FavoritesBloc({required this.favoritesRepo}) : super(FavoritiesInitial()) {
    on<FavoritesEvent>((event, emit) async {
      /// Add Product To Favorite Event
      if (event is AddProductToFavoriteEvent) {
        final productsfromMap =
            await favoritesRepo.addProductToFavorites(event.favoriteProduct);
        productsfromMap.fold((failure) {
          emit(const Error(message: 'Can\'t Add Now Please Try Later'));
        }, (productsMap) {
          event.isFavorite = true;
          emit(UserFavoritesState(isFavorite: event.isFavorite));
        });
      }

      /// Get All Products In Favorites
      if (event is GetAllProductsInFavoriteEvent) {
        emit(FavoriteLoading());
        final favoriteProducts = await favoritesRepo.getAllProductsInFavorite();
        favoriteProducts.fold((l) => emit(Error(message: l.message)),
            (r) => emit(FavoriteLoaded(products: r)));
      }

      /// Remove Product From Favorites
      if (event is RemoveProductFromFavoriteEvent) {
        emit(FavoriteLoading());
        final favorite = await favoritesRepo.removeProductFromFavorites(event.favoriteProduct);
        favorite.fold((failure) => emit(Error(message: failure.message)),
            (removed) => print('Favorite Bloc Message : deleted from Favorite'));
      }
    });
  }
}
