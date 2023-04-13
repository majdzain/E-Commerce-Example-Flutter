import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/features/cart/domain/models/cart.dart';
part 'cart_state.freezed.dart';

extension DetectLoadingState on CartState {
  bool get isLoading => this is _CartStateLoading;
}

extension DetectAddState on CartState {
  int? get isAdded =>
      (this is _CartStateAdded) ? (this as _CartStateAdded).productId : null;
  String? get isAddError =>
      (this is _CartStateErrorAdd) ? (this as _CartStateErrorAdd).error : null;
}

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _CartStateInitial;
  const factory CartState.loading() = _CartStateLoading;
  const factory CartState.loaded({required Cart cart}) = _CartStateLoaded;
  const factory CartState.error({required String error}) = _CartStateError;
  const factory CartState.adding({Cart? cart, required int productId}) =
      _CartStateAdding;
  const factory CartState.added({required Cart cart, required int productId}) =
      _CartStateAdded;
  const factory CartState.errorAdd(
      {required String error,
      Cart? cart,
      required int productId}) = _CartStateErrorAdd;
  const factory CartState.removing(
      {required Cart cart, required int productId}) = _CartStateRemoving;
  const factory CartState.removed({required Cart cart}) = _CartStateRemoved;
  const factory CartState.errorRemove(
      {required String error,
      required Cart cart,
      required int productId}) = _CartStateErrorRemove;
}
