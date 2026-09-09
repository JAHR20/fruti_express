import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/drivers_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/drivers_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/manager_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class AssignDriverSheet extends StatefulWidget {
  final String orderId;

  const AssignDriverSheet({super.key, required this.orderId});

  @override
  State<AssignDriverSheet> createState() => _AssignDriverSheetState();
}

class _AssignDriverSheetState extends State<AssignDriverSheet> {
  String? _selectedDriverId;

  @override
  void initState() {
    super.initState();

    final profile = context.read<AuthCubit>().state.maybeWhen(
      authenticated: (p) => p,
      orElse: () => null,
    );

    if (profile != null) {
      context.read<DriversCubit>().load(requester: profile);
    }
  }

  void _confirm() {
    if (_selectedDriverId == null) return;

    Navigator.of(context).pop();

    context.read<ManagerOrdersCubit>().assignDriverAndPrepare(
      orderId: widget.orderId,
      driverId: _selectedDriverId!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Asignar Repartidor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Selecciona quién llevará este pedido',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),
          BlocBuilder<DriversCubit, DriversState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (msg) => Center(
                  child: Text(msg, style: const TextStyle(color: Colors.red)),
                ),
                loaded: (drivers) {
                  if (drivers.isEmpty) {
                    return const Center(
                      child: Text('No hay repartidores disponibles'),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: drivers.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) => _DriverTile(
                      driver: drivers[i],
                      isSelected: drivers[i].id == _selectedDriverId,
                      onTap: () => setState(
                        () => _selectedDriverId = drivers[i].id,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: _selectedDriverId != null ? _confirm : null,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Asignar y Preparar',
                  style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverTile extends StatelessWidget {
  final Profile driver; 
  final bool isSelected;
  final VoidCallback onTap;

  const _DriverTile({
    required this.driver,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF1E3A8A).withValues(alpha: 0.1),
        backgroundImage: driver.avatarUrl != null
            ? NetworkImage(driver.avatarUrl!)
            : null,
        child: driver.avatarUrl == null
            ? Text(
                driver.firstName[0].toUpperCase(),
                style: const TextStyle(
                    color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold),
              )
            : null,
      ),
      title: Text(
        '${driver.paternalLastName} ${driver.maternalLastName}',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: driver.phone != null
          ? Text(driver.phone!, style: const TextStyle(fontSize: 12))
          : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.purple)
          : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
    );
  }
}