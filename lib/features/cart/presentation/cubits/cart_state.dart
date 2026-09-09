import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/entities/coupon.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(<CartItem>[]) List<CartItem> items,
    DeliveryMethod? deliveryMethod, 
    Address? selectedAddress, 
    String? branchId, 
    @Default(false) bool isLoading,
    String? processingProductId, 
    String? errorMessage,
    String? operationError,
    @Default(false) bool operationSuccessful,
    @Default(0) int baseShippingRate,
    int? freeShippingThreshold,
    Coupon? appliedCoupon, 
    @Default(0) int discountAmount,
  }) = _CartState;

  const CartState._();

  int get total {
    return items.fold(0, (sum, item) => sum + item.subtotal);
  }

  int get itemCount => items.length;

  bool get isEmpty => items.isEmpty; 

  bool get hasItems => items.isNotEmpty;

  bool get hasDeliveryMethod => deliveryMethod != null; 

  bool get isHomeDelivery => deliveryMethod == DeliveryMethod.homeDelivery;

  bool get isPickup => deliveryMethod == DeliveryMethod.pickUp;
}