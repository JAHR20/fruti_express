import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';
import 'confirm_delivery_params.dart';

class ConfirmDeliveryUseCase with OrderValidations {
  final OrderRepository repository;
  
  ConfirmDeliveryUseCase(this.repository);

  ResultTask<Unit> execute(ConfirmDeliveryParams params) {
    return TaskEither.Do(($) async {
      await $(validateId(params.orderId, FailureCode.invalidOrderId));
      await $(validateDeliveryEvidence(params)); // Validamos que traiga foto o código
      
      return await $(repository.confirmDelivery(params));
    });
  }
}