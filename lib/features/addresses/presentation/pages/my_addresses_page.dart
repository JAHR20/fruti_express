import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_state.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_card.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_form_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';

class MyAddressesPage extends StatelessWidget {
  final String userId;

  const MyAddressesPage({super.key, required this.userId});

  void _openForm(BuildContext context) {
    final cubit = context.read<AddressCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: cubit,
        child: AddressFormBottomSheet(userId: userId),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Address address) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar dirección'),
        content: Text('¿Deseas eliminar la dirección "${address.alias}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              context.read<AddressCubit>().deleteAddress(address.id);
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Mis Direcciones',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => _openForm(context),
            tooltip: 'Agregar dirección',
          ),
        ],
      ),

      body: BlocConsumer<AddressCubit, AddressState>(
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
        },

        builder: (context, state) {
          if (state.isLoading && state.addresses.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null && state.addresses.isEmpty) {
            return _ErrorView(
              message: state.errorMessage!,
              onRetry: () {
                context.read<AddressCubit>().loadAddresses(userId);
              },
            );
          }

          if (state.addresses.isEmpty) {
            return _EmptyAddresses(onAdd: () => _openForm(context));
          }

          return RefreshIndicator(
            onRefresh: () {
              return context.read<AddressCubit>().loadAddresses(userId);
            },
            child: Builder(
              builder: (context) {
                final cartState = context.watch<CartCubit>().state;
                final activeAddressId = cartState.selectedAddress?.id;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.addresses.length,
                  itemBuilder: (_, index) {
                    final address = state.addresses[index];
                    final isProcessing =
                        state.processingAddressId == address.id;

                    final isActiveInSession = address.id == activeAddressId;

                    return _AddressManagementItem(
                      address: address,
                      isProcessing: isProcessing,
                      isActiveInSession: isActiveInSession,
                      onTap: isActiveInSession
                          ? () {} 
                          : () {
                              context.read<CartCubit>().setDeliveryAddress(address);
                              context
                                  .read<CustomerCoordinatorCubit>()
                                  .changeAddressManually(address);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Usando dirección: ${address.alias}',
                                  ),
                                  backgroundColor: const Color(0xFF1E3A8A),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                      onSetAsMain: address.isMain || isProcessing
                          ? null
                          : () {
                              context.read<AddressCubit>().setAsMainAddress(
                                userId,
                                address.id,
                              );
                            },
                      onDelete: isProcessing
                          ? null
                          : () => _confirmDelete(context, address),
                    );
                  },
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        backgroundColor: const Color(0xFF1E3A8A),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nueva dirección',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _AddressManagementItem extends StatelessWidget {
  final Address address;
  final bool isProcessing;
  final bool isActiveInSession;
  final VoidCallback onTap;
  final VoidCallback? onSetAsMain;
  final VoidCallback? onDelete;

  const _AddressManagementItem({
    required this.address,
    required this.isProcessing,
    required this.isActiveInSession,
    required this.onTap,
    required this.onSetAsMain,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AddressCard(
              address: address,
              isSelected: isActiveInSession,
              onTap: onTap,
            ),

            if (isProcessing)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                ),
              ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onSetAsMain != null)
                TextButton.icon(
                  onPressed: onSetAsMain,
                  icon: const Icon(Icons.star_outline, size: 16),
                  label: const Text('Establecer principal'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF1E3A8A),
                  ),
                ),

              if (onDelete != null)
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Eliminar'),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyAddresses extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyAddresses({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'Sin direcciones guardadas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega una dirección para\nrecibir tus pedidos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_location_alt_outlined),
            label: const Text('Agregar dirección'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
