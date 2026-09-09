import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/widgets/rate_form_bottom_sheet.dart';

class ShippingRatesScreen extends StatefulWidget { 
  final String branchId; 

  const ShippingRatesScreen({super.key, required this.branchId});

  @override
  State<ShippingRatesScreen> createState() => _ShippingRatesScreenState();
}

class _ShippingRatesScreenState extends State<ShippingRatesScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ShippingAdminCubit>().loadData(widget.branchId);
  }

  void _openRateForm([dynamic rateToEdit]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<ShippingAdminCubit>(),
        child: RateFormBottomSheet(
          branchId: widget.branchId,
          rateToEdit: rateToEdit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarifas de Envío'),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Añadir Tarifa'),
        onPressed: () => _openRateForm(),
      ),
      body: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
        listenWhen: (prev, curr) =>
            prev.successMessage != curr.successMessage || prev.error != curr.error,
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!), backgroundColor: Colors.red),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successMessage!), backgroundColor: Colors.green),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.rates.isEmpty) { 
            return const Center(child: CircularProgressIndicator(color: Color(0xFF1E3A8A)));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tarifas configuradas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),

                if (state.rates.isEmpty) 
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(
                      child: Text('No has configurado costos de envío. Usa el botón flotante para añadir tarifas.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.rates.length,
                    itemBuilder: (context, index) {
                      final rate = state.rates[index]; 
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          onTap: () => _openRateForm(rate), 
                          leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.attach_money, color: Colors.white)),
                          title: Text(rate.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('De ${rate.minDistanceKm} a ${rate.maxDistanceKm} km • \$${(rate.cost / 100).toStringAsFixed(2)}'),
                          
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min, 
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                                tooltip: 'Editar tarifa',
                                onPressed: () => _openRateForm(rate),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                tooltip: 'Eliminar tarifa',
                                onPressed: () {
                                  final authState = context.read<AuthCubit>().state;
                                  if (authState is AuthAuthenticated) {
                                    context.read<ShippingAdminCubit>().deleteRate(currentUser: authState.profile, rateId: rate.id);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}