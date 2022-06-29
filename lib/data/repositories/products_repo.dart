import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shopping_app/core/error/failuer.dart';
import 'package:furniture_shopping_app/data/data_services/remote_data_sources.dart';

import '../models/products_data_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductDataModel>>> getAllProducts();
  Future<Either<Failure, List<ProductDataModel>>> getProductsInCategory(
      {required String categoryId});
  Future<Either<Failure, List<ProductDataModel>>> getSearchProducts(
      {required String productName});
}

class ProductsRepoImpl extends ProductsRepo {
  @override
  Future<Either<Failure, List<ProductDataModel>>> getAllProducts() async {
    try {
      final List<ProductDataModel> allProducts = [];
      final products = await RemoteDataSourceImp.instance.getAllProducts();
      for (var product in products.docs) {
        allProducts.add(ProductDataModel.fromJson(product.data()));
      }
      return Right(allProducts);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, List<ProductDataModel>>> getProductsInCategory(
      {required String categoryId}) async {
    try {
      final List<ProductDataModel> productsInCategory = [];
      final products = await RemoteDataSourceImp.instance.getAllProducts();
      for (var product in products.docs) {
        productsInCategory.add(ProductDataModel.fromJson(product.data()));
      }
      productsInCategory.removeWhere(
          (categoryProduct) => categoryProduct.category.id != categoryId);
      return Right(productsInCategory);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, List<ProductDataModel>>> getSearchProducts(
      {required String productName}) async {
    try {
      final List<ProductDataModel> searchProducts = [];
      final products = await RemoteDataSourceImp.instance.getAllProducts();
      for (var data in products.docs) {
        searchProducts.add(ProductDataModel.fromJson(data.data()));
      }
      searchProducts.removeWhere((product) =>
          !product.name.toLowerCase().contains(productName.toLowerCase()));
      return Right(searchProducts);
    }on PlatformException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }
}
