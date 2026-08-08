import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';

// Imports de tus widgets y cubits
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

    // 🚨 NUEVO: 1. Capturamos el Cubit de la página ANTES de entrar al showDialog
    final categoriaCubit = context.read<CategoriaCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        // 🌉 NUEVO: 2. Construimos el puente usando BlocProvider.value
        return BlocProvider.value(
          value: categoriaCubit, // Le pasamos el Cubit que capturamos arriba
          // Tu BlocConsumer original se queda igual, pero ahora envuelto por este puente
          child: BlocConsumer<CategoriaCubit, CategoriaState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                ),
                loaded: (_) {
                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Guardado correctamente'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return CategoriaFormDialog(
                categoriaAEditar: categoria,
                isLoading: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                onSave: (nombre, descripcion, imagenUrl) {
                  if (categoria == null) {
                    context.read<CategoriaCubit>().crearCategoria(
                      usuarioActual: perfil,
                      nombre: nombre,
                      descripcion: descripcion,
                      imagenSeleccionada: imagenUrl,
                    );
                  } else {
                    context.read<CategoriaCubit>().editarCategoria(
                      usuarioActual: perfil,
                      categoriaId: categoria.id,
                      nombre: nombre,
                      descripcion: descripcion,
                      imagenSeleccionada: imagenUrl,
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
        onPressed: () => _mostrarModalFormulario(), // Modal para CREAR
      ),

      body: BlocBuilder<CategoriaCubit, CategoriaState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
            loaded: (lista) {
              if (lista.isEmpty) {
                return const Center(
                  child: Text('No hay categorías registradas.'),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final categoria = lista[index];
                    return CategoriaListTile(
                      categoria: categoria,
                      onEdit: () =>
                          _mostrarModalFormulario(categoria: categoria),
                      onDesactivar: () =>
                          _mostrarDialogoEstado(context, categoria),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
