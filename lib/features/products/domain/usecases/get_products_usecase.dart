// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
import 'package:e_commerce_example_flutter/features/products/domain/repositories/products_repository.dart';

class GetProductsUsecase {
  ProductsRepository productsRepository;
  GetProductsUsecase({
    required this.productsRepository,
  });
  Future<Either<ProductsPagination, Failure>> call([int? page]) async {
    return await productsRepository.getProducts(page);
  }
}
