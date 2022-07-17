import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_model.dart';
import '../../../data/models/products_data_model.dart';
import '../../../data/repositories/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepoImpl cartRepo;
  CartBloc({required this.cartRepo}) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      /// Add Product To Cart Event
      if (event is AddProductToCartEvent) {
        final productsfromMap = await cartRepo.addProductToCart(event.product);
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
        final cart = await cartRepo.removeProductFromCart(event.product);
        cart.fold((failure) => emit(Error(message: failure.message)),
            (removed) => print('Cart Bloc Message : deleted From Cart'));
      }

      /// Get All Products In The Cart
      if (event is GetAllProductsInCartEvent) {
        emit(UserCartLoading());
        final cart = await cartRepo.getAllProductsInCart();
        cart.fold((failure) => emit(Error(message: failure.message)),
            (products) {
          emit(UserCartLoaded(cartProducts: products));
        });
      }

      if (event is IncrementCounter) {
        final countProduct =
            await cartRepo.updateProductCountInCart(event.count, event.product);
        countProduct.fold((l) => print('error'), (r) {
          print(r.count.toString());
        });
        final cart = await cartRepo.getAllProductsInCart();
        cart.fold((failure) => emit(Error(message: failure.message)),
            (products) {
          emit(UserCartLoaded(cartProducts: products));
        });
      }
      if (event is DecrementCounter) {
        final countProduct =
            await cartRepo.updateProductCountInCart(event.count, event.product);
        countProduct.fold((l) => print('error'), (r) {
          print(r.count.toString());
        });
        final cart = await cartRepo.getAllProductsInCart();
        cart.fold((failure) => emit(Error(message: failure.message)),
            (products) {
          emit(UserCartLoaded(cartProducts: products));
        });
      }
    });
  }
}
