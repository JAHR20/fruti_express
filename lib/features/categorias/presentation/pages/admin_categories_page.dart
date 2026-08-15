import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import '../cubits/categoria_cubit.dart';
import '../widgets/categoria_list_tile.dart';
import '../widgets/categoria_form_dialog.dart';

class AdminCategoriesPage extends StatefulWidget {
  const AdminCategoriesPage({super.key});

  @override
  State<AdminCategoriesPage> createState() => _AdminCategoriesPageState();
}

class _AdminCategoriesPageState extends State<AdminCategoriesPage> {
  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() {
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      context.read<CategoriaCubit>().cargarCategorias(authState.perfil);
    }
  }

  void _mostrarModalFormulario({Categoria? categoria}) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final perfil = authState.perfil;
    final categoriaCubit = context.read<CategoriaCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: categoriaCubit,
          child: BlocConsumer<CategoriaCubit, CategoriaState>(
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

              if (state.operacionExitosa) {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Guardado correctamente'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CategoriaFormDialog(
                categoriaAEditar: categoria,
                isLoading:
                    state.guardandoOperacion ||
                    state.categoriaProcesandoId != null,
                onSave: (nombre, descripcion, archivoImagen) {
                  if (categoria == null) {
                    context.read<CategoriaCubit>().crearCategoria(
                      usuarioActual: perfil,
                      nombre: nombre,
                      descripcion: descripcion,
                      imagenSeleccionada: archivoImagen,
                    );
                  } else {
                    context.read<CategoriaCubit>().editarCategoria(
                      usuarioActual: perfil,
                      categoriaId: categoria.id,
                      nombre: nombre,
                      descripcion: descripcion,
                      imagenSeleccionada: archivoImagen,
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  void _mostrarDialogoEstado(BuildContext context, Categoria categoria) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final perfil = authState.perfil;

    final bool nuevoEstado = !categoria.activa;

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        titulo: nuevoEstado
            ? '¿Activar "${categoria.nombre}"?'
            : '¿Desactivar "${categoria.nombre}"?',
        mensaje: nuevoEstado
            ? 'La categoría volverá a estar visible para todos los clientes en la tienda.'
            : 'Esta categoría se ocultará de la tienda para los clientes, pero se conservará en tu base de datos.',
        textoConfirmar: nuevoEstado ? 'Activar' : 'Desactivar',
        colorConfirmar: nuevoEstado ? Colors.green : Colors.red,

        onConfirmar: () {
          context.read<CategoriaCubit>().cambiarEstadoCategoria(
            usuarioActual: perfil,
            categoriaId: categoria.id,
            nuevoEstado: nuevoEstado,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Añadir Categoría'),
        onPressed: () => _mostrarModalFormulario(),
      ),
      body: BlocBuilder<CategoriaCubit, CategoriaState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state.categorias.isEmpty) {
            return const Center(child: Text('No hay categorías registradas.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.categorias.length,
              itemBuilder: (context, index) {
                final categoria = state.categorias[index];
                return CategoriaListTile(
                  categoria: categoria,
                  onEdit: () => _mostrarModalFormulario(categoria: categoria),
                  onDesactivar: () => _mostrarDialogoEstado(context, categoria),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
