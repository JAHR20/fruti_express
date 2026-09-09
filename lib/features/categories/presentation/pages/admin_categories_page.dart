import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import '../widgets/admin_category_list_tile.dart';
import '../widgets/category_form_dialog.dart';

class AdminCategoriesPage extends StatefulWidget {
  const AdminCategoriesPage({super.key});

  @override
  State<AdminCategoriesPage> createState() => _AdminCategoriesPageState();
}

class _AdminCategoriesPageState extends State<AdminCategoriesPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      context.read<CategoryCubit>().loadCategories(authState.profile);
    }
  }

  void _showFormModal({Category? category}) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final profile = authState.profile;
    final categoryCubit = context.read<CategoryCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: categoryCubit,
          child: BlocConsumer<CategoryCubit, CategoryState>(
            listenWhen: (previous, current) =>
                previous.operationError != current.operationError ||
                previous.operationSuccessful != current.operationSuccessful,
            listener: (context, state) {
              if (state.operationError != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.operationError!),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state.operationSuccessful) {
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
              return CategoryFormDialog(
                categoryToEdit: category,
                isLoading:
                    state.isSavingOperation ||
                    state.processingCategoryId != null,
                onSave: (name, description, imageFile) {
                  if (category == null) {
                    context.read<CategoryCubit>().createCategory(
                      currentUser: profile,
                      name: name,
                      description: description,
                      selectedImage: imageFile,
                    );
                  } else {
                    context.read<CategoryCubit>().updateCategory(
                      currentUser: profile,
                      categoryId: category.id,
                      name: name,
                      description: description,
                      selectedImage: imageFile,
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

  void _showStatusDialog(BuildContext context, Category category) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final profile = authState.profile;
    final bool newState = !category.isActive;

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        title: newState
            ? '¿Activar "${category.name}"?'
            : '¿Desactivar "${category.name}"?',
        message: newState
            ? 'La categoría volverá a estar visible para todos los clientes en la tienda.'
            : 'Esta categoría se ocultará de la tienda para los clientes, pero se conservará en tu base de datos.',
        confirmText: newState ? 'Activar' : 'Desactivar',
        confirmColor: newState ? Colors.green : Colors.red,
        onConfirm: () {
          context.read<CategoryCubit>().changeCategoryStatus(
            currentUser: profile,
            categoryId: category.id,
            newState: newState,
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
        onPressed: () => _showFormModal(),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
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

          if (state.categories.isEmpty) {
            return const Center(child: Text('No hay categorías registradas.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return AdminCategoryListTile(
                  category: category,
                  onEdit: () => _showFormModal(category: category),
                  onDeactivate: () => _showStatusDialog(context, category),
                );
              },
            ),
          );
        },
      ),
    );
  }
}