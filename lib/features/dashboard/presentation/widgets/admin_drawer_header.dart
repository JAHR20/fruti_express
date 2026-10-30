import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/extensions/tipo_usuario_ui_extension.dart';

class AdminDrawerHeader extends StatelessWidget {
  final AppUser currentUser; 

  const AdminDrawerHeader({
    super.key,
    required this.currentUser,
  });

  String get fullName => "${currentUser.profile.firstName} ${currentUser.profile.paternalLastName}";

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.scrim
          ],
        ),
      ),
      currentAccountPicture: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: colorScheme.onPrimary.withValues(alpha: 0.24), 
            width: 3
          ),
        ),
        child: CircleAvatar(
          backgroundColor: colorScheme.surface,
          child: Icon(Icons.storefront, color: colorScheme.primary, size: 32),
        ),
      ),
      accountName: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              fullName,  
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: colorScheme.surface 
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.surface, width: 0.5),
              ),
              child: Text(
                currentUser.role.displayName, 
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.surface,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
      accountEmail: Text(
        currentUser.email,
        style: TextStyle(
          fontSize: 13,
          color: colorScheme.primaryFixed,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}