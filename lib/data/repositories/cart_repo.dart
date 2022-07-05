import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../core/error/failuer.dart';
import '../data_services/local_data_sources.dart';
import '../data_services/remote_data_sources.dart';
import '../models/cart_model.dart';
import '../models/products_data_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartDataModel>>> getAllProductsInCart();
  Future<Either<Failure, Unit>> addProductToCart(
    ProductDataModel product,
  );
  Future<Either<Failure, Unit>> removeProductFromCart(ProductDataModel product);

  Future<Either<Failure, CartDataModel>> updateProductCountInCart(
      int count, ProductDataModel product);
}

class CartRepoImpl extends CartRepo {
  final LocalDataSourceImpl localDataSource;

  CartRepoImpl({required this.localDataSource});

  /// Cart Repository Implement
  @override
  Future<Either<Failure, List<CartDataModel>>> getAllProductsInCart() async {
    try {
      final List<CartDataModel> cartProducts = [];
      final userId = localDataSource.getCachedUserId();
      final cartData =
          await RemoteDataSourceImp.instance.getProductsInCart(userId);
      for (var products in cartData.docs) {
        cartProducts.add(CartDataModel.fromJson(products.data()));
      }
      return Right(cartProducts);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> addProductToCart(
    ProductDataModel product,
  ) async {
    try {
      final userId = localDataSource.getCachedUserId();
      final newProductInCart = CartDataModel(count: 1, product: product);
      await RemoteDataSourceImp.instance
          .addProductsToCart(userId, newProductInCart);

      return Right(unit);
    } catch (_) {
      return const Left(
        Failure(message: 'Failed to add product to cart'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> removeProductFromCart(
      ProductDataModel product) async {
    try {
      final userId = localDataSource.getCachedUserId();
      await RemoteDataSourceImp.instance
          .removeProductFromCart(userId, product.id);
      return Right(unit);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, CartDataModel>> updateProductCountInCart(
      int count, ProductDataModel product) async {
    try {
      final userId = localDataSource.getCachedUserId();
      final CartDataModel cartProduct =
          CartDataModel(count: count, product: product);

      await RemoteDataSourceImp.instance
          .updateCartProducts(userId, cartProduct);
      return Right(cartProduct);
    } on PlatformException catch (e) {
      return Left(
        Failure(message: 'Failed to update product to cart : ${e.code}'),
      );
    }
  }
}
