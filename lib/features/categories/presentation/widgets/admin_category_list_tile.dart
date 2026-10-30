import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

enum CategoryAction { edit, changeStatus } 

class AdminCategoryListTile extends StatelessWidget {
  final Category category;
  final VoidCallback onEdit;
  final VoidCallback onDeactivate;

  const AdminCategoryListTile({
    super.key,
    required this.category,
    required this.onEdit,
    required this.onDeactivate,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 48,
            height: 48,
            color: colors.surfaceContainerHighest, 
            child: (category.imageUrl != null && category.imageUrl!.isNotEmpty)
                ? Image.network(
                    category.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image, color: colors.onSurfaceVariant),
                  )
                : Icon(
                    Icons.image,
                    color: colors.onSurfaceVariant,
                  ),
          ),
        ),
        title: Text(
          category.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.description ?? 'Sin descripción',
              style: TextStyle(color: colors.onSurfaceVariant), 
            ),
            if (!category.isActive)
              Text(
                'Inactiva',
                style: TextStyle(
                  color: colors.error, 
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton<CategoryAction>(
          icon: const Icon(Icons.more_vert),
          onSelected: (CategoryAction value) {
            switch (value) {
              case CategoryAction.edit:
                onEdit();
                break;
              case CategoryAction.changeStatus:
                onDeactivate();
                break;
            }
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<CategoryAction>>[
                PopupMenuItem<CategoryAction>(
                  value: CategoryAction.edit,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color: colors.primaryContainer, size: 20),
                      const SizedBox(width: 12),
                      Text('Editar', style: TextStyle(color: colors.primaryContainer),),
                    ],
                  ),
                ),
                PopupMenuItem<CategoryAction>(
                  value: CategoryAction.changeStatus,
                  child: Row(
                    children: [
                      Icon(
                        category.isActive
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: category.isActive ? colors.error : colors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        category.isActive ? 'Desactivar' : 'Activar',
                        style: TextStyle(
                          color: category.isActive ? colors.error : colors.primary,
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