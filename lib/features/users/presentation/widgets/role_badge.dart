import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/theme/app_colors_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

class RoleBadge extends StatelessWidget {
  final UserRole? role; 

  const RoleBadge({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = Theme.of(context).extension<AppColorsExtension>()!;

    Color badgeColor; 
    String badgeText; 

    switch (role) {
      case UserRole.admin:
        badgeColor = colorScheme.tertiary;
        badgeText = 'ADMIN';
        break;
      case UserRole.manager:
        badgeColor = colorScheme.secondary;
        badgeText = 'ENCARGADO';
        break;
      case UserRole.deliveryPerson:
        badgeColor = customColors.logistics;
        badgeText = 'REPARTIDOR';
        break;
      default:
        badgeColor = colorScheme.primary; 
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