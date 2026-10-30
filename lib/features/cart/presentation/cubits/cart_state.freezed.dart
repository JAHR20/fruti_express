// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 List<CartItem> get items; DeliveryMethod? get deliveryMethod; PaymentMethodType get paymentMethod; Address? get selectedAddress; String? get branchId; bool get isLoading; dynamic get isCalculating; String? get processingProductId; String? get errorMessage; String? get operationError; bool get operationSuccessful; int get baseShippingRate; int? get freeShippingThreshold; Coupon? get appliedCoupon; int get discountAmount; OrderPreview? get orderPreview;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.selectedAddress, selectedAddress) || other.selectedAddress == selectedAddress)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.isCalculating, isCalculating)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.baseShippingRate, baseShippingRate) || other.baseShippingRate == baseShippingRate)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.appliedCoupon, appliedCoupon) || other.appliedCoupon == appliedCoupon)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.orderPreview, orderPreview) || other.orderPreview == orderPreview));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),deliveryMethod,paymentMethod,selectedAddress,branchId,isLoading,const DeepCollectionEquality().hash(isCalculating),processingProductId,errorMessage,operationError,operationSuccessful,baseShippingRate,freeShippingThreshold,appliedCoupon,discountAmount,orderPreview);

@override
String toString() {
  return 'CartState(items: $items, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, selectedAddress: $selectedAddress, branchId: $branchId, isLoading: $isLoading, isCalculating: $isCalculating, processingProductId: $processingProductId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, baseShippingRate: $baseShippingRate, freeShippingThreshold: $freeShippingThreshold, appliedCoupon: $appliedCoupon, discountAmount: $discountAmount, orderPreview: $orderPreview)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 List<CartItem> items, DeliveryMethod? deliveryMethod, PaymentMethodType paymentMethod, Address? selectedAddress, String? branchId, bool isLoading, dynamic isCalculating, String? processingProductId, String? errorMessage, String? operationError, bool operationSuccessful, int baseShippingRate, int? freeShippingThreshold, Coupon? appliedCoupon, int discountAmount, OrderPreview? orderPreview
});


$AddressCopyWith<$Res>? get selectedAddress;$CouponCopyWith<$Res>? get appliedCoupon;$OrderPreviewCopyWith<$Res>? get orderPreview;

}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? deliveryMethod = freezed,Object? paymentMethod = null,Object? selectedAddress = freezed,Object? branchId = freezed,Object? isLoading = null,Object? isCalculating = freezed,Object? processingProductId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? baseShippingRate = null,Object? freeShippingThreshold = freezed,Object? appliedCoupon = freezed,Object? discountAmount = null,Object? orderPreview = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,selectedAddress: freezed == selectedAddress ? _self.selectedAddress : selectedAddress // ignore: cast_nullable_to_non_nullable
as Address?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalculating: freezed == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as dynamic,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,baseShippingRate: null == baseShippingRate ? _self.baseShippingRate : baseShippingRate // ignore: cast_nullable_to_non_nullable
as int,freeShippingThreshold: freezed == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int?,appliedCoupon: freezed == appliedCoupon ? _self.appliedCoupon : appliedCoupon // ignore: cast_nullable_to_non_nullable
as Coupon?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,orderPreview: freezed == orderPreview ? _self.orderPreview : orderPreview // ignore: cast_nullable_to_non_nullable
as OrderPreview?,
  ));
}
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get selectedAddress {
    if (_self.selectedAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.selectedAddress!, (value) {
    return _then(_self.copyWith(selectedAddress: value));
  });
}/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponCopyWith<$Res>? get appliedCoupon {
    if (_self.appliedCoupon == null) {
    return null;
  }

  return $CouponCopyWith<$Res>(_self.appliedCoupon!, (value) {
    return _then(_self.copyWith(appliedCoupon: value));
  });
}/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPreviewCopyWith<$Res>? get orderPreview {
    if (_self.orderPreview == null) {
    return null;
  }

  return $OrderPreviewCopyWith<$Res>(_self.orderPreview!, (value) {
    return _then(_self.copyWith(orderPreview: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartItem> items,  DeliveryMethod? deliveryMethod,  PaymentMethodType paymentMethod,  Address? selectedAddress,  String? branchId,  bool isLoading,  dynamic isCalculating,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  int baseShippingRate,  int? freeShippingThreshold,  Coupon? appliedCoupon,  int discountAmount,  OrderPreview? orderPreview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.deliveryMethod,_that.paymentMethod,_that.selectedAddress,_that.branchId,_that.isLoading,_that.isCalculating,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.baseShippingRate,_that.freeShippingThreshold,_that.appliedCoupon,_that.discountAmount,_that.orderPreview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartItem> items,  DeliveryMethod? deliveryMethod,  PaymentMethodType paymentMethod,  Address? selectedAddress,  String? branchId,  bool isLoading,  dynamic isCalculating,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  int baseShippingRate,  int? freeShippingThreshold,  Coupon? appliedCoupon,  int discountAmount,  OrderPreview? orderPreview)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.items,_that.deliveryMethod,_that.paymentMethod,_that.selectedAddress,_that.branchId,_that.isLoading,_that.isCalculating,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.baseShippingRate,_that.freeShippingThreshold,_that.appliedCoupon,_that.discountAmount,_that.orderPreview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartItem> items,  DeliveryMethod? deliveryMethod,  PaymentMethodType paymentMethod,  Address? selectedAddress,  String? branchId,  bool isLoading,  dynamic isCalculating,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  int baseShippingRate,  int? freeShippingThreshold,  Coupon? appliedCoupon,  int discountAmount,  OrderPreview? orderPreview)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.deliveryMethod,_that.paymentMethod,_that.selectedAddress,_that.branchId,_that.isLoading,_that.isCalculating,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.baseShippingRate,_that.freeShippingThreshold,_that.appliedCoupon,_that.discountAmount,_that.orderPreview);case _:
  return null;

}
}

}

