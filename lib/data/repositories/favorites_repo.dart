import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../core/error/failuer.dart';
import '../data_services/local_data_sources.dart';
import '../data_services/remote_data_sources.dart';
import '../models/products_data_model.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<ProductDataModel>>> getAllProductsInFavorite();

  Future<Either<Failure, Unit>> addProductToFavorites(ProductDataModel product);
  Future<Either<Failure, Unit>> removeProductFromFavorites(
      ProductDataModel product);
}

class FavoritesRepoImpl extends FavoritesRepo {
  final LocalDataSourceImpl localDataSource;

  FavoritesRepoImpl({required this.localDataSource});

  /// Favorite Repository Implement
  @override
  Future<Either<Failure, List<ProductDataModel>>>
      getAllProductsInFavorite() async {
    try {
      final List<ProductDataModel> favoriteProducts = [];
      final userId = localDataSource.getCachedUserId();
      final favoritiesData =
          await RemoteDataSourceImp.instance.getProductsInFavorites(userId);
      for (var products in favoritiesData.docs) {
        favoriteProducts.add(ProductDataModel.fromJson(products.data()));
      }
      return Right(favoriteProducts);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
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
  Future<Either<Failure, Unit>> removeProductFromFavorites(
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
}
