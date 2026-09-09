import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

mixin AddressValidations {
  ResultTask<Unit> validateId(String id, FailureCode code) {
    if (id.trim().isEmpty) {
      return TaskEither.left(Failure.validation(code));
    }
    return TaskEither.right(unit);
  }

  ResultTask<Unit> validateAddressData(Address address) {
    if (address.street.trim().isEmpty || 
        address.neighborhood.trim().isEmpty || 
        address.zipCode.trim().isEmpty) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidAddressData),
      );
    }
    
    // Validación básica de coordenadas geográficas
    if (address.latitude < -90 || address.latitude > 90 || 
        address.longitude < -180 || address.longitude > 180) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidCoordinates),
      );
    }
    
    return TaskEither.right(unit);
  }
}