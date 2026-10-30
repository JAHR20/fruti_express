import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
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
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: BlocConsumer<AddressCubit, AddressState>(
          listenWhen: (previous, current) =>
              previous.operationSuccessful != current.operationSuccessful,
          listener: (ctx, state) {
            if (state.operationSuccessful) {
              final colorScheme = Theme.of(ctx).colorScheme;

              Navigator.pop(ctx);
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                  content: Text(
                    'Dirección guardada correctamente',
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  backgroundColor: colorScheme.primary,
                ),
              );
            }
          },
          builder: (ctx, state) {
            final isSaving = state.isLoading || state.processingAddressId != null;

            return AddressFormBottomSheet(
              isSaving: isSaving,
              onSave: (
                alias,
                street,
                exteriorNumber,
                interiorNumber,
                neighborhood,
                zipCode,
                municipality,
                stateStr,
                references,
                isMain,
                latitude,
                longitude,
              ) {
                final newAddress = Address(
                  id: '',
                  userId: userId,
                  alias: alias,
                  street: street,
                  exteriorNumber: exteriorNumber,
                  interiorNumber: interiorNumber,
                  neighborhood: neighborhood,
                  zipCode: zipCode,
                  municipality: municipality,
                  state: stateStr,
                  references: references,
                  isMain: isMain,
                  createdAt: DateTime.now(),
                  latitude: latitude,
                  longitude: longitude,
                );

                ctx.read<AddressCubit>().createAddress(newAddress);
              },
            );
          },
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Address address) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar dirección'),
        content: Text('¿Deseas eliminar la dirección "${address.alias}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Cancelar',
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<AddressCubit>().deleteAddress(address.id);
            },
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Mis Direcciones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<AddressCubit, AddressState>(
        listenWhen: (previous, current) =>
            previous.operationError != current.operationError ||
            previous.operationSuccessful != current.operationSuccessful,
        listener: (context, state) {
          if (state.operationError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.operationError!,
                  style: TextStyle(color: colorScheme.onError),
                ),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.addresses.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }

          // 2. ESTADO DE ERROR
          if (state.errorMessage != null && state.addresses.isEmpty) {
            return _ErrorView(
              message: state.errorMessage!,
              onRetry: () => context.read<AddressCubit>().loadAddresses(userId),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<AddressCubit>().loadAddresses(userId),
            child: Builder(
              builder: (context) {
                final cartState = context.watch<CartCubit>().state;
                final activeAddressId = cartState.selectedAddress?.id;

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    
                    // CASO A: ESTADO VACÍO (SliverFillRemaining)
                    if (state.addresses.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: AnimatedEmptyState(
                          icon: Icon(Icons.location_off_outlined),
                          title: 'Sin direcciones guardadas',
                          subtitle: 'Agrega una dirección para recibir tus pedidos',
                        ),
                      )
                      
                    // CASO B: LISTA DE DIRECCIONES (SliverList)
                    else
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList.builder(
                          itemCount: state.addresses.length,
                          itemBuilder: (_, index) {
                            final address = state.addresses[index];
                            final isProcessing = state.processingAddressId == address.id;
                            final isActiveInSession = address.id == activeAddressId;

                            return _AddressManagementItem(
                              address: address,
                              isProcessing: isProcessing,
                              isActiveInSession: isActiveInSession,
                              onTap: isActiveInSession
                                  ? () {}
                                  : () {
                                      context.read<CartCubit>().setDeliveryAddress(address);
                                      context.read<CustomerCoordinatorCubit>().changeAddressManually(address);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Usando dirección: ${address.alias}',
                                            style: TextStyle(color: colorScheme.onPrimary),
                                          ),
                                          backgroundColor: colorScheme.primary,
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
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add, color: colorScheme.onPrimary),
        label: Text(
          'Nueva dirección',
          style: TextStyle(color: colorScheme.onPrimary),
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
    final colorScheme = Theme.of(context).colorScheme;

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
                    color: colorScheme.surface.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
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
                    foregroundColor: colorScheme.primary,
                  ),
                ),
              if (onDelete != null)
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Eliminar'),
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.error,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: colorScheme.error,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}