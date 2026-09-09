import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_state.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/widgets/stock_adjustment_dialog.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/widgets/inventory_card.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';

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

    final currentUser = authState.profile;
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

    if (authState is! AuthAuthenticated) {
      return const Scaffold(
        body: Center(child: Text('No hay una sesión activa.')),
      );
    }

    final currentUser = authState.profile;

    final isGlobalAdmin =
        currentUser.branchId == null || currentUser.branchId!.isEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Control de Bodega',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          if (isGlobalAdmin)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
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
                    return const Text(
                      'No hay sucursales registradas.',
                      style: TextStyle(color: Colors.grey),
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

                      setState(() {
                        _selectedBranchId = newId;
                      });

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
                      content: Text(state.errorMessage!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.operationError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.operationError!),
                      backgroundColor: Colors.red,
                    ),
                  );

                  context.read<InventoryCubit>().clearOperationError();
                }

                if (state.operationSuccessful) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Stock actualizado correctamente.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },

              builder: (context, state) {
                if (state.isLoading && state.inventory.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  );
                }

                if (state.errorMessage != null && state.inventory.isEmpty) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                if (state.branchId == null) {
                  return const Center(
                    child: Text(
                      'Selecciona una sucursal para consultar su inventario.',
                    ),
                  );
                }

                if (state.inventory.isEmpty) {
                  return const Center(
                    child: Text(
                      'Aún no hay registros de inventario en esta sucursal.',
                    ),
                  );
                }

                final productState = context.watch<ProductCubit>().state; 
                final productList = productState.products;

                return Stack(
                  children: [
                    ListView.builder(
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
      ),
    );
  }
}