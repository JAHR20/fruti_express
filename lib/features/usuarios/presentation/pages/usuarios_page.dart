import 'dart:async';
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
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

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
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<UsuariosCubit>().buscarUsuarios(
        usuarioActual: widget.usuarioActual,
        query: query,
      );
    });
  }

  void _cerrarBusqueda() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
    context.read<UsuariosCubit>().buscarUsuarios(
      usuarioActual: widget.usuarioActual,
      query: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<UsuariosTab> tabsPermitidas = [
      if (widget.usuarioActual.esAdmin) UsuariosTab.todos,
      UsuariosTab.repartidores,
      UsuariosTab.clientes,
    ];

    return DefaultTabController(
      length: tabsPermitidas.length,
      child: Scaffold(
        appBar: AppBar(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: 'Buscar por nombre o correo...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                  onChanged: _onSearchChanged,
                )
              : const Text(
                  'Usuarios',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
          backgroundColor: const Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: tabsPermitidas.map((tab) {
              switch (tab) {
                case UsuariosTab.todos:
                  return const Tab(text: 'Todos');
                case UsuariosTab.repartidores:
                  return const Tab(text: 'Repartidores');
                case UsuariosTab.clientes:
                  return const Tab(text: 'Clientes');
              }
            }).toList(),
            onTap: (index) {
              if (_isSearching) _cerrarBusqueda();
              _manejarCambioTab(tabsPermitidas[index]);
            },
          ),
          actions: [
            if (widget.usuarioActual.esStaff)
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: () {
                  if (_isSearching) {
                    _cerrarBusqueda();
                  } else {
                    setState(() => _isSearching = true);
                  }
                },
              ),
          ],
        ),
        body: BlocConsumer<UsuariosCubit, UsuariosState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading && state.usuarios.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.usuarios.isEmpty) {
              return Center(
                child: Text(
                  state.searchQuery.isNotEmpty
                      ? 'No se encontraron usuarios para "${state.searchQuery}"'
                      : 'No hay usuarios para mostrar.',
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.usuarios.length,
              itemBuilder: (context, index) {
                final usuarioTarget = state.usuarios[index];

                return TarjetaUsuario(
                  usuarioTarget: usuarioTarget,
                  usuarioActual: widget.usuarioActual,
                  sucursalCubit: context.read<SucursalCubit>(),
                  isProcesando: state.usuarioProcesandoId == usuarioTarget.id,
                  onEstadoCambiado: (nuevoEstado) {
                    context.read<UsuariosCubit>().cambiarEstadoUsuario(
                      usuarioActual: widget.usuarioActual,
                      usuarioId: usuarioTarget.id,
                      activar: nuevoEstado,
                    );
                  },
                  onRolCambiado: (nuevoRol, sucursalId) {
                    context.read<UsuariosCubit>().cambiarRol(
                      usuarioActual: widget.usuarioActual,
                      usuarioId: usuarioTarget.id,
                      nuevoRol: nuevoRol,
                      sucursalAsignadaId: sucursalId,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _manejarCambioTab(UsuariosTab tabSeleccionado) {
    final cubit = context.read<UsuariosCubit>();
    switch (tabSeleccionado) {
      case UsuariosTab.todos:
        cubit.cargarUsuarios(widget.usuarioActual);
        break;
      case UsuariosTab.repartidores:
        cubit.cargarRepartidores(usuarioActual: widget.usuarioActual);
        break;
      case UsuariosTab.clientes:
        cubit.cargarClientes(widget.usuarioActual);
        break;
    }
  }
}
