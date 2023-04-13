import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/core/models/price.dart';
part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int id,
    required int productId,
    required Price total,
    required Price unitPrice,
    required int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
class Cart with _$Cart {
  const factory Cart(
      {required int id,
      required Price total,
      required int itemsNumber,
      @Default([]) List<CartItem> items}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
