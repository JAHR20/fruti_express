import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/branch_picker_pickup_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_state.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_card.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';

class AddressSelectorBottomSheet extends StatelessWidget {
  const AddressSelectorBottomSheet({super.key});

  static void show(BuildContext context) {
    final coordinator = context.read<CustomerCoordinatorCubit>();
    final branchCubit = context.read<BranchCubit>();
    final shippingCubit = context.read<CustomerShippingCubit>();
    final addressCubit = context.read<AddressCubit>();
    final cartCubit = context.read<CartCubit>();
    final colorScheme = Theme.of(context).colorScheme;
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return Padding(
          padding: EdgeInsets.only(bottom: bottomSafeArea),
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: branchCubit),
              BlocProvider.value(value: shippingCubit),
              BlocProvider.value(value: addressCubit),
              BlocProvider.value(value: cartCubit),
              BlocProvider.value(value: coordinator),
            ],
            child: const AddressSelectorBottomSheet(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coordinator = context.read<CustomerCoordinatorCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    final maxHeight = MediaQuery.of(context).size.height * 0.85;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          final cartState = context.watch<CartCubit>().state;
          final selectedAddressId = cartState.selectedAddress?.id;
          final deliveryMethod = cartState.deliveryMethod;

          if (state.isLoading) {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              ),
            );
          }

          final isPickUp = deliveryMethod == DeliveryMethod.pickUp;

          return Column(
            mainAxisSize: MainAxisSize
                .min, // 👈 Esto hace que crezca solo según lo que tenga dentro
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior decorativa (indicador visual)
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 4),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Text(
                  'Modo de Entrega',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    BranchPickerPickupBottomSheet.show(context);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Card(
                    elevation: 0,
                    color: isPickUp
                        ? colorScheme.surfaceContainer
                        : colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isPickUp
                            ? colorScheme.secondaryContainer
                            : colorScheme.outlineVariant,
                        width: isPickUp ? 2 : 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: isPickUp
                                ? colorScheme.secondaryContainer
                                : colorScheme.surfaceContainerHighest,
                            child: Icon(
                              Icons.storefront,
                              color: isPickUp
                                  ? colorScheme.onSecondaryContainer
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pasar a recoger (Pick Up)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isPickUp
                                        ? colorScheme.onSurfaceVariant
                                        : colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ahorra el costo de envío',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isPickUp
                                        ? colorScheme.onSurface
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isPickUp)
                            Icon(
                              Icons.check_circle,
                              color: colorScheme.secondaryContainer,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Text(
                  'Mis Direcciones',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),

              // Lista flexible que se ajusta si hay pocos elementos, o hace scroll si son muchos
              Flexible(
                child: state.addresses.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(
                          child: Text(
                            'No tienes direcciones guardadas.',
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap:
                            true, // 👈 Permite que la lista se adapte si es pequeña
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.addresses.length,
                        itemBuilder: (context, index) {
                          final address = state.addresses[index];
                          return AddressCard(
                            address: address,
                            isSelected:
                                selectedAddressId == address.id && !isPickUp,
                            onTap: () {
                              Navigator.pop(context);
                              coordinator.changeAddressManually(address);
                            },
                          );
                        },
                      ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
