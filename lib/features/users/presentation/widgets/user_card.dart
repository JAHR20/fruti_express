import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'branch_dialog.dart';
import 'role_badge.dart';

class UserCard extends StatelessWidget {
  final Profile targetUser;
  final Profile currentUser;
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 48,
            height: 48,
            color: Colors.grey.shade200,
            child:
                targetUser.avatarUrl != null &&
                    targetUser.avatarUrl!.isNotEmpty
                ? Image.network(targetUser.avatarUrl!, fit: BoxFit.cover)
                : const Icon(Icons.person, color: Colors.grey),
          ),
        ),
        title: Text(
          targetUser.firstName, // Asumo que nombre -> firstName
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(targetUser.email),
            const SizedBox(height: 4),
            RoleBadge(role: targetUser.role),
          ],
        ),
        trailing: isProcessing
            ? const SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (currentUser.isAdmin)
                    Switch(
                      value: targetUser.active, // activo -> active
                      activeThumbColor: Colors.green,
                      onChanged: onStatusChanged,
                    ),
                  PopupMenuButton<UserRole>(
                    icon: const Icon(
                      Icons.shield_outlined,
                      color: Color(0xFF1E3A8A),
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
                            const SnackBar(
                              content: Text(
                                'Solo puedes asignar repartidores en tu propia sucursal.',
                              ),
                              backgroundColor: Colors.red,
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