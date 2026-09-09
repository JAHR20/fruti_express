import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class AssignDriverUseCase with OrderValidations {
  final OrderRepository orderRepository;
  final UserRepository userRepository;

  AssignDriverUseCase(this.orderRepository, this.userRepository);

  ResultTask<Order> execute({
    required String orderId,
    required String driverId,
  }) {
    return TaskEither.Do(($) async {
      await $(validateId(orderId, FailureCode.invalidOrderId));
      await $(validateId(driverId, FailureCode.invalidUserId));

      final order = await $(orderRepository.getById(orderId));
      final driver = await $(userRepository.getById(driverId)); 

      await $(_validateDriverRole(driver));
      await $(_validateBranchMatch(driver, order));

      return await $(
        orderRepository.assignDriver(
          orderId: orderId,
          driverId: driverId,
        ),
      );
    });
  }

  ResultTask<Unit> _validateDriverRole(Profile user) =>
      user.role == UserRole.deliveryPerson
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(FailureCode.invalidDriverRole),
        );

  ResultTask<Unit> _validateBranchMatch(Profile driver, Order order) {
    final driverBranch = driver.branchId ?? '';
    final orderBranch = order.branchId;

    return driverBranch == orderBranch
        ? TaskEither.right(unit)
        : TaskEither.left(
            const Failure.validation(FailureCode.branchMismatch),
          );
  }
}