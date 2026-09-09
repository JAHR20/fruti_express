import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

class RoleBadge extends StatelessWidget {
  final UserRole? role; // rol -> role

  const RoleBadge({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    Color badgeColor; // color -> badgeColor
    String badgeText; // texto -> badgeText

    switch (role) {
      case UserRole.admin:
        badgeColor = Colors.red.shade700;
        badgeText = 'ADMIN';
        break;
      case UserRole.manager:
        badgeColor = Colors.orange.shade700;
        badgeText = 'ENCARGADO';
        break;
      case UserRole.deliveryPerson:
        badgeColor = Colors.blue.shade700;
        badgeText = 'REPARTIDOR';
        break;
      default:
        badgeColor = Colors.green.shade700;
        badgeText = 'CLIENTE';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: badgeColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        badgeText,
        style: TextStyle(
          color: badgeColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}