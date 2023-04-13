// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return _ProductImage.fromJson(json);
}

/// @nodoc
mixin _$ProductImage {
  int get id => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  Map<String, dynamic> get conversions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductImageCopyWith<ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageCopyWith<$Res> {
  factory $ProductImageCopyWith(
          ProductImage value, $Res Function(ProductImage) then) =
      _$ProductImageCopyWithImpl<$Res, ProductImage>;
  @useResult
  $Res call({int id, String fileName, Map<String, dynamic> conversions});
}

/// @nodoc
class _$ProductImageCopyWithImpl<$Res, $Val extends ProductImage>
    implements $ProductImageCopyWith<$Res> {
  _$ProductImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? conversions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      conversions: null == conversions
          ? _value.conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductImageCopyWith<$Res>
    implements $ProductImageCopyWith<$Res> {
  factory _$$_ProductImageCopyWith(
          _$_ProductImage value, $Res Function(_$_ProductImage) then) =
      __$$_ProductImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String fileName, Map<String, dynamic> conversions});
}

/// @nodoc
class __$$_ProductImageCopyWithImpl<$Res>
    extends _$ProductImageCopyWithImpl<$Res, _$_ProductImage>
    implements _$$_ProductImageCopyWith<$Res> {
  __$$_ProductImageCopyWithImpl(
      _$_ProductImage _value, $Res Function(_$_ProductImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? conversions = null,
  }) {
    return _then(_$_ProductImage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      conversions: null == conversions
          ? _value._conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductImage implements _ProductImage {
  const _$_ProductImage(
      {required this.id,
      required this.fileName,
      required final Map<String, dynamic> conversions})
      : _conversions = conversions;

  factory _$_ProductImage.fromJson(Map<String, dynamic> json) =>
      _$$_ProductImageFromJson(json);

  @override
  final int id;
  @override
  final String fileName;
  final Map<String, dynamic> _conversions;
  @override
  Map<String, dynamic> get conversions {
    if (_conversions is EqualUnmodifiableMapView) return _conversions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_conversions);
  }

  @override
  String toString() {
    return 'ProductImage(id: $id, fileName: $fileName, conversions: $conversions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality()
                .equals(other._conversions, _conversions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName,
      const DeepCollectionEquality().hash(_conversions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductImageCopyWith<_$_ProductImage> get copyWith =>
      __$$_ProductImageCopyWithImpl<_$_ProductImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductImageToJson(
      this,
    );
  }
}

abstract class _ProductImage implements ProductImage {
  const factory _ProductImage(
      {required final int id,
      required final String fileName,
      required final Map<String, dynamic> conversions}) = _$_ProductImage;

  factory _ProductImage.fromJson(Map<String, dynamic> json) =
      _$_ProductImage.fromJson;

  @override
  int get id;
  @override
  String get fileName;
  @override
  Map<String, dynamic> get conversions;
  @override
  @JsonKey(ignore: true)
  _$$_ProductImageCopyWith<_$_ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;
  ProductImage get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      Price price,
      ProductImage image});

  $PriceCopyWith<$Res> get price;
  $ProductImageCopyWith<$Res> get image;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductImageCopyWith<$Res> get image {
    return $ProductImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      Price price,
      ProductImage image});

  @override
  $PriceCopyWith<$Res> get price;
  @override
  $ProductImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? image = null,
  }) {
    return _then(_$_Product(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  const _$_Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Price price;
  @override
  final ProductImage image;

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, price: $price, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, price, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final int id,
      required final String title,
      required final String description,
      required final Price price,
      required final ProductImage image}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  Price get price;
  @override
  ProductImage get image;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductsPagination _$ProductsPaginationFromJson(Map<String, dynamic> json) {
  return _ProductsPagination.fromJson(json);
}

/// @nodoc
mixin _$ProductsPagination {
  List<Product> get data => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsPaginationCopyWith<ProductsPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsPaginationCopyWith<$Res> {
  factory $ProductsPaginationCopyWith(
          ProductsPagination value, $Res Function(ProductsPagination) then) =
      _$ProductsPaginationCopyWithImpl<$Res, ProductsPagination>;
  @useResult
  $Res call({List<Product> data, int? nextPage});
}

/// @nodoc
class _$ProductsPaginationCopyWithImpl<$Res, $Val extends ProductsPagination>
    implements $ProductsPaginationCopyWith<$Res> {
  _$ProductsPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsPaginationCopyWith<$Res>
    implements $ProductsPaginationCopyWith<$Res> {
  factory _$$_ProductsPaginationCopyWith(_$_ProductsPagination value,
          $Res Function(_$_ProductsPagination) then) =
      __$$_ProductsPaginationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> data, int? nextPage});
}

/// @nodoc
class __$$_ProductsPaginationCopyWithImpl<$Res>
    extends _$ProductsPaginationCopyWithImpl<$Res, _$_ProductsPagination>
    implements _$$_ProductsPaginationCopyWith<$Res> {
  __$$_ProductsPaginationCopyWithImpl(
      _$_ProductsPagination _value, $Res Function(_$_ProductsPagination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? nextPage = freezed,
  }) {
    return _then(_$_ProductsPagination(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsPagination implements _ProductsPagination {
  const _$_ProductsPagination(
      {required final List<Product> data, this.nextPage})
      : _data = data;

  factory _$_ProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsPaginationFromJson(json);

  final List<Product> _data;
  @override
  List<Product> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? nextPage;

  @override
  String toString() {
    return 'ProductsPagination(data: $data, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsPagination &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsPaginationCopyWith<_$_ProductsPagination> get copyWith =>
      __$$_ProductsPaginationCopyWithImpl<_$_ProductsPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsPaginationToJson(
      this,
    );
  }
}

abstract class _ProductsPagination implements ProductsPagination {
  const factory _ProductsPagination(
      {required final List<Product> data,
      final int? nextPage}) = _$_ProductsPagination;

  factory _ProductsPagination.fromJson(Map<String, dynamic> json) =
      _$_ProductsPagination.fromJson;

  @override
  List<Product> get data;
  @override
  int? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsPaginationCopyWith<_$_ProductsPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
