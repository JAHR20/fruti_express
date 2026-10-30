import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

enum BranchAction { edit, changeStatus }

class BranchListTile extends StatelessWidget {
  final Branch branch;
  final VoidCallback onEdit;
  final VoidCallback onChangeStatus;

  const BranchListTile({
    super.key,
    required this.branch,
    required this.onEdit,
    required this.onChangeStatus,
  });

  @override 
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActive = branch.active;

    final fullAddress =
        '${branch.street} #${branch.exteriorNumber}, '
        'Col. ${branch.neighborhood}, ${branch.municipality}, ${branch.state}, '
        'C.P. ${branch.postalCode}';

    return Container(
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primaryFixed : colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: isActive ? colorScheme.primary : colorScheme.outline,
          child: Icon(
            Icons.store,
            color: isActive ? colorScheme.onPrimary : colorScheme.surface,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                branch.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isActive ? colorScheme.onPrimaryFixed : colorScheme.onSurfaceVariant,
                  decoration: isActive ? null : TextDecoration.lineThrough,
                  decorationColor: colorScheme.onSurfaceVariant,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!isActive) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'INACTIVA',
                  style: TextStyle(
                    color: colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            fullAddress,
            style: TextStyle(
              color: isActive ? colorScheme.onPrimaryFixed : colorScheme.onSurfaceVariant,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ),
        trailing: PopupMenuButton<BranchAction>(
          icon: Icon(
            Icons.more_vert,
            color: isActive ? colorScheme.primaryContainer : colorScheme.onSurfaceVariant, 
          ),
          onSelected: (BranchAction action) {
            switch (action) {
              case BranchAction.edit:
                onEdit();
                break;
              case BranchAction.changeStatus:
                onChangeStatus();
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<BranchAction>>[
            PopupMenuItem<BranchAction>(
              value: BranchAction.edit,
              child: Row(
                children: [
                  Icon(Icons.edit_outlined, color: colorScheme.tertiary, size: 20), 
                  const SizedBox(width: 12),
                  Text('Editar', style: TextStyle(color: colorScheme.tertiary)), 
                ],
              ),
            ),
            PopupMenuItem<BranchAction>(
              value: BranchAction.changeStatus,
              child: Row(
                children: [
                  Icon(
                    isActive ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: isActive ? colorScheme.error : colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    isActive ? 'Desactivar' : 'Activar',
                    style: TextStyle(
                      color: isActive ? colorScheme.error : colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}