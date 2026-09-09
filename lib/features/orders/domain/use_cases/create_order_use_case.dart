import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';
import 'create_order_params.dart';

class CreateOrderUseCase with OrderValidations {
  final OrderRepository _orderRepository;
  final InventoryRepository _inventoryRepository;

  CreateOrderUseCase(this._orderRepository, this._inventoryRepository);

  ResultTask<Order> execute(CreateOrderParams params) => TaskEither.Do((
    $,
  ) async {
    await $(validateCreateOrder(params));

    for (final item in params.items) {
      final currentStock = await $(
        _inventoryRepository.getCurrentStock(item.productId, params.branchId),
      );

      if (item.quantity > currentStock) {
        await $(
          TaskEither.left(
            Failure.insufficientStock(
              FailureCode.insufficientStock,
              params: {
                'productName': item.productNameSnapshot,
                'stock': currentStock,
              },
            ),
          ),
        );
      }
    }

    final createdOrder = await $(_orderRepository.create(params));

    for (final item in params.items) {
      final deductionQuantity = item.quantity * -1;

      await $(
        _inventoryRepository.adjustStockAtomically(
          productId: item.productId,
          branchId: params.branchId,
          quantityChange: deductionQuantity,
        ),
      );
    }

    return createdOrder;
  });
}
