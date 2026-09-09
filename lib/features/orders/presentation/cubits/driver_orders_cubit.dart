import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/depart_for_delivery_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/upload_delivery_evidence_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/watch_driver_orders_use_case.dart';
import 'driver_orders_state.dart';

class DriverOrdersCubit extends Cubit<DriverOrdersState> {
  final WatchDriverOrdersUseCase _watchOrdersUseCase;
  final DepartForDeliveryUseCase _departForDeliveryUseCase;
  final ConfirmDeliveryUseCase _confirmDeliveryUseCase;
  final UploadDeliveryEvidenceUseCase _uploadEvidenceUseCase;

  StreamSubscription<Either<Failure, List<Order>>>? _subscription;

  DriverOrdersCubit({
    required WatchDriverOrdersUseCase watchOrdersUseCase,
    required DepartForDeliveryUseCase departForDeliveryUseCase,
    required ConfirmDeliveryUseCase confirmDeliveryUseCase,
    required UploadDeliveryEvidenceUseCase uploadEvidenceUseCase,
  }) : _watchOrdersUseCase = watchOrdersUseCase,
       _departForDeliveryUseCase = departForDeliveryUseCase,
       _confirmDeliveryUseCase = confirmDeliveryUseCase,
       _uploadEvidenceUseCase = uploadEvidenceUseCase,
       super(const DriverOrdersState.initial());

  void startWatching(String driverId) {
    emit(const DriverOrdersState.loading());
    _subscription?.cancel();

    _subscription = _watchOrdersUseCase
        .execute(driverId)
        .listen(
          (either) => either.fold(
            (failure) =>
                emit(DriverOrdersState.error(translateFailure(failure))),
            (orders) => emit(DriverOrdersState.loaded(orders)),
          ),
        );
  }

  void stopWatching() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> departForDelivery(String orderId) async {
    final currentList = _currentOrders();
    if (currentList == null) return;

    emit(
      DriverOrdersState.performingAction(orders: currentList, orderId: orderId),
    );

    final result = await _departForDeliveryUseCase.execute(orderId).run();

    result.fold(
      (failure) => emit(
        DriverOrdersState.errorWithOrders(
          orders: currentList,
          message: translateFailure(failure),
        ),
      ),
      (updatedOrder) {
        final updatedList = currentList.map((order) {
          return order.id == updatedOrder.id ? updatedOrder : order;
        }).toList();

        emit(DriverOrdersState.loaded(updatedList));
      },
    );
  }

  Future<void> confirmDelivery({
    required String orderId,
    String? confirmationCode,
    String? photoPath,
  }) async {
    final currentList = _currentOrders();
    if (currentList == null) return;

    emit(
      DriverOrdersState.performingAction(orders: currentList, orderId: orderId),
    );

    String? evidenceUrl;
    if (photoPath != null) {
      final uploadResult = await _uploadEvidenceUseCase
          .execute(photoPath: photoPath, orderId: orderId)
          .run();

      final failed = uploadResult.fold(
        (failure) {
          emit(
            DriverOrdersState.errorWithOrders(
              orders: currentList,
              message: translateFailure(failure),
            ),
          );
          return true;
        },
        (url) {
          evidenceUrl = url;
          return false;
        },
      );

      if (failed) return;
    }

    final result = await _confirmDeliveryUseCase
        .execute(
          ConfirmDeliveryParams(
            orderId: orderId,
            confirmationCode: confirmationCode,
            evidenceUrl: evidenceUrl,
          ),
        )
        .run();

    result.fold(
      (failure) => emit(
        DriverOrdersState.errorWithOrders(
          orders: currentList,
          message: translateFailure(failure),
        ),
      ),
      (_) => emit(DriverOrdersState.loaded(currentList)),
    );
  }

  List<Order>? _currentOrders() {
    return state.maybeWhen(
      loaded: (orders) => orders,
      performingAction: (orders, _) => orders,
      errorWithOrders: (orders, _) => orders,
      orElse: () => null,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
