// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/enums.dart';
import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';

import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/products/data/datasources/products_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
import 'package:e_commerce_example_flutter/features/products/domain/repositories/products_repository.dart';

import '../../../../core/network/network_info.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  NetworkInfo networkInfo;
  ProductsRemoteDatasource productsRemoteDatasource;
  ProductsRepositoryImpl({
    required this.networkInfo,
    required this.productsRemoteDatasource,
  });
  @override
  Future<Either<Product, Failure>> getProductById(int productId) async {
    if (await networkInfo.isConnected) {
      try {
        final map = await productsRemoteDatasource.getProductById(productId);
        return Left(Product.fromJson(map));
      } on ProductException catch (e) {
        return Right(ProductFailure(
            error: e.statusCode != null
                ? getProductErrorFromStatusCode(e.statusCode!)
                : null));
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<ProductsPagination, Failure>> getProducts([int? page]) async {
    if (await networkInfo.isConnected) {
      try {
        final map = await productsRemoteDatasource.getProducts(page);
        return Left(ProductsPagination.fromJson(map));
      } on ProductsException {
        return Right(ProductsFailure());
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }
}