/// @nodoc


class _CartState extends CartState {
  const _CartState({final  List<CartItem> items = const <CartItem>[], this.deliveryMethod, this.paymentMethod = PaymentMethodType.cashOnDelivery, this.selectedAddress, this.branchId, this.isLoading = false, this.isCalculating = false, this.processingProductId, this.errorMessage, this.operationError, this.operationSuccessful = false, this.baseShippingRate = 0, this.freeShippingThreshold, this.appliedCoupon, this.discountAmount = 0, this.orderPreview}): _items = items,super._();
  

 final  List<CartItem> _items;
@override@JsonKey() List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DeliveryMethod? deliveryMethod;
@override@JsonKey() final  PaymentMethodType paymentMethod;
@override final  Address? selectedAddress;
@override final  String? branchId;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  dynamic isCalculating;
@override final  String? processingProductId;
@override final  String? errorMessage;
@override final  String? operationError;
@override@JsonKey() final  bool operationSuccessful;
@override@JsonKey() final  int baseShippingRate;
@override final  int? freeShippingThreshold;
@override final  Coupon? appliedCoupon;
@override@JsonKey() final  int discountAmount;
@override final  OrderPreview? orderPreview;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.selectedAddress, selectedAddress) || other.selectedAddress == selectedAddress)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.isCalculating, isCalculating)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.baseShippingRate, baseShippingRate) || other.baseShippingRate == baseShippingRate)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.appliedCoupon, appliedCoupon) || other.appliedCoupon == appliedCoupon)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.orderPreview, orderPreview) || other.orderPreview == orderPreview));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),deliveryMethod,paymentMethod,selectedAddress,branchId,isLoading,const DeepCollectionEquality().hash(isCalculating),processingProductId,errorMessage,operationError,operationSuccessful,baseShippingRate,freeShippingThreshold,appliedCoupon,discountAmount,orderPreview);

@override
String toString() {
  return 'CartState(items: $items, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, selectedAddress: $selectedAddress, branchId: $branchId, isLoading: $isLoading, isCalculating: $isCalculating, processingProductId: $processingProductId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, baseShippingRate: $baseShippingRate, freeShippingThreshold: $freeShippingThreshold, appliedCoupon: $appliedCoupon, discountAmount: $discountAmount, orderPreview: $orderPreview)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 List<CartItem> items, DeliveryMethod? deliveryMethod, PaymentMethodType paymentMethod, Address? selectedAddress, String? branchId, bool isLoading, dynamic isCalculating, String? processingProductId, String? errorMessage, String? operationError, bool operationSuccessful, int baseShippingRate, int? freeShippingThreshold, Coupon? appliedCoupon, int discountAmount, OrderPreview? orderPreview
});


@override $AddressCopyWith<$Res>? get selectedAddress;@override $CouponCopyWith<$Res>? get appliedCoupon;@override $OrderPreviewCopyWith<$Res>? get orderPreview;

}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? deliveryMethod = freezed,Object? paymentMethod = null,Object? selectedAddress = freezed,Object? branchId = freezed,Object? isLoading = null,Object? isCalculating = freezed,Object? processingProductId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? baseShippingRate = null,Object? freeShippingThreshold = freezed,Object? appliedCoupon = freezed,Object? discountAmount = null,Object? orderPreview = freezed,}) {
  return _then(_CartState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,selectedAddress: freezed == selectedAddress ? _self.selectedAddress : selectedAddress // ignore: cast_nullable_to_non_nullable
as Address?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalculating: freezed == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as dynamic,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,baseShippingRate: null == baseShippingRate ? _self.baseShippingRate : baseShippingRate // ignore: cast_nullable_to_non_nullable
as int,freeShippingThreshold: freezed == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int?,appliedCoupon: freezed == appliedCoupon ? _self.appliedCoupon : appliedCoupon // ignore: cast_nullable_to_non_nullable
as Coupon?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,orderPreview: freezed == orderPreview ? _self.orderPreview : orderPreview // ignore: cast_nullable_to_non_nullable
as OrderPreview?,
  ));
}

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get selectedAddress {
    if (_self.selectedAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.selectedAddress!, (value) {
    return _then(_self.copyWith(selectedAddress: value));
  });
}/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponCopyWith<$Res>? get appliedCoupon {
    if (_self.appliedCoupon == null) {
    return null;
  }

  return $CouponCopyWith<$Res>(_self.appliedCoupon!, (value) {
    return _then(_self.copyWith(appliedCoupon: value));
  });
}/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPreviewCopyWith<$Res>? get orderPreview {
    if (_self.orderPreview == null) {
    return null;
  }

  return $OrderPreviewCopyWith<$Res>(_self.orderPreview!, (value) {
    return _then(_self.copyWith(orderPreview: value));
  });
}
}

// dart format on
