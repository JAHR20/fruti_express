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
    final fullAddress =
        '${branch.street} #${branch.exteriorNumber}, '
        'Col. ${branch.neighborhood}, ${branch.municipality}, ${branch.state}, '
        'C.P. ${branch.postalCode}';
        
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: branch.active
              ? const Color(0xFF1E3A8A).withValues(alpha: 0.1)
              : Colors.grey.shade200,
          child: Icon(
            Icons.store,
            color: branch.active ? const Color(0xFF1E3A8A) : Colors.grey,
          ),
        ),
        title: Text(
          branch.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullAddress,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            if (!branch.active)
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  'Inactiva',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton<BranchAction>(
          icon: const Icon(Icons.more_vert),
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
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<BranchAction>>[
                const PopupMenuItem<BranchAction>(
                  value: BranchAction.edit,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.blue, size: 20),
                      SizedBox(width: 12),
                      Text('Editar'),
                    ],
                  ),
                ),
                PopupMenuItem<BranchAction>(
                  value: BranchAction.changeStatus,
                  child: Row(
                    children: [
                      Icon(
                        branch.active
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: branch.active ? Colors.red : Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        branch.active ? 'Desactivar' : 'Activar',
                        style: TextStyle(
                          color: branch.active ? Colors.red : Colors.green,
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