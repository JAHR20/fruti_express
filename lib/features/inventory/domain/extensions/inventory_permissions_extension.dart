import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

extension InventoryPermissionsX on AppUser {
  bool canModifyInventory(String inventoryBranchId) { 
    if (isAdmin) return true;
    if (isManager && branchId == inventoryBranchId) {
      return true;
    }
    return false;
  }
}