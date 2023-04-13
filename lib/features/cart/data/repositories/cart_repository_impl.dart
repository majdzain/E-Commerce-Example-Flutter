// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/enums.dart';
import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';

import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/core/network/network_info.dart';
import 'package:e_commerce_example_flutter/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  NetworkInfo networkInfo;
  CartRemoteDatasource cartRemoteDatasource;
  CartRepositoryImpl({
    required this.networkInfo,
    required this.cartRemoteDatasource,
  });
  @override
  Future<Either<Cart, Failure>> addToCart(int productId, int quantity) async {
    if (await networkInfo.isConnected) {
      try {
        final map = await cartRemoteDatasource.addToCart(productId, quantity);
        return Left(Cart.fromJson(map));
      } on ProductException catch (e) {
        return Right(ProductFailure(
            error: e.statusCode != null
                ? getProductErrorFromStatusCode(e.statusCode!)
                : null));
      } on UnauthenticatedException {
        return Right(UnauthenticatedFailure());
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<Cart, Failure>> getCart() async {
    if (await networkInfo.isConnected) {
      try {
        final map = await cartRemoteDatasource.getCart();
        return Left(Cart.fromJson(map));
      } on UnauthenticatedException {
        return Right(UnauthenticatedFailure());
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<Cart, Failure>> removeFromCart(int productId) async {
    if (await networkInfo.isConnected) {
      try {
        final map = await cartRemoteDatasource.removeFromCart(productId);
        return Left(Cart.fromJson(map));
      } on ProductException catch (e) {
        return Right(ProductFailure(
            error: e.statusCode != null
                ? getProductErrorFromStatusCode(e.statusCode!)
                : null));
      } on UnauthenticatedException {
        return Right(UnauthenticatedFailure());
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }
}
