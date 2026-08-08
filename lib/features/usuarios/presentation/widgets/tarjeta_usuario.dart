import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'dialogo_sucursal.dart';
import 'role_badge.dart';

class TarjetaUsuario extends StatelessWidget {
  final Perfil usuarioTarget;
  final Perfil usuarioActual;
  final SucursalCubit sucursalCubit;
  final Function(bool) onEstadoCambiado;
  final Function(TipoUsuario, String?) onRolCambiado;

  const TarjetaUsuario({
    super.key,
    required this.usuarioTarget,
    required this.usuarioActual,
    required this.sucursalCubit,
    required this.onEstadoCambiado,
    required this.onRolCambiado,
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
            child: usuarioTarget.avatarUrl != null && usuarioTarget.avatarUrl!.isNotEmpty
                ? Image.network(usuarioTarget.avatarUrl!, fit: BoxFit.cover)
                : const Icon(Icons.person, color: Colors.grey),
          ),
        ),
        title: Text(usuarioTarget.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(usuarioTarget.email),
            const SizedBox(height: 4),
            RoleBadge(rol: usuarioTarget.rol),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (usuarioActual.esAdmin)
              Switch(
                value: usuarioTarget.activo,
                activeThumbColor: Colors.green,
                onChanged: onEstadoCambiado,
              ),
            PopupMenuButton<TipoUsuario>(
              icon: const Icon(Icons.shield_outlined, color: Color(0xFF1E3A8A)),
              tooltip: 'Cambiar Rol',
              onSelected: (TipoUsuario nuevoRol) async {
                if (nuevoRol == TipoUsuario.encargado || nuevoRol == TipoUsuario.repartidor) {
                  final String? idSucursalElegida = await showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => DialogoSucursal(rol: nuevoRol, sucursalCubit: sucursalCubit),
                  );

                  if (idSucursalElegida == null) return;
                  onRolCambiado(nuevoRol, idSucursalElegida);
                } else {
                  onRolCambiado(nuevoRol, null);
                }
              },
              itemBuilder: (BuildContext context) => [
                if (usuarioActual.esAdmin) ...[
                  const PopupMenuItem(value: TipoUsuario.admin, child: Text('Hacer Admin')),
                  const PopupMenuItem(value: TipoUsuario.encargado, child: Text('Hacer Encargado')),
                ],
                const PopupMenuItem(value: TipoUsuario.repartidor, child: Text('Asignar Repartidor')),
                const PopupMenuItem(value: TipoUsuario.cliente, child: Text('Cambiar a Cliente')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}