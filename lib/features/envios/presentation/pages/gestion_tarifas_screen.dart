import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/estrategia_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/widgets/tarifa_form_bottom_sheet.dart';

class GestionTarifasScreen extends StatefulWidget {
  final String sucursalId;

  const GestionTarifasScreen({super.key, required this.sucursalId});

  @override
  State<GestionTarifasScreen> createState() => _GestionTarifasScreenState();
}

class _GestionTarifasScreenState extends State<GestionTarifasScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _radioCtrl;

  @override
  void initState() {
    super.initState();
    _radioCtrl = TextEditingController();
    context.read<EnvioAdminCubit>().cargarDatos(widget.sucursalId);
  }

  @override
  void dispose() {
    _radioCtrl.dispose();
    super.dispose();
  }

  void _inicializarControladores(ConfiguracionEnvio? config) {
    if (config != null) {
      _radioCtrl.text = config.radioMaximoKm.toString();
    } else {
      _radioCtrl.text = '10.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envíos y Tarifas'),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<EnvioAdminCubit, EnvioAdminState>(
        listenWhen: (prev, curr) =>
            prev.mensajeExito != curr.mensajeExito || prev.error != curr.error,
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.mensajeExito != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mensajeExito!),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.configuracion == null) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          // Pre-llenamos el campo si los datos ya llegaron
          if (state.configuracion != null && _radioCtrl.text.isEmpty) {
            _inicializarControladores(state.configuracion);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Radio de Cobertura',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Define hasta cuántos kilómetros a la redonda entregarás pedidos.',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _radioCtrl,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                decoration: const InputDecoration(
                                  labelText: 'Kilómetros (Ej. 5.5)',
                                  prefixIcon: Icon(Icons.radar),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (val) => val == null || val.isEmpty
                                    ? 'Requerido'
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E3A8A),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final authState = context
                                      .read<AuthCubit>()
                                      .state;
                                  if (authState is! AuthAuthenticated) return;

                                  final configActual =
                                      state.configuracion ??
                                      ConfiguracionEnvio(
                                        id: '',
                                        sucursalId: widget.sucursalId,
                                        estrategia: EstrategiaEnvio.haversine,
                                        radioMaximoKm: 10.0,
                                        activa: true,
                                        fechaCreacion: DateTime.now(),
                                      );

                                  final configActualizada = configActual
                                      .copyWith(
                                        radioMaximoKm: double.parse(
                                          _radioCtrl.text,
                                        ),
                                      );

                                  context
                                      .read<EnvioAdminCubit>()
                                      .guardarConfiguracion(
                                        usuarioActual: authState.perfil,
                                        configuracion: configActualizada,
                                      );
                                }
                              },
                              child: const Text('Actualizar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Costo de Envío',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => BlocProvider.value(
                            value: context.read<EnvioAdminCubit>(),
                            child: TarifaFormBottomSheet(
                              sucursalId: widget.sucursalId,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Añadir Tarifa'),
                    ),
                  ],
                ),
                const Divider(),

                if (state.tarifas.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(
                      child: Text(
                        'No has configurado costos de envío. Añade tarifas por kilómetro.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.tarifas.length,
                    itemBuilder: (context, index) {
                      final tarifa = state.tarifas[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (_) => BlocProvider.value(
                                value: context.read<EnvioAdminCubit>(),
                                child: TarifaFormBottomSheet(
                                  sucursalId: widget.sucursalId,
                                  tarifaAEditar: tarifa,
                                ),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'De ${tarifa.distanciaMinKm} km a ${tarifa.distanciaMaxKm} km',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Costo: \$${tarifa.costo.toStringAsFixed(2)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              final authState = context.read<AuthCubit>().state;
                              if (authState is AuthAuthenticated) {
                                context.read<EnvioAdminCubit>().eliminarTarifa(
                                  usuarioActual: authState.perfil,
                                  tarifaId: tarifa.id,
                                );
                              }
                            },
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
