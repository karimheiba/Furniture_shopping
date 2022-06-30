import 'package:dartz/dartz.dart';
import 'package:furniture_shopping_app/core/error/failuer.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/data_services/remote_data_sources.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

abstract class UserRepo {
  Future<Either<Failure, List<ProductDataModel>>> addProductToFavorites();
  Future<Either<Failure, List<ProductDataModel>>> removeProductToFavorites();
  Future<Either<Failure, List<Map<String, dynamic>>>> addProductToCart(

    ProductDataModel product,
  );
  Future<Either<Failure, List<Map<String, dynamic>>>> removeProductFromCart(
    List<Map<String, dynamic>> cartProducts,
    String productId,
  );
}

class UserRepoImpl extends UserRepo {
  final LocalDataSourceImpl localDataSource;

  UserRepoImpl({required this.localDataSource});

  /// Add product to cart
  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> addProductToCart(
    
    ProductDataModel product,
  ) async {
    try {
      final userId = localDataSource.getCachedUserId();
      List<Map<String, dynamic>> newCartProducts = [];
      newCartProducts.add({
        'product': product,
        'count': 1,
      });
      final cartProductToJson = newCartProducts.map((productMap) {
        final productInCart = productMap['product'] as ProductDataModel;
        final count = productMap['count'];
        return {
          'product': productInCart,
          'count': count,
        };
      }).toList();

      await RemoteDataSourceImp.instance
          .addProductsToCart(userId, cartProductToJson);
      return Right(newCartProducts);
    } catch (_) {
      return const Left(
        Failure(message: 'Failed to add product to cart'),
      );
    }
  }

  /// Remove product from cart
  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> removeProductFromCart(
    List<Map<String, dynamic>> cartProducts,
    String productId,
  ) async {
    try {
      final userId = localDataSource.getCachedUserId();
      final newCartProducts = List<Map<String, dynamic>>.from(cartProducts);
      newCartProducts
          .removeWhere((product) => product['product'].id == productId);

      final cartProductsToJson = newCartProducts.map((productMap) {
        final product = (productMap['products'] as ProductDataModel).toJson();
        final count = productMap['count'];
        return {
          'product': product,
          'count': count,
        };
      }).toList();
      await RemoteDataSourceImp.instance
          .updateCartProducts(userId, cartProductsToJson);

      return Right(newCartProducts);
    } catch (_) {
      return const Left(
        Failure(message: 'Failed to add product to cart'),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductDataModel>>>
      addProductToFavorites() async {
    // TODO: implement addProductToFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductDataModel>>>
      removeProductToFavorites() async {
    // TODO: implement removeProductToFavorites
    throw UnimplementedError();
  }
}
