import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

class DialogoSucursal extends StatefulWidget {
  final TipoUsuario rol;
  final SucursalCubit sucursalCubit;

  const DialogoSucursal({
    super.key,
    required this.rol,
    required this.sucursalCubit,
  });

  @override
  State<DialogoSucursal> createState() => _DialogoSucursalState();
}

class _DialogoSucursalState extends State<DialogoSucursal> {
  String? sucursalSeleccionadaId;

  @override
  void initState() {
    super.initState();
    widget.sucursalCubit.cargarSucursales();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.sucursalCubit,
      child: AlertDialog(
        title: Text(
          'Asignar ${widget.rol == TipoUsuario.encargado ? 'Encargado' : 'Repartidor'}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: BlocBuilder<SucursalCubit, SucursalState>(
          builder: (context, state) {
            if (state.isLoading && state.sucursales.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.errorMessage != null && state.sucursales.isEmpty) {
              return Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              );
            }
            final sucursalesReales = state.sucursales;

            if (sucursalesReales.isEmpty) {
              return const Text('No hay sucursales registradas.');
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecciona a qué sucursal pertenecerá este usuario:',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sucursal',
                    prefixIcon: Icon(Icons.storefront),
                  ),
                  initialValue: sucursalSeleccionadaId,
                  items: sucursalesReales.map((sucursal) {
                    return DropdownMenuItem<String>(
                      value: sucursal.id,
                      child: Text(sucursal.nombre),
                    );
                  }).toList(),
                  onChanged: (String? nuevoValor) {
                    setState(() => sucursalSeleccionadaId = nuevoValor);
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          BlocBuilder<SucursalCubit, SucursalState>(
            builder: (context, state) {
              final bool bloqueado =
                  state.sucursales.isEmpty || sucursalSeleccionadaId == null;

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                ),
                onPressed: bloqueado
                    ? null
                    : () => Navigator.of(context).pop(sucursalSeleccionadaId),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
