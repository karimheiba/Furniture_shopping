import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/models/cart_model.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/user_repo.dart';

import '../../../data/data_services/local_data_sources.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepo;
  final UserRepoImpl userRepo;
  final LocalDataSourceImpl localDataSource;
  UserBloc(
      {required this.authRepo,
      required this.localDataSource,
      required this.userRepo})
      : super(UserDataInitial()) {
    on<UserEvent>((event, emit) async {
      /// Get User Data Info
      if (event is GetUserDataEvent) {
        emit(UserDataLoading());
        final userId = localDataSource.getCachedUserId();
        if (userId != null) {
          final userData = await authRepo.getUserData(userId);
          userData.fold((failure) => print('no user'), (user) {
            print(userId);
            return emit(UserDataLoaded(user: user));
          });
        }
      }

      /// Add Product To Cart Event
      if (event is AddProductToCartEvent) {
        final productsfromMap = await userRepo.addProductToCart(event.product);
        productsfromMap.fold((failure) {
          emit(const Error(message: 'Can\'t Add Now Please Try Later'));
        }, (productsMap) {
          emit(const UserCartState(isInCart: true));
          emit(const UserCartState(isInCart: false));
        });
      }

      /// Remove Product From Cart Event
      if (event is RemoveProductFromCartEvent) {
        emit(UserCartLoading());
        final cart = await userRepo.removeProductFromCart(event.product);
        cart.fold((failure) => emit(Error(message: failure.message)),
            (removed) => print('User Bloc Message : deleted'));
      }

      /// Get All Products In The Cart
      if (event is GetAllProductsInCartEvent) {
        emit(UserCartLoading());
        final cart = await userRepo.getAllProductsInCart();
        cart.fold((failure) => emit(Error(message: failure.message)),
            (products) => emit(UserCartLoaded(cartProducts: products)));
      }

      /// Add Product To Favorite Event
      if (event is AddProductToFavoriteEvent) {
        final productsfromMap =
            await userRepo.addProductToFavorites(event.favoriteProduct);
        productsfromMap.fold((failure) {
          emit(const Error(message: 'Can\'t Add Now Please Try Later'));
        }, (productsMap) {
          event.isFavorite = true;
          emit(UserFavoritesState(isFavorite: event.isFavorite));
        });
      }

      if (event is GetAllProductsInFavoriteEvent) {
        emit(UserFavoriteLoading());
        final favoriteProducts = await userRepo.getAllProductsInFavorite();
        favoriteProducts.fold((l) => emit(Error(message: l.message)),
            (r) => emit(UserFavoriteLoaded(products: r)));
      }
    });
  }
}
