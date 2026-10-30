import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/extensions/inventory_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

mixin InventoryValidations {
  
  ResultTask<Unit> validateQuantity(int quantity) {
    if (quantity > 0) return TaskEither.right(unit);
    
    return TaskEither.left(
      const Failure.validation(FailureCode.invalidQuantity),
    );
  }

  ResultTask<Unit> validatePermissions(AppUser user, String branchId) {
    if (user.canModifyInventory(branchId)) {
      return TaskEither.right(unit);
    }
    
    return TaskEither.left(
      const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
    );
  }
}