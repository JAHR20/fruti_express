import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/mixins/address_validations.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/repositories/address_repository.dart';

class UpdateAddressUseCase with AddressValidations {
  final AddressRepository repository;
  
  UpdateAddressUseCase(this.repository);

  ResultTask<Address> execute(Address address) {
    return TaskEither.Do(($) async {
      await $(validateId(address.id, FailureCode.invalidAddressId));
      await $(validateAddressData(address));
      
      return await $(repository.update(address));
    });
  }
}