import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/features/products/domain/models/product.dart';
part 'product_state.freezed.dart';

extension DetectLoadingState on ProductState {
  bool get isLoading => this is _ProductStateLoading;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _ProductStateInitial;
  const factory ProductState.loading({required int productId}) =
      _ProductStateLoading;
  const factory ProductState.loaded(
      {required int productId, required Product product}) = _ProductStateLoaded;
  const factory ProductState.error(
      {required int productId, required String error}) = _ProductStateError;
}
