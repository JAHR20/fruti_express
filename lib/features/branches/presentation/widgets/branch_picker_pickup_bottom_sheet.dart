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
    final colorScheme = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: colorScheme.surface,
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
    final colorScheme = Theme.of(context).colorScheme;
    final cartState = context.watch<CartCubit>().state;
    final coordinator = context.read<CustomerCoordinatorCubit>();
    final selectedBranchId = cartState.branchId;

    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        final activeBranches = state.branches.where((b) => b.active).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '¿En qué sucursal recogerás?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
            ),
            if (activeBranches.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'No hay sucursales disponibles por el momento.',
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
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
                        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      ),
                      title: Text(
                        branch.name,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      subtitle: Text(
                        '${branch.street} #${branch.exteriorNumber}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: colorScheme.primary)
                          : Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme.onSurfaceVariant),
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