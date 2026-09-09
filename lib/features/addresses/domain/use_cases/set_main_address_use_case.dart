import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/mixins/address_validations.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/repositories/address_repository.dart';

class SetMainAddressUseCase with AddressValidations {
  final AddressRepository repository;
  
  SetMainAddressUseCase(this.repository);

  ResultTask<Unit> execute({
    required String userId,
    required String addressId,
  }) {
    return TaskEither.Do(($) async {
      await $(validateId(userId, FailureCode.invalidUserId));
      await $(validateId(addressId, FailureCode.invalidAddressId));
      
      return await $(repository.setAsMain(userId: userId, addressId: addressId));
    });
  }
}