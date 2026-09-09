
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

extension UserPermissions on Profile {
  // Roles
  bool get isAdmin => role == UserRole.admin;
  bool get isManager => role == UserRole.manager;
  bool get isDeliveryPerson => role == UserRole.deliveryPerson;
  bool get isCustomer => role == UserRole.customer;

  bool get isStaff => isAdmin || isManager;

  // Permissions
  bool get canManageCatalog => isAdmin;

  bool get canManageInventory => isStaff;

  bool get canManageCoupons => isAdmin;

  bool get canManageOrders => isStaff;

  bool get canManageUsers => isStaff;

  bool get canManageBanners => isStaff;

  bool get canCreateBranch => isAdmin;

  // Actions
  bool canDeactivateReactivateUser(Profile target) {
    if (isAdmin) return true;
    if (isManager &&
        target.isDeliveryPerson &&
        branchId == target.branchId) {
      return true;
    }
    return false;
  }

  bool get canReactivateUser => isAdmin || isManager;

  bool canAssignDeliveryPersonToBranch(String targetBranchId) =>
      isAdmin || (isManager && branchId == targetBranchId);

  bool get canMakeUserDeliveryPerson => isAdmin || isManager;

  bool get canMakeUserManager => isAdmin;

  bool get canMakeUserAdmin => isAdmin;
}