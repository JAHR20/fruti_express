import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/repartidores_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/repartidores_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class AsignarRepartidorSheet extends StatefulWidget {
  final String pedidoId;

  const AsignarRepartidorSheet({super.key, required this.pedidoId});

  @override
  State<AsignarRepartidorSheet> createState() => _AsignarRepartidorSheetState();
}

class _AsignarRepartidorSheetState extends State<AsignarRepartidorSheet> {
  String? _repartidorSeleccionadoId;

  @override
  void initState() {
    super.initState();

    final perfil = context.read<AuthCubit>().state.maybeWhen(
      authenticated: (p) => p,
      orElse: () => null,
    );

    if (perfil != null) {
      context.read<RepartidoresCubit>().cargar(solicitante: perfil);
    }
  }

  void _confirmar() {
    if (_repartidorSeleccionadoId == null) return;

    Navigator.of(context).pop();

    context.read<PedidosEncargadoCubit>().asignarRepartidorYPreparar(
      pedidoId: widget.pedidoId,
      repartidorId: _repartidorSeleccionadoId!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Asignar Repartidor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Selecciona quién llevará este pedido',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),

          // ─── Lista de repartidores ────────────────────────────────────────
          BlocBuilder<RepartidoresCubit, RepartidoresState>( // ← tipo correcto
            builder: (context, state) {
              return state.when(
                inicial: () => const SizedBox.shrink(),
                cargando: () => const Center(child: CircularProgressIndicator()),
                error: (msg) => Center(
                  child: Text(msg, style: const TextStyle(color: Colors.red)),
                ),
                cargado: (repartidores) {
                  if (repartidores.isEmpty) {
                    return const Center(
                      child: Text('No hay repartidores disponibles'),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: repartidores.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) => _RepartidorTile(
                      repartidor: repartidores[i],
                      seleccionado:
                          repartidores[i].id == _repartidorSeleccionadoId,
                      onTap: () => setState(
                        () => _repartidorSeleccionadoId = repartidores[i].id,
                      ),
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: _repartidorSeleccionadoId != null ? _confirmar : null,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Asignar y Preparar',
                  style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _RepartidorTile extends StatelessWidget {
  final Perfil repartidor;
  final bool seleccionado;
  final VoidCallback onTap;

  const _RepartidorTile({
    required this.repartidor,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF1E3A8A).withValues(alpha: 0.1),
        backgroundImage: repartidor.avatarUrl != null
            ? NetworkImage(repartidor.avatarUrl!)
            : null,
        child: repartidor.avatarUrl == null
            ? Text(
                repartidor.nombre[0].toUpperCase(),
                style: const TextStyle(
                    color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold),
              )
            : null,
      ),
      title: Text(
        '${repartidor.nombre} ${repartidor.apellidoPaterno}',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: repartidor.telefono != null
          ? Text(repartidor.telefono!, style: const TextStyle(fontSize: 12))
          : null,
      trailing: seleccionado
          ? const Icon(Icons.check_circle, color: Colors.purple)
          : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
    );
  }
}