
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/editar_perfil_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/editar_perfil_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/widgets/formulario_perfil.dart';

class EditarPerfilPage extends StatelessWidget {
  const EditarPerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final solicitante = (context.read<AuthCubit>().state as AuthAuthenticated).perfil;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mi Perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<EditarPerfilCubit, EditarPerfilState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Perfil actualizado correctamente'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).pop();
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          final cargando = state.maybeWhen(
            saving: () => true,
            orElse: () => false,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _Avatar(perfil: solicitante),
                const SizedBox(height: 32),
                FormularioPerfil(
                  perfil: solicitante,
                  cargando: cargando,
                  onGuardar: (perfilActualizado) {
                    context.read<EditarPerfilCubit>().actualizarPerfil(
                          usuarioActual: solicitante,
                          perfilAEditar: perfilActualizado,
                        );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final Perfil perfil;
  const _Avatar({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: const Color(0xFF1E3A8A).withValues(alpha: 0.1), 
          backgroundImage: perfil.avatarUrl != null
              ? NetworkImage(perfil.avatarUrl!)
              : null,
          child: perfil.avatarUrl == null
              ? Text(
                  perfil.nombre[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                )
              : null,
        ),
        const SizedBox(height: 12),
        Text(
          '${perfil.nombre} ${perfil.apellidoPaterno}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          perfil.rol.name,
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}