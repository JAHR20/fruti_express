import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/domain/entities/dashboard_summary.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart'; 

class GetDashboardSummaryUseCase { 
  final OrderRepository repository;

  GetDashboardSummaryUseCase(this.repository);

  ResultTask<DashboardSummary> execute(String branchId) { 
    final cleanId = branchId.trim(); // idLimpio -> cleanId

    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      if (cleanId.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidArgument
            ),
          ),
        );
      }
      final futures = await Future.wait([
        repository.countByStatus(cleanId, OrderStatus.pendingPayment).run(), 
        repository.countByStatus(cleanId, OrderStatus.preparing).run(), 
        repository.countByStatus(cleanId, OrderStatus.onTheWay).run(), 
        repository.getTodaysSales(cleanId).run(), 
        repository.countTodaysOrders(cleanId).run(), 
      ]);

      final pPending = await $(TaskEither.fromEither(futures[0])); 
      final pPreparing = await $(TaskEither.fromEither(futures[1])); 
      final pOnTheWay = await $(TaskEither.fromEither(futures[2])); 
      final pSales = await $(TaskEither.fromEither(futures[3])); 
      final pTotal = await $(TaskEither.fromEither(futures[4])); 

      return DashboardSummary(
        pendingOrders: pPending,
        preparingOrders: pPreparing,
        onTheWayOrders: pOnTheWay,
        todaysSales: pSales, 
        todaysTotalOrders: pTotal,
      );
    });
  }
}