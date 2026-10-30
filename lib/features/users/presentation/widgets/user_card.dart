import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'branch_dialog.dart';
import 'role_badge.dart';

class UserCard extends StatelessWidget {
  final AppUser targetUser;
  final AppUser currentUser;
  final BranchCubit branchCubit;
  final bool isProcessing;

  final Function(bool) onStatusChanged;
  final Function(UserRole, String?) onRoleChanged;

  const UserCard({
    super.key,
    required this.targetUser,
    required this.currentUser,
    required this.branchCubit,
    this.isProcessing = false,
    required this.onStatusChanged,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; 

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      color: colorScheme.surface, 
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 48,
            height: 48,
            color: colorScheme.surfaceContainerHighest,
            child: targetUser.profile.avatarUrl != null &&
                    targetUser.profile.avatarUrl!.isNotEmpty
                ? Image.network(targetUser.profile.avatarUrl!, fit: BoxFit.cover)
                : Icon(Icons.person, color: colorScheme.onSurfaceVariant),
          ),
        ),
        title: Text(
          targetUser.profile.firstName, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface, 
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              targetUser.email,
              style: TextStyle(color: colorScheme.onSurfaceVariant), 
            ),
            const SizedBox(height: 4),
            RoleBadge(role: targetUser.role),
          ],
        ),
        trailing: isProcessing
            ? SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: colorScheme.secondary, 
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (currentUser.isAdmin)
                    Switch(
                      activeTrackColor:colorScheme.primaryFixedDim ,
                      value: targetUser.active,
                      activeThumbColor: colorScheme.primary, 
                      onChanged: onStatusChanged,
                    ),
                  PopupMenuButton<UserRole>(
                    icon: Icon(
                      Icons.shield_outlined,
                      size: 30,
                      color: colorScheme.secondaryContainer, 
                    ),
                    tooltip: 'Cambiar Rol',
                    onSelected: (UserRole newRole) async {
                      if (newRole == UserRole.manager ||
                          newRole == UserRole.deliveryPerson) {
                        final String? selectedBranchId =
                            await showDialog<String>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => BranchDialog(
                                role: newRole,
                                branchCubit: branchCubit,
                                currentUser: currentUser,
                              ),
                            );

                        if (selectedBranchId == null) return;
                        if (!context.mounted) return;
                        
                        if (newRole == UserRole.deliveryPerson &&
                            !currentUser.canAssignDeliveryPersonToBranch(
                              selectedBranchId,
                            )) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Solo puedes asignar repartidores en tu propia sucursal.',
                                style: TextStyle(color: colorScheme.onError),
                              ),
                              backgroundColor: colorScheme.error, 
                            ),
                          );
                          return;
                        }

                        onRoleChanged(newRole, selectedBranchId);
                      } else {
                        onRoleChanged(newRole, null);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      if (currentUser.isAdmin) ...[
                        const PopupMenuItem(
                          value: UserRole.admin,
                          child: Text('Hacer Admin'),
                        ),
                        const PopupMenuItem(
                          value: UserRole.manager,
                          child: Text('Hacer Encargado'),
                        ),
                      ],
                      if (currentUser.isAdmin || currentUser.isManager)
                        const PopupMenuItem(
                          value: UserRole.deliveryPerson,
                          child: Text('Asignar Repartidor'),
                        ),
                      const PopupMenuItem(
                        value: UserRole.customer,
                        child: Text('Cambiar a Cliente'),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}