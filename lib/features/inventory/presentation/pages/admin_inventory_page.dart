import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_state.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/widgets/stock_adjustment_dialog.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/widgets/inventory_card.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/cubits/admin_products_cubit.dart';

class AdminInventoryPage extends StatefulWidget {
  const AdminInventoryPage({super.key});

  @override
  State<AdminInventoryPage> createState() => _AdminInventoryPageState();
}

class _AdminInventoryPageState extends State<AdminInventoryPage> {
  String? _selectedBranchId;

  void _showAdjustmentDialog(
    BuildContext context,
    String productId,
    String branchId,
    bool isIncrease,
    MeasurementUnit unit,
    int currentStock,
  ) {
    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) return;

    final currentUser = authState.user;
    final inventoryCubit = context.read<InventoryCubit>();

    showDialog(
      context: context,
      builder: (_) => StockAdjustmentDialog(
        isIncrease: isIncrease,
        measurementUnit: unit,
        currentStock: currentStock,
        onConfirm: (quantity) {
          inventoryCubit.adjustManualStock(
            currentUser: currentUser,
            productId: productId,
            branchId: branchId,
            quantity: quantity,
            isIncrease: isIncrease,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final colors = Theme.of(context).colorScheme;

    if (authState is! AuthAuthenticated) {
      return Center(
        child: Text(
          'No hay una sesión activa.',
          style: TextStyle(color: colors.onSurfaceVariant),
        ),
      );
    }

    final currentUser = authState.user;
    final isGlobalAdmin =
        currentUser.branchId == null || currentUser.branchId!.isEmpty;

    return Column(
      children: [
        if (isGlobalAdmin)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            decoration: BoxDecoration(
              color: colors.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                if (state.isLoading && state.branches.isEmpty) {
                  return const LinearProgressIndicator();
                }

                final branches = state.branches;

                if (branches.isEmpty) {
                  // Eliminamos el onRefresh de aquí porque no se puede
                  // hacer pull-to-refresh dentro de este Container pequeño.
                  // Si quieres que puedan recargar las sucursales,
                  // lo ideal sería un botón o que el refresh de abajo lo haga.
                  return const AnimatedEmptyState(
                    icon: Icon(Icons.inventory_2_outlined),
                    title: 'No hay sucursales',
                    subtitle:
                        'Aún no hay sucursales registradas en el sistema.',
                  );
                }

                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Selecciona una sucursal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  initialValue: _selectedBranchId,
                  items: branches.map((branch) {
                    return DropdownMenuItem<String>(
                      value: branch.id,
                      child: Text(branch.name),
                    );
                  }).toList(),
                  onChanged: (newId) {
                    if (newId == null) return;
                    setState(() => _selectedBranchId = newId);
                    context.read<InventoryCubit>().loadInventory(newId);
                  },
                );
              },
            ),
          ),

        Expanded(
          child: BlocConsumer<InventoryCubit, InventoryState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage ||
                previous.operationError != current.operationError ||
                previous.operationSuccessful != current.operationSuccessful,
            listener: (context, state) {
              if (state.errorMessage != null) {
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
                context.read<InventoryCubit>().clearOperationError();
              }

              if (state.operationSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Stock actualizado correctamente.',
                      style: TextStyle(color: colors.onPrimaryContainer),
                    ),
                    backgroundColor: colors.primary,
                  ),
                );
              }
            },
            builder: (context, state) {
              // Helper interno para refrescar
              // Helper interno para refrescar
              Future<void> handleRefresh() async {
                // 1. Guardamos las referencias ANTES de cualquier "await"
                final inventoryCubit = context.read<InventoryCubit>();
                final branchCubit = context.read<BranchCubit>();

                // 2. Ejecutamos las tareas usando las referencias guardadas
                if (state.branchId != null) {
                  await inventoryCubit.loadInventory(state.branchId!);
                }

                // Si es admin global, también recargamos las sucursales
                if (isGlobalAdmin) {
                  await branchCubit.loadBranches();
                }
              }

              // 1. CARGA INICIAL
              if (state.isLoading && state.inventory.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }

              // 2. ERROR GLOBAL
              if (state.errorMessage != null && state.inventory.isEmpty) {
                return _buildRefreshableEmptyState(
                  context,
                  onRefresh: handleRefresh,
                  child: Center(
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: TextStyle(color: colors.error),
                    ),
                  ),
                );
              }

              // 3. ESTADO VACÍO: NO HA SELECCIONADO SUCURSAL
              if (state.branchId == null) {
                return _buildRefreshableEmptyState(
                  context,
                  onRefresh: handleRefresh,
                  child: const AnimatedEmptyState(
                    icon: Icon(Icons.storefront_outlined),
                    title: 'Selecciona una sucursal',
                    subtitle:
                        'Elige una sucursal en el menú superior\npara consultar su inventario.',
                  ),
                );
              }

              // 4. ESTADO VACÍO: SUCURSAL SIN INVENTARIO
              if (state.inventory.isEmpty) {
                return _buildRefreshableEmptyState(
                  context,
                  onRefresh: handleRefresh,
                  child: const AnimatedEmptyState(
                    icon: Icon(Icons.inventory_2_outlined),
                    title: 'Inventario vacío',
                    subtitle:
                        'Aún no hay registros de inventario\nen esta sucursal.',
                  ),
                );
              }

              // 5. LISTA DE INVENTARIO CON DATOS
              final productState = context.watch<AdminProductsCubit>().state;
              final productList = productState.products;

              return Stack(
                children: [
                  RefreshIndicator(
                    color: colors.primary,
                    onRefresh: handleRefresh,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      itemCount: state.inventory.length,
                      itemBuilder: (context, index) {
                        final item = state.inventory[index];

                        final productIndex = productList.indexWhere(
                          (product) => product.id == item.productId,
                        );

                        if (productIndex == -1) {
                          return const SizedBox.shrink();
                        }

                        final product = productList[productIndex];
                        final isUpdating =
                            state.processingProductId == item.productId;

                        return InventoryCard(
                          item: item,
                          product: product,
                          isUpdating: isUpdating,
                          onIncrease: () {
                            _showAdjustmentDialog(
                              context,
                              item.productId,
                              item.branchId,
                              true,
                              product.measurementUnit,
                              item.availableStock,
                            );
                          },
                          onDecrease: () {
                            _showAdjustmentDialog(
                              context,
                              item.productId,
                              item.branchId,
                              false,
                              product.measurementUnit,
                              item.availableStock,
                            );
                          },
                        );
                      },
                    ),
                  ),

                  if (state.isLoading)
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper para hacer scrolleables los estados vacíos
  Widget _buildRefreshableEmptyState(
    BuildContext context, {
    required Widget child,
    required Future<void> Function() onRefresh,
  }) {
    final colors = Theme.of(context).colorScheme;
    return RefreshIndicator(
      color: colors.primary,
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
      ),
    );
  }
}
