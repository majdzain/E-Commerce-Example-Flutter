// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int productId) loading,
    required TResult Function(int productId, Product product) loaded,
    required TResult Function(int productId, String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int productId)? loading,
    TResult? Function(int productId, Product product)? loaded,
    TResult? Function(int productId, String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int productId)? loading,
    TResult Function(int productId, Product product)? loaded,
    TResult Function(int productId, String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateLoaded value) loaded,
    required TResult Function(_ProductStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateLoaded value)? loaded,
    TResult? Function(_ProductStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateLoaded value)? loaded,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProductStateInitialCopyWith<$Res> {
  factory _$$_ProductStateInitialCopyWith(_$_ProductStateInitial value,
          $Res Function(_$_ProductStateInitial) then) =
      __$$_ProductStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductStateInitialCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateInitial>
    implements _$$_ProductStateInitialCopyWith<$Res> {
  __$$_ProductStateInitialCopyWithImpl(_$_ProductStateInitial _value,
      $Res Function(_$_ProductStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProductStateInitial implements _ProductStateInitial {
  const _$_ProductStateInitial();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProductStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int productId) loading,
    required TResult Function(int productId, Product product) loaded,
    required TResult Function(int productId, String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int productId)? loading,
    TResult? Function(int productId, Product product)? loaded,
    TResult? Function(int productId, String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int productId)? loading,
    TResult Function(int productId, Product product)? loaded,
    TResult Function(int productId, String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateLoaded value) loaded,
    required TResult Function(_ProductStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateLoaded value)? loaded,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateLoaded value)? loaded,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ProductStateInitial implements ProductState {
  const factory _ProductStateInitial() = _$_ProductStateInitial;
}

/// @nodoc
abstract class _$$_ProductStateLoadingCopyWith<$Res> {
  factory _$$_ProductStateLoadingCopyWith(_$_ProductStateLoading value,
          $Res Function(_$_ProductStateLoading) then) =
      __$$_ProductStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$_ProductStateLoadingCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateLoading>
    implements _$$_ProductStateLoadingCopyWith<$Res> {
  __$$_ProductStateLoadingCopyWithImpl(_$_ProductStateLoading _value,
      $Res Function(_$_ProductStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$_ProductStateLoading(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductStateLoading implements _ProductStateLoading {
  const _$_ProductStateLoading({required this.productId});

  @override
  final int productId;

  @override
  String toString() {
    return 'ProductState.loading(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductStateLoading &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateLoadingCopyWith<_$_ProductStateLoading> get copyWith =>
      __$$_ProductStateLoadingCopyWithImpl<_$_ProductStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int productId) loading,
    required TResult Function(int productId, Product product) loaded,
    required TResult Function(int productId, String error) error,
  }) {
    return loading(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int productId)? loading,
    TResult? Function(int productId, Product product)? loaded,
    TResult? Function(int productId, String error)? error,
  }) {
    return loading?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int productId)? loading,
    TResult Function(int productId, Product product)? loaded,
    TResult Function(int productId, String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateLoaded value) loaded,
    required TResult Function(_ProductStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateLoaded value)? loaded,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateLoaded value)? loaded,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ProductStateLoading implements ProductState {
  const factory _ProductStateLoading({required final int productId}) =
      _$_ProductStateLoading;

  int get productId;
  @JsonKey(ignore: true)
  _$$_ProductStateLoadingCopyWith<_$_ProductStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProductStateLoadedCopyWith<$Res> {
  factory _$$_ProductStateLoadedCopyWith(_$_ProductStateLoaded value,
          $Res Function(_$_ProductStateLoaded) then) =
      __$$_ProductStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_ProductStateLoadedCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateLoaded>
    implements _$$_ProductStateLoadedCopyWith<$Res> {
  __$$_ProductStateLoadedCopyWithImpl(
      _$_ProductStateLoaded _value, $Res Function(_$_ProductStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? product = null,
  }) {
    return _then(_$_ProductStateLoaded(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$_ProductStateLoaded implements _ProductStateLoaded {
  const _$_ProductStateLoaded({required this.productId, required this.product});

  @override
  final int productId;
  @override
  final Product product;

  @override
  String toString() {
    return 'ProductState.loaded(productId: $productId, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductStateLoaded &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateLoadedCopyWith<_$_ProductStateLoaded> get copyWith =>
      __$$_ProductStateLoadedCopyWithImpl<_$_ProductStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int productId) loading,
    required TResult Function(int productId, Product product) loaded,
    required TResult Function(int productId, String error) error,
  }) {
    return loaded(productId, product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int productId)? loading,
    TResult? Function(int productId, Product product)? loaded,
    TResult? Function(int productId, String error)? error,
  }) {
    return loaded?.call(productId, product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int productId)? loading,
    TResult Function(int productId, Product product)? loaded,
    TResult Function(int productId, String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(productId, product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateLoaded value) loaded,
    required TResult Function(_ProductStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateLoaded value)? loaded,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateLoaded value)? loaded,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ProductStateLoaded implements ProductState {
  const factory _ProductStateLoaded(
      {required final int productId,
      required final Product product}) = _$_ProductStateLoaded;

  int get productId;
  Product get product;
  @JsonKey(ignore: true)
  _$$_ProductStateLoadedCopyWith<_$_ProductStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProductStateErrorCopyWith<$Res> {
  factory _$$_ProductStateErrorCopyWith(_$_ProductStateError value,
          $Res Function(_$_ProductStateError) then) =
      __$$_ProductStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, String error});
}

/// @nodoc
class __$$_ProductStateErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductStateError>
    implements _$$_ProductStateErrorCopyWith<$Res> {
  __$$_ProductStateErrorCopyWithImpl(
      _$_ProductStateError _value, $Res Function(_$_ProductStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? error = null,
  }) {
    return _then(_$_ProductStateError(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductStateError implements _ProductStateError {
  const _$_ProductStateError({required this.productId, required this.error});

  @override
  final int productId;
  @override
  final String error;

  @override
  String toString() {
    return 'ProductState.error(productId: $productId, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductStateError &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateErrorCopyWith<_$_ProductStateError> get copyWith =>
      __$$_ProductStateErrorCopyWithImpl<_$_ProductStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int productId) loading,
    required TResult Function(int productId, Product product) loaded,
    required TResult Function(int productId, String error) error,
  }) {
    return error(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int productId)? loading,
    TResult? Function(int productId, Product product)? loaded,
    TResult? Function(int productId, String error)? error,
  }) {
    return error?.call(productId, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int productId)? loading,
    TResult Function(int productId, Product product)? loaded,
    TResult Function(int productId, String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(productId, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductStateInitial value) initial,
    required TResult Function(_ProductStateLoading value) loading,
    required TResult Function(_ProductStateLoaded value) loaded,
    required TResult Function(_ProductStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductStateInitial value)? initial,
    TResult? Function(_ProductStateLoading value)? loading,
    TResult? Function(_ProductStateLoaded value)? loaded,
    TResult? Function(_ProductStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductStateInitial value)? initial,
    TResult Function(_ProductStateLoading value)? loading,
    TResult Function(_ProductStateLoaded value)? loaded,
    TResult Function(_ProductStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ProductStateError implements ProductState {
  const factory _ProductStateError(
      {required final int productId,
      required final String error}) = _$_ProductStateError;

  int get productId;
  String get error;
  @JsonKey(ignore: true)
  _$$_ProductStateErrorCopyWith<_$_ProductStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
