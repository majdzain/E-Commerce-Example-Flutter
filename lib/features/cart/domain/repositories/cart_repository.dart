import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/models/product.dart';

abstract class CartRepository {
  Future<Either<Cart, Failure>> getCart();
  Future<Either<Cart, Failure>> addToCart(int productId, int quantity);
  Future<Either<Cart, Failure>> removeFromCart(int productId);
}
