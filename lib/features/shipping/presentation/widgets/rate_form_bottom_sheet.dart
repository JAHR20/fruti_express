import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart'; 
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_state.dart';

class RateFormBottomSheet extends StatefulWidget { 
  final String branchId; 
  final ShippingRate? rateToEdit;

  const RateFormBottomSheet({
    super.key,
    required this.branchId,
    this.rateToEdit,
  });

  @override
  State<RateFormBottomSheet> createState() => _RateFormBottomSheetState();
}

class _RateFormBottomSheetState extends State<RateFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameCtrl;
  late TextEditingController _minKmCtrl;
  late TextEditingController _maxKmCtrl;
  late TextEditingController _costCtrl; 

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(
      text: widget.rateToEdit?.name ?? '',
    );
    _minKmCtrl = TextEditingController(
      text: widget.rateToEdit?.minDistanceKm.toString() ?? '',
    );
    _maxKmCtrl = TextEditingController(
      text: widget.rateToEdit?.maxDistanceKm.toString() ?? '',
    );
    
    _costCtrl = TextEditingController(
      text: widget.rateToEdit != null 
          ? (widget.rateToEdit!.cost / 100).toStringAsFixed(2) 
          : '',
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _minKmCtrl.dispose();
    _maxKmCtrl.dispose();
    _costCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final authState = context.read<AuthCubit>().state;
      if (authState is! AuthAuthenticated) return;

      final minKm = double.parse(_minKmCtrl.text);
      final maxKm = double.parse(_maxKmCtrl.text);

      final int costInCents = _costCtrl.text.toCents;

      if (minKm >= maxKm) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El kilómetro mínimo debe ser menor al máximo'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final newRate = ShippingRate( 
        id: widget.rateToEdit?.id ?? '',
        branchId: widget.branchId,
        name: _nameCtrl.text.trim(), 
        minDistanceKm: minKm,
        maxDistanceKm: maxKm,
        cost: costInCents,
        isActive: widget.rateToEdit?.isActive ?? true,
        createdAt: widget.rateToEdit?.createdAt ?? DateTime.now(),
      );

      context.read<ShippingAdminCubit>().saveRate(
        currentUser: authState.profile, 
        rate: newRate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.rateToEdit != null; 

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
        listenWhen: (prev, curr) =>
            prev.successMessage != curr.successMessage || prev.error != curr.error,
        listener: (context, state) {
          if (state.successMessage != null &&
              state.successMessage!.contains('Tarifa')) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0), 
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isEditing ? 'Editar Tarifa' : 'Nueva Tarifa',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _nameCtrl,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Nombre de la tarifa',
                        hintText: 'Ej. Envío Centro, Zona Norte, etc.',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.label_outline),
                      ),
                      validator: (val) =>
                          val == null || val.trim().isEmpty ? 'Ingresa un nombre para identificarla' : null,
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _minKmCtrl,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(labelText: 'De (km)', border: OutlineInputBorder()),
                            validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('-', style: TextStyle(fontSize: 20)),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _maxKmCtrl,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(labelText: 'Hasta (km)', border: OutlineInputBorder()),
                            validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _costCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Costo del envío (\$)',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 32),
                    
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: state.isLoading ? null : _save,
                        child: state.isLoading
                            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                            : Text(isEditing ? 'Guardar Cambios' : 'Agregar Tarifa', style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}