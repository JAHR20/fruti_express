import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

class CustomerCategoryListTile extends StatelessWidget { // CategoriaListTile -> CategoryListTile
  final Category category;
  final VoidCallback? onTap;

  const CustomerCategoryListTile({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: colorTheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorTheme.outlineVariant,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
              child: SizedBox(
                width: 70,
                height: 70,
                child: category.imageUrl != null && category.imageUrl!.isNotEmpty
                    ? Image.network(
                        category.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, color: Colors.grey),
                      )
                    : Container(
                        color: colorTheme.surfaceContainer,
                        child: Icon(Icons.category_outlined, color: colorTheme.outline),
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                category.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.chevron_right, color: colorTheme.outline),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}