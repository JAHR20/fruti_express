import 'package:fruti_express_jahr_admin/features/orders/data/models/order_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_preview_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'order_remote_datasource.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final SupabaseClient supabase;

  static const String _tableName = 'orders';
  static const String _tableConfirmation = 'order_confirmation';
  static const String _colId = 'id';
  static const String _colCustomerId = 'customer_id';
  static const String _colBranchId = 'branch_id';
  static const String _colCreatedAt = 'created_at';
  static const String _colStatus = 'status';
  static const String _colDeliveryPersonId = 'delivery_person_id';
  static const String _colTotal = 'total';
  static const String _colOrderId = 'order_id';
  static const String _colCode = 'code';
  static const String _relOrderDetails = 'order_details(*)';
  static const String _createCompleteOrderRpc = 'create_complete_order';
  static const String _calculateOrderTotalsRpc = 'calculate_order_totals';
  static const String _orderDataParam = 'order_data';
  static const String _itemsDataParam = 'items_data';

  static const String _confirmDeliveryRpc = 'confirm_delivery';
  static const String _orderIdParam = 'p_order_id';
  static const String _codeParam = 'p_code';
  static const String _proofUrlParam = 'p_proof_url';
  static const String _confirmCashOrderRpc = 'confirm_cash_order';

  static const String _assignDriverAndPrepareRpc = 'assign_driver_and_prepare';
  static const String _driverIdParam = 'p_driver_id';

  static const String _failDeliveryRpc = 'fail_delivery';
  static const String _reasonParam = 'p_reason';
  static const String _noteParam = 'p_note';

  static const String _cancelCashOrderRpc = 'cancel_cash_order';

  static const String _departForDeliveryRpc = 'depart_for_delivery';

  OrderRemoteDataSourceImpl(this.supabase);

  @override
  Future<OrderModel> create(OrderModel model) async {
    final orderMap = model.toJson();
    orderMap.remove('items');
    final itemsList = model.items.map((item) => item.toJson()).toList();
    final response = await supabase.rpc(
      _createCompleteOrderRpc,
      params: {_orderDataParam: orderMap, _itemsDataParam: itemsList},
    );

    final String newOrderId = response.toString();
    final result = await getById(newOrderId);

    if (result == null) {
      throw const PostgrestException(
        message: 'Error al recuperar el pedido creado',
      );
    }
    return result;
  }

  @override
  Future<List<OrderModel>> getByUser(String userId) async {
    final response = await supabase
        .from(_tableName)
        .select('*, $_relOrderDetails')
        .eq(_colCustomerId, userId)
        .order(_colCreatedAt, ascending: false);

    final orders = (response as List)
        .map((json) => OrderModel.fromJson(json))
        .toList();

    final activeOrderIds = orders
        .where(
          (o) =>
              o.status != OrderStatus.delivered &&
              o.status != OrderStatus.cancelled,
        )
        .map((o) => o.id)
        .toList();

    if (activeOrderIds.isEmpty) return orders;

    final codes = await supabase
        .from(_tableConfirmation)
        .select('$_colOrderId, $_colCode')
        .inFilter(_colOrderId, activeOrderIds);

    final codesByOrder = {
      for (final c in codes as List)
        c[_colOrderId] as String: c[_colCode] as String,
    };

    return orders.map((o) {
      final code = codesByOrder[o.id];
      return code != null ? o.copyWith(confirmationCode: code) : o;
    }).toList();
  }

  @override
  Future<OrderModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select('*, $_relOrderDetails')
        .eq(_colId, id)
        .maybeSingle();

    return response != null ? OrderModel.fromJson(response) : null;
  }

  @override
  Future<int> countByStatus(String branchId, String status) async {
    final response = await supabase
        .from(_tableName)
        .select(_colId)
        .eq(_colBranchId, branchId)
        .eq(_colStatus, status)
        .count(CountOption.exact);
    return response.count;
  }

  @override
  Future<int> countTodaysOrders(String branchId) async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final response = await supabase
        .from(_tableName)
        .select(_colId)
        .eq(_colBranchId, branchId)
        .gte(_colCreatedAt, today)
        .count(CountOption.exact);
    return response.count;
  }

  @override
  Future<void> assignDriverAndPrepare({
    required String orderId,
    required String driverId,
  }) async {
    await supabase.rpc(
      _assignDriverAndPrepareRpc,
      params: {_orderIdParam: orderId, _driverIdParam: driverId},
    );
  }

  @override
  Stream<List<OrderModel>> watchByBranch(String branchId) {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colId])
        .eq(_colBranchId, branchId)
        .asyncMap((_) async {
          final response = await supabase
              .from(_tableName)
              .select('*, $_relOrderDetails')
              .eq(_colBranchId, branchId)
              .order(_colCreatedAt);
          return (response as List)
              .map((json) => OrderModel.fromJson(json))
              .toList();
        });
  }

  @override
  Future<int> getTodaysSales(String branchId) async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final response = await supabase
        .from(_tableName)
        .select(_colTotal)
        .eq(_colBranchId, branchId)
        .gte(_colCreatedAt, today);

    final data = response as List;
    final totalSold = data.fold<double>(
      0,
      (sum, item) => sum + (item[_colTotal] ?? 0),
    );
    return totalSold.toInt();
  }

  @override
  Stream<List<OrderModel>> watchByDriver(String driverId) {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colId])
        .eq(_colDeliveryPersonId, driverId)
        .asyncMap((_) async {
          final response = await supabase
              .from(_tableName)
              .select('*, $_relOrderDetails')
              .eq(_colDeliveryPersonId, driverId)
              .order(_colCreatedAt, ascending: false);
          return (response as List)
              .map((json) => OrderModel.fromJson(json))
              .toList();
        });
  }

  @override
  Future<OrderPreviewModel> getOrderPreview({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude,
    double? customerLongitude,
  }) async {
    final response = await supabase.rpc(
      _calculateOrderTotalsRpc,
      params: {
        'p_branch_id': branchId,
        'p_items_data': items,
        'p_delivery_method': deliveryMethod,
        'p_coupon_id': couponId,
        'p_customer_latitude': customerLatitude,
        'p_customer_longitude': customerLongitude,
      },
    );
    return OrderPreviewModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> confirmDelivery({
    required String orderId,
    String? confirmationCode,
    String? evidenceUrl,
  }) async {
    await supabase.rpc(
      _confirmDeliveryRpc,
      params: {
        _orderIdParam: orderId,
        _codeParam: confirmationCode,
        _proofUrlParam: evidenceUrl,
      },
    );
  }

  @override
  Future<void> failDelivery({
    required String orderId,
    required String reason,
    String? note,
  }) async {
    await supabase.rpc(
      _failDeliveryRpc,
      params: {_orderIdParam: orderId, _reasonParam: reason, _noteParam: note},
    );
  }

  @override
  Future<void> confirmCashOrder({required String orderId}) async {
    await supabase.rpc(_confirmCashOrderRpc, params: {_orderIdParam: orderId});
  }

  @override
  Future<void> cancelCashOrder({
    required String orderId,
    required String reason,
    String? note,
  }) async {
    await supabase.rpc(
      _cancelCashOrderRpc,
      params: {_orderIdParam: orderId, _reasonParam: reason, _noteParam: note},
    );
  }

  @override
  Future<OrderModel> departForDelivery(String orderId) async {
    await supabase.rpc(_departForDeliveryRpc, params: {_orderIdParam: orderId});

    final result = await getById(orderId);
    if (result == null) {
      throw const PostgrestException(
        message: 'Pedido no encontrado',
        code: 'PGRST116',
      );
    }
    return result;
  }
}
