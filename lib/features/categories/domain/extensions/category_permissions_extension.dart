import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

extension CategoryPermissionsX on Profile {
  bool get canCreateCategory => isAdmin;

  bool get canEditCategory => isAdmin;

  bool get canDeactivateCategory => isAdmin;

  bool canViewCategory(Category category) {
    if (isAdmin) return true;
    return category.isActive;
  }
}
