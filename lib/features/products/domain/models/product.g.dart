// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductImage _$$_ProductImageFromJson(Map<String, dynamic> json) =>
    _$_ProductImage(
      id: json['id'] as int,
      fileName: json['file_name'] as String,
      conversions: json['conversions'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_ProductImageToJson(_$_ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'conversions': instance.conversions,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      image: ProductImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
    };

_$_ProductsPagination _$$_ProductsPaginationFromJson(
        Map<String, dynamic> json) =>
    _$_ProductsPagination(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_ProductsPaginationToJson(
        _$_ProductsPagination instance) =>
    <String, dynamic>{
      'data': instance.data,
      'nextPage': instance.nextPage,
    };
