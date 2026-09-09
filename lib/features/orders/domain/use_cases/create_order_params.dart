import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

class CreateOrderParams {
  final String customerId; 
  final String branchId; 
  final String customerNameSnapshot;
  final String customerPhoneSnapshot;
  final String addressSnapshot;
  final int subtotal;
  final int shippingCost; 
  final int appliedDiscounts; 
  final int total;
  final DeliveryMethod deliveryMethod;
  final String? couponId; 
  final List<CreateOrderItemParams> items;

  const CreateOrderParams({
    required this.customerId,
    required this.branchId,
    required this.customerNameSnapshot,
    required this.customerPhoneSnapshot,
    required this.addressSnapshot,
    required this.subtotal,
    required this.shippingCost,
    required this.appliedDiscounts,
    required this.total,
    required this.deliveryMethod,
    this.couponId,
    required this.items,
  });
}

class CreateOrderItemParams {
  final String productId; 
  final String productNameSnapshot;
  final int quantity; 
  final int unitPriceSnapshot;
  final MeasurementUnit? measurementUnit;

  const CreateOrderItemParams({
    required this.productId,
    required this.productNameSnapshot,
    required this.quantity,
    required this.unitPriceSnapshot,
    this.measurementUnit,
  });
}