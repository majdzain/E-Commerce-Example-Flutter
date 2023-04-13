// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      id: json['id'] as int,
      productId: json['product_id'] as int,
      total: Price.fromJson(json['total'] as Map<String, dynamic>),
      unitPrice: Price.fromJson(json['unit_price'] as Map<String, dynamic>),
      quantity: json['total_quantity'] as int,
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'total': instance.total,
      'unit_price': instance.unitPrice,
      'total_quantity': instance.quantity,
    };

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      id: json['id'] as int,
      total: Price.fromJson(json['total'] as Map<String, dynamic>),
      itemsNumber: json['items'] as int,
      items: (json['products'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'items': instance.itemsNumber,
      'products': instance.items,
    };
