import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_state.dart';

class GestionTarifasScreen extends StatefulWidget {
  final String sucursalId;

  const GestionTarifasScreen({super.key, required this.sucursalId});

  @override
  State<GestionTarifasScreen> createState() => _GestionTarifasScreenState();
}

class _GestionTarifasScreenState extends State<GestionTarifasScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EnvioAdminCubit>().cargarDatos(widget.sucursalId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarifas de Envío')),
      body: BlocConsumer<EnvioAdminCubit, EnvioAdminState>(
        listener: (context, state) {
          if (state.mensajeExito != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mensajeExito!),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.tarifas.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.tarifas.isEmpty) {
            return const Center(
              child: Text(
                'No hay tarifas configuradas.\nAgrega la primera tocando el botón +',
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.tarifas.length,
            itemBuilder: (context, index) {
              final tarifa = state.tarifas[index];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.two_wheeler, color: Colors.green),
                  title: Text(
                    'De ${tarifa.distanciaMinKm} a ${tarifa.distanciaMaxKm} km',
                  ),
                  subtitle: Text('Costo: \$${tarifa.costo.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _confirmarEliminacion(context, tarifa.id),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormularioTarifa(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmarEliminacion(BuildContext context, String tarifaId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('¿Eliminar tarifa?'),
        content: const Text('Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              final authState = context.read<AuthCubit>().state;
              if (authState is AuthAuthenticated) {
                context.read<EnvioAdminCubit>().eliminarTarifa(
                  usuarioActual: authState.perfil,
                  tarifaId: tarifaId,
                );
              }
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _mostrarFormularioTarifa(BuildContext context) {
    final nombreCtrl = TextEditingController();
    final minCtrl = TextEditingController();
    final maxCtrl = TextEditingController();
    final costoCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Nueva Tarifa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: nombreCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre (ej. Zona Céntrica, Tarifa Base)',
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: minCtrl,
                    decoration: const InputDecoration(labelText: 'Km Mínimo'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: maxCtrl,
                    decoration: const InputDecoration(labelText: 'Km Máximo'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextField(
              controller: costoCtrl,
              decoration: const InputDecoration(
                labelText: 'Costo de Envío (\$)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final authState = context.read<AuthCubit>().state;
                  if (authState is! AuthAuthenticated) return;

                  final tarifa = TarifaEnvio(
                    id: '',
                    sucursalId: widget.sucursalId,
                    nombre: nombreCtrl.text.isEmpty
                        ? 'Tarifa Estándar'
                        : nombreCtrl.text,
                    distanciaMinKm: double.tryParse(minCtrl.text) ?? 0,
                    distanciaMaxKm: double.tryParse(maxCtrl.text) ?? 0,
                    costo: int.tryParse(costoCtrl.text) ?? 0,
                    activa: true,
                    fechaCreacion: DateTime.now(),
                  );

                  context.read<EnvioAdminCubit>().guardarTarifa(
                    usuarioActual: authState.perfil,
                    tarifa: tarifa,
                  );

                  Navigator.pop(ctx);
                },
                child: const Text('Guardar Tarifa'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
