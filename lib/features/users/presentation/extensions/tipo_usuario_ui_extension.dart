import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

extension UserRoleUIX on UserRole { 
  String get displayName { 
    switch (this) {
      case UserRole.admin:
        return 'Administrador';
      case UserRole.manager:
        return 'Encargado';
      case UserRole.deliveryPerson:
        return 'Repartidor';
      case UserRole.customer:
        return 'Cliente';
    }
  }
}