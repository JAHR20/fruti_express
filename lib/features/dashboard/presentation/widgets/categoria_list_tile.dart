import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

class CategoriaListTile extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback? onTap;

  const CategoriaListTile({
    super.key,
    required this.categoria,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.08),
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
                child: categoria.imagenUrl != null && categoria.imagenUrl!.isNotEmpty
                    ? Image.network(
                        categoria.imagenUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, color: Colors.grey),
                      )
                    : Container(
                        color: Colors.grey.shade100,
                        child: const Icon(Icons.category_outlined, color: Colors.grey),
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                categoria.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}