// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
import 'package:e_commerce_example_flutter/features/products/domain/repositories/products_repository.dart';

class GetProductByIdUsecase {
  ProductsRepository productsRepository;
  GetProductByIdUsecase({
    required this.productsRepository,
  });
  Future<Either<Product, Failure>> call(int productId) async {
    return await productsRepository.getProductById(productId);
  }
}
