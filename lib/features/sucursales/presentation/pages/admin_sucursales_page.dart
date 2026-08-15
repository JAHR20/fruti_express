import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';
import 'package:go_router/go_router.dart';
import '../widgets/sucursal_list_tile.dart';

class AdminSucursalesPage extends StatefulWidget {
  const AdminSucursalesPage({super.key});

  @override
  State<AdminSucursalesPage> createState() => _AdminSucursalesPageState();
}

class _AdminSucursalesPageState extends State<AdminSucursalesPage> {
  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() {
    context.read<SucursalCubit>().cargarSucursales();
  }

  void _abrirWizardCreacion() async {
    await context.pushNamed(AppRouter.adminSucursalesNueva);
    _cargarDatos();
  }

  void _abrirWizardEdicion(Sucursal sucursal, int pasoInicial) async {
    await context.pushNamed(
      AppRouter.adminSucursalesNueva,
      extra: {'sucursal': sucursal, 'pasoInicial': pasoInicial},
    );
    _cargarDatos();
  }

  void _abrirPantallaTarifas(String sucursalId) {
    context.pushNamed(
      AppRouter.adminSucursalesTarifasName,
      pathParameters: {'id': sucursalId},
    );
  }

  void _mostrarDialogoEstado(BuildContext context, Sucursal sucursal) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final perfil = authState.perfil;
    final bool activar = !sucursal.activa;

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        titulo: activar
            ? '¿Activar "${sucursal.nombre}"?'
            : '¿Desactivar "${sucursal.nombre}"?',
        mensaje: activar
            ? 'La sucursal volverá a estar operativa y visible.'
            : 'Esta sucursal se marcará como inactiva temporalmente.',
        textoConfirmar: activar ? 'Activar' : 'Desactivar',
        colorConfirmar: activar ? Colors.green : Colors.red,
        onConfirmar: () {
          context.read<SucursalCubit>().cambiarEstadoSucursal(
            usuarioActual: perfil,
            sucursalId: sucursal.id,
            nuevoEstado: activar,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Sucursales'),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Nueva Sucursal'),
        onPressed: () => _abrirWizardCreacion(),
      ),

      body: BlocConsumer<SucursalCubit, SucursalState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null &&
              ModalRoute.of(context)?.isCurrent == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.sucursales.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null && state.sucursales.isEmpty) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          final lista = state.sucursales;
          if (lista.isEmpty) {
            return const Center(child: Text('No hay sucursales registradas.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final sucursal = lista[index];
                final tieneEnvioConfigurado = state
                    .sucursalesConEnvioConfigurado
                    .contains(sucursal.id);
                return Column(
                  children: [
                    SucursalListTile(
                      sucursal: sucursal,
                      onEdit: () => _abrirWizardEdicion(sucursal, 0),
                      onCambiarEstado: () =>
                          _mostrarDialogoEstado(context, sucursal),
                    ),

                    if (!tieneEnvioConfigurado)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.orange,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Falta configurar cobertura y envío',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _abrirWizardEdicion(sucursal, 1),
                              child: const Text('Completar'),
                            ),
                          ],
                        ),
                      ),

                    TextButton.icon(
                      onPressed: () => _abrirPantallaTarifas(sucursal.id),
                      icon: const Icon(Icons.two_wheeler, color: Colors.green),
                      label: const Text(
                        'Configurar Precios de Envío',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    const Divider(),
                    TextButton.icon(
                      onPressed: () => _abrirWizardEdicion(sucursal, 1),
                      icon: const Icon(Icons.map, color: Colors.blue),
                      label: const Text(
                        'Configurar Cobertura (Mapa y C.P.)',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
