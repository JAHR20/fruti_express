import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

enum SucursalAccion { editar, cambiarEstado }

class SucursalListTile extends StatelessWidget {
  final Sucursal sucursal;
  final VoidCallback onEdit;
  final VoidCallback onCambiarEstado;

  const SucursalListTile({
    super.key,
    required this.sucursal,
    required this.onEdit,
    required this.onCambiarEstado,
  });

  @override
  Widget build(BuildContext context) {
    final direccionCompleta =
        '${sucursal.calle} #${sucursal.numExterior}, '
        'Col. ${sucursal.colonia}, ${sucursal.municipio}, ${sucursal.estado}, '
        'C.P. ${sucursal.codigoPostal}';
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: sucursal.activa
              ? const Color(0xFF1E3A8A).withValues(alpha: 0.1)
              : Colors.grey.shade200,
          child: Icon(
            Icons.store,
            color: sucursal.activa ? const Color(0xFF1E3A8A) : Colors.grey,
          ),
        ),
        title: Text(
          sucursal.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              direccionCompleta,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            if (!sucursal.activa)
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
        trailing: PopupMenuButton<SucursalAccion>(
          icon: const Icon(Icons.more_vert),
          onSelected: (SucursalAccion accion) {
            switch (accion) {
              case SucursalAccion.editar:
                onEdit();
                break;
              case SucursalAccion.cambiarEstado:
                onCambiarEstado();
                break;
            }
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<SucursalAccion>>[
                const PopupMenuItem<SucursalAccion>(
                  value: SucursalAccion.editar,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.blue, size: 20),
                      SizedBox(width: 12),
                      Text('Editar'),
                    ],
                  ),
                ),
                PopupMenuItem<SucursalAccion>(
                  value: SucursalAccion.cambiarEstado,
                  child: Row(
                    children: [
                      Icon(
                        sucursal.activa
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: sucursal.activa ? Colors.red : Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        sucursal.activa ? 'Desactivar' : 'Activar',
                        style: TextStyle(
                          color: sucursal.activa ? Colors.red : Colors.green,
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
