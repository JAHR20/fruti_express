import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/validate_and_apply_coupon_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_order_preview_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/get_current_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/save_cart_use_case.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/clear_cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final SaveCartUseCase _saveCartUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final LocationService _locationService;
  final GetCurrentStockUseCase _getCurrentStockUseCase;
  final ValidateAndApplyCouponUseCase _validateAndApplyCouponUseCase;
  final GetOrderPreviewUseCase _getOrderPreviewUseCase;

  CartCubit({
    required GetCartUseCase getCartUseCase,
    required SaveCartUseCase saveCartUseCase,
    required ClearCartUseCase clearCartUseCase,
    required LocationService locationService,
    required GetCurrentStockUseCase getCurrentStockUseCase,
    required ValidateAndApplyCouponUseCase validateAndApplyCouponUseCase,
    required GetOrderPreviewUseCase getOrderPreviewUseCase,
  }) : _getCartUseCase = getCartUseCase,
       _saveCartUseCase = saveCartUseCase,
       _clearCartUseCase = clearCartUseCase,
       _locationService = locationService,
       _getCurrentStockUseCase = getCurrentStockUseCase,
       _validateAndApplyCouponUseCase = validateAndApplyCouponUseCase,
       _getOrderPreviewUseCase = getOrderPreviewUseCase,
       super(const CartState());

  Future<void> loadCart() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final items = await _getCartUseCase.execute();
      emit(state.copyWith(isLoading: false, items: items, errorMessage: null));

      // 🛑 Solo calculamos si ya tenemos sucursal Y coordenadas listas
      if (items.isNotEmpty &&
          state.branchId != null &&
          state.selectedAddress?.latitude != null &&
          state.selectedAddress?.longitude != null) {
        await calculateOrderPreview(
          lat: state.selectedAddress?.latitude,
          lng: state.selectedAddress?.longitude,
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(
            const Failure.validation(FailureCode.localCartLoadError),
          ),
        ),
      );
    }
  }

  Future<void> calculateOrderPreview({double? lat, double? lng}) async {
    final finalLat = lat ?? state.selectedAddress?.latitude;
    final finalLng = lng ?? state.selectedAddress?.longitude;

    if (state.branchId == null || state.items.isEmpty) return;

    if (state.deliveryMethod == DeliveryMethod.homeDelivery &&
        (finalLat == null || finalLng == null)) {
      return;
    }

    emit(state.copyWith(isCalculating: true));

    final itemsData = state.items
        .map(
          (item) => {
            'product_id': item.productId,
            'quantity': item.quantity,
            'product_name_snapshot': item.name,
            'unit_price_snapshot': item.unitPrice,
            'measurement_unit': item.measurementUnit.name,
          },
        )
        .toList();

    final deliveryMethodStr = state.deliveryMethod == DeliveryMethod.pickUp
        ? 'pick_up'
        : 'delivery';

    final result = await _getOrderPreviewUseCase(
      branchId: state.branchId!,
      items: itemsData,
      deliveryMethod: deliveryMethodStr,
      couponId: state.appliedCoupon?.id,
      customerLatitude: finalLat,
      customerLongitude: finalLng,
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          isCalculating: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (preview) =>
          emit(state.copyWith(isCalculating: false, orderPreview: preview)),
    );
  }

  Future<String?> addItem(CartItem newItem) async {
    final branchId = state.branchId;

    if (branchId == null) {
      return translateFailure(
        const Failure.validation(FailureCode.branchNotSelected),
      );
    }

    emit(state.copyWith(processingProductId: newItem.productId));

    final result = await _getCurrentStockUseCase
        .execute(newItem.productId, branchId)
        .run();

    String? returnErrorMessage;

    await result.fold(
      (failure) async {
        returnErrorMessage = returnErrorMessage = translateFailure(failure);
      },
      (actualStock) async {
        final List<CartItem> currentItems = List.from(state.items);
        final index = currentItems.indexWhere(
          (item) => item.productId == newItem.productId,
        );

        final currentQuantityInCart = index != -1
            ? currentItems[index].quantity
            : 0;
        final desiredTotalQuantity = currentQuantityInCart + newItem.quantity;

        if (desiredTotalQuantity > actualStock) {
          returnErrorMessage = translateFailure(
            Failure.insufficientStock(
              FailureCode.insufficientStock,
              params: {
                'productName': newItem.name,
                'stock': actualStock,
                'unit': newItem.measurementUnit.name,
              },
            ),
          );
          return;
        }

        if (index != -1) {
          final existingItem = currentItems[index];
          currentItems[index] = existingItem.copyWith(
            quantity: desiredTotalQuantity,
          );
        } else {
          currentItems.add(newItem);
        }

        await _saveCartUseCase.execute(currentItems);
        emit(state.copyWith(items: currentItems));
      },
    );

    emit(state.copyWith(processingProductId: null));

    await calculateOrderPreview();

    return returnErrorMessage;
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    if (newQuantity <= 0) {
      return removeItem(productId);
    }

    final List<CartItem> currentItems = List.from(state.items);
    final index = currentItems.indexWhere(
      (item) => item.productId == productId,
    );

    if (index == -1) return;

    emit(state.copyWith(processingProductId: productId));

    currentItems[index] = currentItems[index].copyWith(quantity: newQuantity);
    await _saveCartUseCase.execute(currentItems);

    emit(state.copyWith(items: currentItems, processingProductId: null));

    await calculateOrderPreview();
  }

  Future<void> removeItem(String productId) async {
    emit(state.copyWith(processingProductId: productId));

    final currentItems = state.items
        .where((item) => item.productId != productId)
        .toList();

    await _saveCartUseCase.execute(currentItems);

    emit(state.copyWith(items: currentItems, processingProductId: null));

    await calculateOrderPreview();
  }

  Future<void> clearCart() async {
    await _clearCartUseCase.execute();
    emit(
      state.copyWith(items: const [], appliedCoupon: null, discountAmount: 0),
    );
  }

  void setDeliveryMethod(DeliveryMethod method) {
    emit(state.copyWith(deliveryMethod: method));
    calculateOrderPreview();
  }

  Branch? validateAddressCoverage({
    required Address address,
    required List<Branch> branches,
    required List<ShippingConfig> configs,
  }) {
    Branch? winningBranch;
    double minDistance = double.infinity;

    for (var branch in branches) {
      if (!branch.active) continue;
      if (branch.latitude == null || branch.longitude == null) continue;

      final configIndex = configs.indexWhere((c) => c.branchId == branch.id);
      if (configIndex == -1) continue;

      final config = configs[configIndex];

      if (config.requireZipCodeValidation &&
          !config.allowedZipCodes.contains(address.zipCode)) {
        continue;
      }

      final distanceKm = _locationService.calculateDistance(
        lat1: address.latitude,
        lon1: address.longitude,
        lat2: branch.latitude!,
        lon2: branch.longitude!,
      );

      if (distanceKm <= config.maxRadiusKm && distanceKm < minDistance) {
        minDistance = distanceKm;
        winningBranch = branch;
      }
    }

    return winningBranch;
  }

  Future<void> validateAndApplyCoupon(String code) async {
    emit(state.copyWith(operationError: null));

    if (code.trim().isEmpty) return;

    if (state.orderPreview == null) {
      emit(
        state.copyWith(
          operationError: translateFailure(
            const Failure.validation(FailureCode.branchNotSelected),
          ),
        ),
      );
      return;
    }

    final subtotal = state.orderPreview!.subtotal;

    final result = await _validateAndApplyCouponUseCase
        .execute(code: code.trim(), cartSubtotal: subtotal)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            operationError: translateFailure(failure),
            appliedCoupon: null,
            discountAmount: 0,
          ),
        );
      },
      (coupon) {
        emit(state.copyWith(appliedCoupon: coupon, operationSuccessful: true));

        calculateOrderPreview();
      },
    );
  }

  void setShippingRules({required int baseRate, int? freeThreshold}) {
    emit(
      state.copyWith(
        baseShippingRate: baseRate,
        freeShippingThreshold: freeThreshold,
      ),
    );
  }

  void setDeliveryAddress(Address address) {
    emit(state.copyWith(selectedAddress: address));

    calculateOrderPreview(lat: address.latitude, lng: address.longitude);
  }

  void setActiveBranch(String branchId) {
    emit(state.copyWith(branchId: branchId));

    calculateOrderPreview();
  }

  void clearActiveBranch() {
    emit(state.copyWith(branchId: null));
  }

  void clearDeliveryAddress() {
    emit(state.copyWith(selectedAddress: null));
  }

  void setPaymentMethod(PaymentMethodType method) {
    emit(state.copyWith(paymentMethod: method));
  }
}
