import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

enum CategoriaAccion { editar, cambiarEstado }

class CategoriaListTile extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback onEdit;
  final VoidCallback onDesactivar;

  const CategoriaListTile({
    super.key,
    required this.categoria,
    required this.onEdit,
    required this.onDesactivar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
            8,
          ), 
          child: Container(
            width: 48, 
            height: 48,
            color: Colors.grey.shade200, 
            child:
                (categoria.imagenUrl != null && categoria.imagenUrl!.isNotEmpty)
                ? Image.network(
                    categoria.imagenUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, color: Colors.grey),
                  )
                : const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ), 
          ),
        ),
        title: Text(
          categoria.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoria.descripcion ?? 'Sin descripción',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            if (!categoria.activa)
              const Text(
                'Inactiva',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton<CategoriaAccion>(
          icon: const Icon(Icons.more_vert),
          onSelected: (CategoriaAccion value) {
            switch (value) {
              case CategoriaAccion.editar:
                onEdit();
                break;
              case CategoriaAccion.cambiarEstado:
                onDesactivar();
                break;
            }
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<CategoriaAccion>>[
                const PopupMenuItem<CategoriaAccion>(
                  value: CategoriaAccion.editar,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.blue, size: 20),
                      SizedBox(width: 12),
                      Text('Editar'),
                    ],
                  ),
                ),
                PopupMenuItem<CategoriaAccion>(
                  value: CategoriaAccion.cambiarEstado,
                  child: Row(
                    children: [
                      Icon(
                        categoria.activa
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: categoria.activa ? Colors.red : Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        categoria.activa ? 'Desactivar' : 'Activar',
                        style: TextStyle(
                          color: categoria.activa ? Colors.red : Colors.green,
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
