import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/widgets/direccion_card.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/widgets/formulario_direccion_bottom_sheet.dart';

class MisDireccionesPage extends StatelessWidget {
  final String usuarioId;

  const MisDireccionesPage({super.key, required this.usuarioId});

  void _abrirFormulario(BuildContext context) {
    final cubit = context.read<DireccionesCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: cubit,
        child: FormularioDireccionBottomSheet(usuarioId: usuarioId),
      ),
    );
  }

  void _confirmarEliminar(BuildContext context, Direccion direccion) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar dirección'),
        content: Text('¿Deseas eliminar la dirección "${direccion.alias}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              context.read<DireccionesCubit>().eliminarDireccion(direccion.id);
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Mis Direcciones',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => _abrirFormulario(context),
            tooltip: 'Agregar dirección',
          ),
        ],
      ),

      body: BlocConsumer<DireccionesCubit, DireccionesState>(
        listenWhen: (previous, current) =>
            previous.operacionError != current.operacionError ||
            previous.operacionExitosa != current.operacionExitosa,

        listener: (context, state) {
          if (state.operacionError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.operacionError!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },

        builder: (context, state) {

          if (state.isLoading && state.direcciones.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null && state.direcciones.isEmpty) {
            return _ErrorView(
              mensaje: state.errorMessage!,
              onReintentar: () {
                context.read<DireccionesCubit>().cargarDirecciones(usuarioId);
              },
            );
          }

          if (state.direcciones.isEmpty) {
            return _SinDirecciones(onAgregar: () => _abrirFormulario(context));
          }

          return RefreshIndicator(
            onRefresh: () {
              return context.read<DireccionesCubit>().cargarDirecciones(
                usuarioId,
              );
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.direcciones.length,
              itemBuilder: (_, index) {
                final direccion = state.direcciones[index];

                final estaProcesando =
                    state.direccionProcesandoId == direccion.id;

                return _DireccionItemGestion(
                  direccion: direccion,
                  estaProcesando: estaProcesando,

                  onEstablecerPrincipal: direccion.esPrincipal || estaProcesando
                      ? null
                      : () {
                          context
                              .read<DireccionesCubit>()
                              .establecerComoPrincipal(usuarioId, direccion.id);
                        },

                  onEliminar: estaProcesando
                      ? null
                      : () => _confirmarEliminar(context, direccion),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _abrirFormulario(context),
        backgroundColor: const Color(0xFF1E3A8A),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nueva dirección',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _DireccionItemGestion extends StatelessWidget {
  final Direccion direccion;
  final bool estaProcesando;
  final VoidCallback? onEstablecerPrincipal;
  final VoidCallback? onEliminar;

  const _DireccionItemGestion({
    required this.direccion,
    required this.estaProcesando,
    required this.onEstablecerPrincipal,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            DireccionCard(
              direccion: direccion,
              estaSeleccionada: direccion.esPrincipal,
              onTap: () {},
            ),

            if (estaProcesando)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                ),
              ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onEstablecerPrincipal != null)
                TextButton.icon(
                  onPressed: onEstablecerPrincipal,
                  icon: const Icon(Icons.star_outline, size: 16),
                  label: const Text('Establecer principal'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF1E3A8A),
                  ),
                ),

              if (onEliminar != null)
                TextButton.icon(
                  onPressed: onEliminar,
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Eliminar'),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SinDirecciones extends StatelessWidget {
  final VoidCallback onAgregar;
  const _SinDirecciones({required this.onAgregar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'Sin direcciones guardadas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega una dirección para\nrecibir tus pedidos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onAgregar,
            icon: const Icon(Icons.add_location_alt_outlined),
            label: const Text('Agregar dirección'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String mensaje;
  final VoidCallback onReintentar;
  const _ErrorView({required this.mensaje, required this.onReintentar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(mensaje, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: onReintentar,
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
