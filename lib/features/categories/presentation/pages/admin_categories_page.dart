import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import '../widgets/admin_category_list_tile.dart';
import '../widgets/category_form_bottom_sheet.dart';

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
      context.read<CategoryCubit>().loadCategories(authState.user);
    }
  }

  void _showFormModal({Category? category}) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final profile = authState.user;
    final categoryCubit = context.read<CategoryCubit>();
    final colors = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
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
                    content: Text(
                      state.operationError!,
                      style: TextStyle(color: colors.onError),
                    ),
                    backgroundColor: colors.error,
                  ),
                );
              }

              if (state.operationSuccessful) {
                Navigator.of(bottomSheetContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Guardado correctamente',
                      style: TextStyle(color: colors.onPrimary),
                    ),
                    backgroundColor: colors.primary,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CategoryFormBottomSheet(
                categoryToEdit: category,
                isSaving:
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

    final profile = authState.user;
    final bool newState = !category.isActive;
    final colors = Theme.of(context).colorScheme;

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
        confirmColor: newState ? colors.primary : colors.error,
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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        icon: const Icon(Icons.add),
        label: const Text('Añadir Categoría'),
        onPressed: () => _showFormModal(),
      ),
      body: BlocConsumer<CategoryCubit, CategoryState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null && state.categories.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage!,
                  style: TextStyle(color: colors.onError),
                ),
                backgroundColor: colors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          // 1. CARGA INICIAL (Solo si no hay datos)
          if (state.isLoading && state.categories.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          // 2. ERROR GLOBAL
          if (state.errorMessage != null && state.categories.isEmpty) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: colors.error),
              ),
            );
          }

          return RefreshIndicator(
            color: colors.primary,
            onRefresh: () async {
              final authState = context.read<AuthCubit>().state;
              if (authState is! AuthAuthenticated) return;
              await context.read<CategoryCubit>().loadCategories(
                authState.user,
              );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(), // 👈 Obligatorio
              slivers: [
                // CASO A: ESTADO VACÍO
                if (state.categories.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AnimatedEmptyState(
                      icon: Icon(Icons.category_outlined),
                      title: 'No hay categorías',
                      subtitle:
                          'Aún no hay categorías registradas en el sistema.',
                    ),
                  )
                // CASO B: LISTA DE CATEGORÍAS
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ), // Mismo padding que tenías
                    sliver: SliverList.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return AdminCategoryListTile(
                          category: category,
                          onEdit: () => _showFormModal(category: category),
                          onDeactivate: () =>
                              _showStatusDialog(context, category),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
