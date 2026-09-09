import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';

class GetUserOrdersUseCase with OrderValidations {
  final OrderRepository repository;

  GetUserOrdersUseCase(this.repository);

  ResultTask<List<Order>> execute(String userId) {
    return TaskEither.Do(($) async {
      await $(validateId(userId, FailureCode.invalidUserId));

      return await $(repository.getByUser(userId));
    });
  }
}