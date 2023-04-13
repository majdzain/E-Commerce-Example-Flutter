import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';

import '../models/product.dart';

abstract class ProductsRepository {
  Future<Either<ProductsPagination, Failure>> getProducts([int? page]);
  Future<Either<Product, Failure>> getProductById(int productId);
}
