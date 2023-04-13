import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/core/models/price.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required int id,
    required String fileName,
    required Map<String, dynamic> conversions,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product(
      {required int id,
      required String title,
      required String description,
      required Price price,
      required ProductImage image}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductsPagination with _$ProductsPagination {
  const factory ProductsPagination({
    required List<Product> data,
    int? nextPage,
  }) = _ProductsPagination;

  factory ProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductsPaginationFromJson(json);
}
