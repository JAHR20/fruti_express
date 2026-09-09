import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'manager_orders_state.dart';

class ManagerOrdersCubit extends Cubit<ManagerOrdersState> {
  final OrderRepository _repository;
  StreamSubscription<Either<Failure, List<Order>>>? _subscription;

  ManagerOrdersCubit({required OrderRepository repository})
    : _repository = repository,
      super(const ManagerOrdersState.initial());

  void startWatching(String branchId) { 
    emit(const ManagerOrdersState.loading());
    
    _subscription?.cancel();

    _subscription = _repository.watchByBranch(branchId).listen(
      (either) => either.fold(
        (failure) {
          // Usamos el traductor
          emit(ManagerOrdersState.error(translateFailure(failure)));
        },
        (orders) {
          emit(ManagerOrdersState.loaded(orders));
        },
      ),
    );
  }

  void stopWatching() { 
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> confirmOrder(String orderId) async { 
    final currentOrdersList = _currentOrders();
    if (currentOrdersList == null) return;

    emit(
      ManagerOrdersState.performingAction(
        orders: currentOrdersList,
        orderId: orderId,
      ),
    );

    final result = await _repository
        .updateStatus(
          orderId: orderId,
          newStatus: OrderStatus.confirmed,
        )
        .run();

    result.fold(
      (failure) => emit(ManagerOrdersState.error(translateFailure(failure))),
      (_) => emit(ManagerOrdersState.loaded(currentOrdersList)),
    );
  }

  Future<void> assignDriverAndPrepare({ 
    required String orderId,
    required String driverId,
  }) async {
    final currentOrdersList = _currentOrders();
    if (currentOrdersList == null) return;

    emit(
      ManagerOrdersState.performingAction(
        orders: currentOrdersList,
        orderId: orderId,
      ),
    );

    // 1. Asignamos al repartidor
    final assignment = await _repository
        .assignDriver(orderId: orderId, driverId: driverId) 
        .run();

    final assignmentFailed = assignment.fold((failure) {
      emit(ManagerOrdersState.error(translateFailure(failure)));
      return true;
    }, (_) => false);

    if (assignmentFailed) return;

    final updateResult = await _repository
        .updateStatus(
          orderId: orderId,
          newStatus: OrderStatus.preparing,
        )
        .run();

    updateResult.fold(
      (failure) => emit(ManagerOrdersState.error(translateFailure(failure))),
      (_) => emit(ManagerOrdersState.loaded(currentOrdersList)),
    );
  }

  Future<void> cancelOrder(String orderId) async { 
    final currentOrdersList = _currentOrders();
    if (currentOrdersList == null) return;

    emit(
      ManagerOrdersState.performingAction(
        orders: currentOrdersList,
        orderId: orderId,
      ),
    );

    final result = await _repository
        .updateStatus(
          orderId: orderId,
          newStatus: OrderStatus.cancelled,
        )
        .run();

    result.fold(
      (failure) => emit(ManagerOrdersState.error(translateFailure(failure))),
      (_) => emit(ManagerOrdersState.loaded(currentOrdersList)),
    );
  }

  List<Order>? _currentOrders() { 
    return state.maybeWhen(
      loaded: (orders) => orders,
      performingAction: (orders, _) => orders,
      orElse: () => null,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}