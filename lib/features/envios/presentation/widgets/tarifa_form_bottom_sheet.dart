import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_state.dart';

class TarifaFormBottomSheet extends StatefulWidget {
  final String sucursalId;
  final TarifaEnvio? tarifaAEditar;

  const TarifaFormBottomSheet({
    super.key,
    required this.sucursalId,
    this.tarifaAEditar,
  });

  @override
  State<TarifaFormBottomSheet> createState() => _TarifaFormBottomSheetState();
}

class _TarifaFormBottomSheetState extends State<TarifaFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _minKmCtrl;
  late TextEditingController _maxKmCtrl;
  late TextEditingController _costoCtrl;

  @override
  void initState() {
    super.initState();
    _minKmCtrl = TextEditingController(
      text: widget.tarifaAEditar?.distanciaMinKm.toString() ?? '',
    );
    _maxKmCtrl = TextEditingController(
      text: widget.tarifaAEditar?.distanciaMaxKm.toString() ?? '',
    );
    _costoCtrl = TextEditingController(
      text: widget.tarifaAEditar?.costo.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _minKmCtrl.dispose();
    _maxKmCtrl.dispose();
    _costoCtrl.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final authState = context.read<AuthCubit>().state;
      if (authState is! AuthAuthenticated) return;

      final minKm = double.parse(_minKmCtrl.text);
      final maxKm = double.parse(_maxKmCtrl.text);

      final costo = double.parse(_costoCtrl.text).round();

      if (minKm >= maxKm) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El kilómetro mínimo debe ser menor al máximo'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final nombreGenerado = 'Tarifa de $minKm a $maxKm km';

      final nuevaTarifa = TarifaEnvio(
        id: widget.tarifaAEditar?.id ?? '',
        sucursalId: widget.sucursalId,
        nombre: widget.tarifaAEditar?.nombre ?? nombreGenerado,
        distanciaMinKm: minKm,
        distanciaMaxKm: maxKm,
        costo: costo,
        activa: widget.tarifaAEditar?.activa ?? true,
        fechaCreacion: widget.tarifaAEditar?.fechaCreacion ?? DateTime.now(),
      );

      context.read<EnvioAdminCubit>().guardarTarifa(
        usuarioActual: authState.perfil,
        tarifa: nuevaTarifa,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final esEdicion = widget.tarifaAEditar != null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: BlocConsumer<EnvioAdminCubit, EnvioAdminState>(
        listenWhen: (prev, curr) =>
            prev.mensajeExito != curr.mensajeExito || prev.error != curr.error,
        listener: (context, state) {
          if (state.mensajeExito != null &&
              state.mensajeExito!.contains('Tarifa')) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      esEdicion ? 'Editar Tarifa' : 'Nueva Tarifa',
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _minKmCtrl,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'De (km)',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val == null || val.isEmpty ? 'Requerido' : null,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('-', style: TextStyle(fontSize: 20)),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _maxKmCtrl,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Hasta (km)',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val == null || val.isEmpty ? 'Requerido' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _costoCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Costo del envío (\$)',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: state.isLoading ? null : _guardar,
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            esEdicion ? 'Guardar Cambios' : 'Agregar Tarifa',
                            style: const TextStyle(fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
