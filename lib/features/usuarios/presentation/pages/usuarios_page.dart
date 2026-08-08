import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_state.dart';
import '../widgets/tarjeta_usuario.dart';

class UsuariosPage extends StatefulWidget {
  final Perfil usuarioActual;

  const UsuariosPage({super.key, required this.usuarioActual});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  void initState() {
    super.initState();
    if (widget.usuarioActual.esAdmin) {
      context.read<UsuariosCubit>().cargarUsuarios(widget.usuarioActual);
    } else {
      context.read<UsuariosCubit>().cargarClientes(widget.usuarioActual);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabsPermitidas = [
      if (widget.usuarioActual.esAdmin) const Tab(text: 'Todos'),
      const Tab(text: 'Repartidores'),
      const Tab(text: 'Clientes'),
    ];

    return DefaultTabController(
      length: tabsPermitidas.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: tabsPermitidas,
            onTap: (index) => _manejarCambioTab(tabsPermitidas[index].text),
          ),
          actions: [
            if (widget.usuarioActual.esStaff)
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: BlocConsumer<UsuariosCubit, UsuariosState>(
          listener: (context, state) {
            if (state is UsuariosError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is UsuariosLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UsuariosLoaded) {
              if (state.usuarios.isEmpty) {
                return const Center(child: Text('No hay usuarios para mostrar.'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: state.usuarios.length,
                itemBuilder: (context, index) {
                  return TarjetaUsuario(
                    usuarioTarget: state.usuarios[index],
                    usuarioActual: widget.usuarioActual,
                    sucursalCubit: context.read<SucursalCubit>(),
                    onEstadoCambiado: (nuevoEstado) {
                      context.read<UsuariosCubit>().cambiarEstadoUsuario(
                            usuarioActual: widget.usuarioActual,
                            usuarioId: state.usuarios[index].id,
                            activar: nuevoEstado,
                          );
                    },
                    onRolCambiado: (nuevoRol, sucursalId) {
                      context.read<UsuariosCubit>().cambiarRol(
                            usuarioActual: widget.usuarioActual,
                            usuarioId: state.usuarios[index].id,
                            nuevoRol: nuevoRol,
                            sucursalAsignadaId: sucursalId,
                          );
                    },
                  );
                },
              );
            }
            return const Center(child: Text('Selecciona una pestaña para cargar datos.'));
          },
        ),
      ),
    );
  }

  void _manejarCambioTab(String? tabText) {
    if (tabText == 'Todos') {
      context.read<UsuariosCubit>().cargarUsuarios(widget.usuarioActual);
    } else if (tabText == 'Repartidores') {
      context.read<UsuariosCubit>().cargarRepartidores(usuarioActual: widget.usuarioActual);
    } else if (tabText == 'Clientes') {
      context.read<UsuariosCubit>().cargarClientes(widget.usuarioActual);
    }
  }
}