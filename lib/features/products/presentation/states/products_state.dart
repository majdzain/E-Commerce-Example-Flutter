import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
part 'products_state.freezed.dart';

extension DetectLoadingState on ProductsState {
  bool get isLoading =>
      this is _ProductsStateLoading || this is _ProductsStateNextLoading;
}

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _ProductsStateInitial;
  const factory ProductsState.loading() = _ProductsStateLoading;
  const factory ProductsState.loaded(
      {required List<Product> products,
      required bool isLastPage}) = _ProductsStateLoaded;
  const factory ProductsState.nextLoading({required List<Product> products}) =
      _ProductsStateNextLoading;
  const factory ProductsState.error({required String error}) =
      _ProductsStateError;
  const factory ProductsState.nextError(
      {required String error,
      required List<Product> products}) = _ProductsStateNextError;
}
