import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/mixins/address_validations.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/repositories/address_repository.dart';

class DeleteAddressUseCase with AddressValidations {
  final AddressRepository repository;
  
  DeleteAddressUseCase(this.repository);

  ResultTask<Unit> execute(String id) {
    return TaskEither.Do(($) async {
      await $(validateId(id, FailureCode.invalidAddressId));
      return await $(repository.delete(id));
    });
  }
}