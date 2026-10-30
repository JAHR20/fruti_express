// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderPreview {

 int get subtotal; int get shippingCost; int get discount; int get total;
/// Create a copy of OrderPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPreviewCopyWith<OrderPreview> get copyWith => _$OrderPreviewCopyWithImpl<OrderPreview>(this as OrderPreview, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPreview&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,subtotal,shippingCost,discount,total);

@override
String toString() {
  return 'OrderPreview(subtotal: $subtotal, shippingCost: $shippingCost, discount: $discount, total: $total)';
}


}

/// @nodoc
abstract mixin class $OrderPreviewCopyWith<$Res>  {
  factory $OrderPreviewCopyWith(OrderPreview value, $Res Function(OrderPreview) _then) = _$OrderPreviewCopyWithImpl;
@useResult
$Res call({
 int subtotal, int shippingCost, int discount, int total
});




}
/// @nodoc
class _$OrderPreviewCopyWithImpl<$Res>
    implements $OrderPreviewCopyWith<$Res> {
  _$OrderPreviewCopyWithImpl(this._self, this._then);

  final OrderPreview _self;
  final $Res Function(OrderPreview) _then;

/// Create a copy of OrderPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? shippingCost = null,Object? discount = null,Object? total = null,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPreview].
extension OrderPreviewPatterns on OrderPreview {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPreview() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPreview value)  $default,){
final _that = this;
switch (_that) {
case _OrderPreview():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPreview value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPreview() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subtotal,  int shippingCost,  int discount,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPreview() when $default != null:
return $default(_that.subtotal,_that.shippingCost,_that.discount,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subtotal,  int shippingCost,  int discount,  int total)  $default,) {final _that = this;
switch (_that) {
case _OrderPreview():
return $default(_that.subtotal,_that.shippingCost,_that.discount,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subtotal,  int shippingCost,  int discount,  int total)?  $default,) {final _that = this;
switch (_that) {
case _OrderPreview() when $default != null:
return $default(_that.subtotal,_that.shippingCost,_that.discount,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _OrderPreview implements OrderPreview {
  const _OrderPreview({required this.subtotal, required this.shippingCost, required this.discount, required this.total});
  

@override final  int subtotal;
@override final  int shippingCost;
@override final  int discount;
@override final  int total;

/// Create a copy of OrderPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPreviewCopyWith<_OrderPreview> get copyWith => __$OrderPreviewCopyWithImpl<_OrderPreview>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPreview&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,subtotal,shippingCost,discount,total);

@override
String toString() {
  return 'OrderPreview(subtotal: $subtotal, shippingCost: $shippingCost, discount: $discount, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderPreviewCopyWith<$Res> implements $OrderPreviewCopyWith<$Res> {
  factory _$OrderPreviewCopyWith(_OrderPreview value, $Res Function(_OrderPreview) _then) = __$OrderPreviewCopyWithImpl;
@override @useResult
$Res call({
 int subtotal, int shippingCost, int discount, int total
});




}
/// @nodoc
class __$OrderPreviewCopyWithImpl<$Res>
    implements _$OrderPreviewCopyWith<$Res> {
  __$OrderPreviewCopyWithImpl(this._self, this._then);

  final _OrderPreview _self;
  final $Res Function(_OrderPreview) _then;

/// Create a copy of OrderPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? shippingCost = null,Object? discount = null,Object? total = null,}) {
  return _then(_OrderPreview(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
