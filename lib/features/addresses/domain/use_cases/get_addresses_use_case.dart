import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/mixins/address_validations.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/repositories/address_repository.dart';

class GetAddressesUseCase with AddressValidations {
  final AddressRepository repository;
  
  GetAddressesUseCase(this.repository);

  ResultTask<List<Address>> execute(String userId) {
    return TaskEither.Do(($) async {
      await $(validateId(userId, FailureCode.invalidUserId));
      return await $(repository.getByUser(userId));
    });
  }
}