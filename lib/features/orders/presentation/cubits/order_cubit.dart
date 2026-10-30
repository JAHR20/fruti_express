import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/extensions/address_format_extension.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CreateOrderUseCase _createOrderUseCase;

  OrderCubit({required CreateOrderUseCase createOrderUseCase})
    : _createOrderUseCase = createOrderUseCase,
      super(const OrderState.initial());

  Future<void> createFromCart({
    required List<CartItem> items,
    Address? address,
    required Branch branch,
    required UserProfile profile,
    required int subtotal,
    required int calculatedShippingCost,
    required DeliveryMethod deliveryMethod,
    required PaymentMethodType paymentMethod,
    required int appliedDiscount,
    required int total,
    String? couponId,
  }) async {
    emit(const OrderState.processing());

    final String addressSnapshotText = deliveryMethod == DeliveryMethod.pickUp
        ? 'RECOGER EN SUCURSAL: ${branch.name}, ${branch.street} #${branch.exteriorNumber}'
        : (address != null
              ? address.formattedSnapshot
              : 'Dirección no especificada');

    final params = CreateOrderParams(
      customerId: profile.id,
      branchId: branch.id,
      customerNameSnapshot: profile.fullNameSnapshot,
      customerPhoneSnapshot: profile.phone ?? '',
      addressSnapshot: addressSnapshotText,
      subtotal: subtotal,
      deliveryMethod: deliveryMethod,
      paymentMethod: paymentMethod,
      customerLatitude: address?.latitude,
      customerLongitude: address?.longitude,
      addressId: deliveryMethod == DeliveryMethod.pickUp ? null : address?.id,
      shippingCost: calculatedShippingCost,
      appliedDiscounts: appliedDiscount,
      total: total,
      couponId: couponId,
      items: items
          .map(
            (item) => CreateOrderItemParams(
              productId: item.productId,
              productNameSnapshot: item.name,
              quantity: item.quantity,
              unitPriceSnapshot: item.unitPrice,
              measurementUnit: item.measurementUnit,
            ),
          )
          .toList(),
    );

    final result = await _createOrderUseCase.execute(params).run();

    result.fold(
      (failure) => emit(OrderState.error(translateFailure(failure))),
      (createdOrder) => emit(OrderState.awaitingPayment(createdOrder)),
    );
  }

  void resetState() => emit(const OrderState.initial());
}
