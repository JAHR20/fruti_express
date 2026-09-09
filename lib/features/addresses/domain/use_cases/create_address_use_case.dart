import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/mixins/address_validations.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/repositories/address_repository.dart';

class CreateAddressUseCase with AddressValidations {
  final AddressRepository repository;
  
  CreateAddressUseCase(this.repository);

  ResultTask<Address> execute(Address address) {
    return TaskEither.Do(($) async {
      await $(validateAddressData(address));
      return await $(repository.create(address));
    });
  }
}