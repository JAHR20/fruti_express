import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';

class BranchPickerPickupBottomSheet extends StatelessWidget {
  const BranchPickerPickupBottomSheet({super.key});

  static void show(BuildContext context) {
    final branchCubit = context.read<BranchCubit>();
    final coordinator = context.read<CustomerCoordinatorCubit>();
    final cartCubit = context.read<CartCubit>();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: branchCubit),
            BlocProvider.value(value: coordinator),
            BlocProvider.value(value: cartCubit),
          ],
          child: const BranchPickerPickupBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;
    final coordinator = context.read<CustomerCoordinatorCubit>();
    final selectedBranchId = cartState.branchId;

    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        final activeBranches = state.branches.where((b) => b.active).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '¿En qué sucursal recogerás?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            if (activeBranches.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('No hay sucursales disponibles por el momento.'),
              )
            else
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeBranches.length,
                  itemBuilder: (context, index) {
                    final branch = activeBranches[index];
                    final isSelected =
                        branch.id == selectedBranchId &&
                        cartState.deliveryMethod == DeliveryMethod.pickUp;

                    return ListTile(
                      leading: Icon(
                        Icons.store,
                        color: isSelected
                            ? const Color(0xFF1E3A8A)
                            : Colors.grey,
                      ),
                      title: Text(
                        branch.name,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        '${branch.street} #${branch.exteriorNumber}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFF1E3A8A),
                            )
                          : const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pop(context);
                        coordinator.confirmPickup(branch);
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
