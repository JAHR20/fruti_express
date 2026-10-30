import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class GetAllOrdersUseCase {
  final OrderRepository repository;

  GetAllOrdersUseCase(this.repository);

  ResultTask<List<Order>> execute(AppUser currentUser) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(FailureCode.accessDeniedAdminOnlyGlobalList),
          ),
        );
      }
      return await $(repository.getAll());
    });
  }
}