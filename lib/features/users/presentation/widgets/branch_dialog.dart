import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Asume que traduciste Sucursal a Branch. Ajusta el import si es necesario.
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart'; 
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class BranchDialog extends StatefulWidget { 
  final UserRole role;
  final BranchCubit branchCubit;
  final Profile currentUser;

  const BranchDialog({
    super.key,
    required this.role,
    required this.branchCubit,
    required this.currentUser,
  });

  @override
  State<BranchDialog> createState() => _BranchDialogState();
}

class _BranchDialogState extends State<BranchDialog> {
  String? selectedBranchId; 

  @override
  void initState() {
    super.initState();
    widget.branchCubit.loadBranches(); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.branchCubit,
      child: AlertDialog(
        title: Text(
          'Asignar ${widget.role == UserRole.manager ? 'Encargado' : 'Repartidor'}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: BlocBuilder<BranchCubit, BranchState>(
          builder: (context, state) {
            if (state.isLoading && state.branches.isEmpty) { 
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.errorMessage != null && state.branches.isEmpty) {
              return Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              );
            }
            
            final availableBranches = _filterAllowedBranches(state.branches);

            if (availableBranches.isEmpty) {
              return const Text('No hay sucursales disponibles para asignar.');
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecciona a qué sucursal pertenecerá este usuario:',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sucursal',
                    prefixIcon: Icon(Icons.storefront),
                  ),
                  initialValue: selectedBranchId,
                  items: availableBranches.map((branch) {
                    return DropdownMenuItem<String>(
                      value: branch.id,
                      child: Text(branch.name),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() => selectedBranchId = newValue);
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          BlocBuilder<BranchCubit, BranchState>(
            builder: (context, state) {
              final bool isBlocked =
                  state.branches.isEmpty || selectedBranchId == null;

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                ),
                onPressed: isBlocked
                    ? null
                    : () => Navigator.of(context).pop(selectedBranchId),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<Branch> _filterAllowedBranches(List<Branch> branches) {
    if (widget.role == UserRole.deliveryPerson) {
      return branches
          .where(
            (b) => widget.currentUser.canAssignDeliveryPersonToBranch(b.id), 
          )
          .toList();
    }
    return branches;
  }
}