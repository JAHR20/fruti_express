import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; // carrito -> cart
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/branch_picker_pickup_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_state.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_card.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';

class AddressSelectorBottomSheet extends StatelessWidget { // SelectorDirectionsBottomSheet -> AddressSelectorBottomSheet
  const AddressSelectorBottomSheet({super.key});

  static void show(BuildContext context) {
    final coordinator = context.read<CustomerCoordinatorCubit>(); // CoordinadorClienteCubit -> CustomerCoordinatorCubit
    final branchCubit = context.read<BranchCubit>(); // cubitBranch -> branchCubit
    final shippingCubit = context.read<CustomerShippingCubit>(); // EnvioClienteCubit -> CustomerShippingCubit
    final addressCubit = context.read<AddressCubit>(); // DireccionesCubit -> AddressCubit
    final cartCubit = context.read<CartCubit>(); // CarritoCubit -> CartCubit

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: branchCubit),
            BlocProvider.value(value: shippingCubit),
            BlocProvider.value(value: addressCubit),
            BlocProvider.value(value: cartCubit),
            BlocProvider.value(value: coordinator),
          ],
          child: const AddressSelectorBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coordinator = context.read<CustomerCoordinatorCubit>();

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (_, controller) {
        return BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            final cartState = context.watch<CartCubit>().state;
            final selectedAddressId = cartState.selectedAddress?.id; // direccionSeleccionada -> selectedAddress
            final deliveryMethod = cartState.deliveryMethod; // modoEntrega -> deliveryMethod

            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFF1E3A8A)));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                  child: Text('Modo de Entrega', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),

                // ─── TARJETA DE PICK UP ───
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); // Cierra este modal
                      // 🌟 Abre el modal de sucursales
                      BranchPickerPickupBottomSheet.show(context); // SelectorBranchesPickupBottomSheet -> BranchPickerPickupBottomSheet
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Card(
                      elevation: deliveryMethod == DeliveryMethod.pickUp ? 4 : 0,
                      color: deliveryMethod == DeliveryMethod.pickUp ? Colors.orange.shade50 : Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: deliveryMethod == DeliveryMethod.pickUp ? Colors.orange : Colors.grey.shade300,
                          width: deliveryMethod == DeliveryMethod.pickUp ? 2 : 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: deliveryMethod == DeliveryMethod.pickUp ? Colors.orange.shade100 : Colors.grey.shade200,
                              child: Icon(Icons.storefront, color: deliveryMethod == DeliveryMethod.pickUp ? Colors.orange.shade800 : Colors.grey.shade600),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pasar a recoger (Pick Up)', 
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: deliveryMethod == DeliveryMethod.pickUp ? Colors.orange.shade900 : Colors.black87),
                                  ),
                                  const SizedBox(height: 4),
                                  Text('Ahorra el costo de envío', style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                            if (deliveryMethod == DeliveryMethod.pickUp)
                              const Icon(Icons.check_circle, color: Colors.orange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Text('Mis Direcciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),

                Expanded(
                  child: state.addresses.isEmpty // direcciones -> addresses
                      ? const Center(child: Text('No tienes direcciones guardadas.'))
                      : ListView.builder(
                          controller: controller,
                          itemCount: state.addresses.length,
                          itemBuilder: (context, index) {
                            final address = state.addresses[index]; // direccion -> address
                            return AddressCard( // DireccionCard -> AddressCard
                              address: address,
                              isSelected: selectedAddressId == address.id && deliveryMethod != DeliveryMethod.pickUp, // estaSeleccionada -> isSelected
                              onTap: () {
                                Navigator.pop(context);
                                coordinator.changeAddressManually(address); // cambiarDireccionManual -> changeManualAddress
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}