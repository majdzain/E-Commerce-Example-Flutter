// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/repositories/cart_repository.dart';

class GetCartUsecase {
  CartRepository cartRepository;
  GetCartUsecase({
    required this.cartRepository,
  });
  Future<Either<Cart, Failure>> call() async {
    return await cartRepository.getCart();
  }
}
