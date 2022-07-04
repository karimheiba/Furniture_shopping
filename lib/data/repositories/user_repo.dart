import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shopping_app/core/error/failuer.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/data_services/remote_data_sources.dart';
import 'package:furniture_shopping_app/data/models/cart_model.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

abstract class UserRepo {
  Future<Either<Failure, List<ProductDataModel>>> getAllProductsInFavorite();
  Future<Either<Failure, Unit>> addProductToFavorites(ProductDataModel product);
  Future<Either<Failure, Unit>> removeProductToFavorites(
      ProductDataModel product);
  Future<Either<Failure, List<CartDataModel>>> getAllProductsInCart();
  Future<Either<Failure, Unit>> addProductToCart(
    ProductDataModel product,
  );
  Future<Either<Failure, Unit>> removeProductFromCart(ProductDataModel product);
}

class UserRepoImpl extends UserRepo {
  final LocalDataSourceImpl localDataSource;

  UserRepoImpl({required this.localDataSource});

  /// Add product to cart
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
  Future<Either<Failure, Unit>> addProductToFavorites(
      ProductDataModel product) async {
    try {
      final userId = localDataSource.getCachedUserId();
      await RemoteDataSourceImp.instance.addProductsToFavorite(userId, product);
      return Right(unit);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeProductToFavorites(
      ProductDataModel product) async {
    try {
      final userId = localDataSource.getCachedUserId();
      await RemoteDataSourceImp.instance
          .removeProductFromFavorite(userId, product.id);
      return Right(unit);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

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
  Future<Either<Failure, List<ProductDataModel>>> getAllProductsInFavorite() {
    // TODO: implement getAllProductsInFavorite
    throw UnimplementedError();
  }
}
