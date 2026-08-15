import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_state.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/estrategia_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'cobertura_switch_widget.dart';
import 'selector_chips_cp_widget.dart';
import 'mapa_radio_cobertura_widget.dart';
import 'cobertura_slider_widget.dart';

class PasoCoberturaWidget extends StatelessWidget {
  final Sucursal? sucursalOriginal;

  const PasoCoberturaWidget({super.key, this.sucursalOriginal});

  @override
  Widget build(BuildContext context) {
    final mapUrl = GetIt.I<UbicacionService>().urlProveedorMapas;

    return BlocListener<WizardSucursalCubit, WizardSucursalState>(
      listenWhen: (previous, current) =>
          previous.configuracionEnvio != current.configuracionEnvio &&
          current.configuracionEnvio != null,
      listener: (context, formState) {
        context.read<EnvioAdminCubit>().inicializarConEnvioExistente(
          formState.configuracionEnvio,
        );
      },
      child: BlocConsumer<EnvioAdminCubit, EnvioAdminState>(
        listener: (context, state) {
          if (state.mensajeExito != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mensajeExito!),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<WizardSucursalCubit, WizardSucursalState>(
            builder: (context, formState) {
              final sucursalId =
                  formState.sucursalIdCreada ?? sucursalOriginal?.id;

              if (sucursalId == null) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Error: No se encontró la sucursal generada en el Paso 1.',
                  ),
                );
              }

              final centroSucursal = LatLng(
                formState.latitud ?? sucursalOriginal?.latitud ?? 0.0,
                formState.longitud ?? sucursalOriginal?.longitud ?? 0.0,
              );

              if (state.isLoading || formState.buscandoUbicacion) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Configuración Híbrida de Cobertura',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  CoberturaSwitchWidget(
                    requiereCp: state.requiereCPTemporal,
                    cantidadSeleccionados:
                        formState.codigosSeleccionados.length,
                    onChanged: (valor) {
                      context.read<EnvioAdminCubit>().alternarValidacionCP(
                        valor,
                      );
                    },
                  ),

                  if (state.requiereCPTemporal)
                    SelectorChipsCpWidget(
                      codigosDisponibles: formState.codigosDisponibles,
                      codigosSeleccionados: formState.codigosSeleccionados,
                      onToggle: (cp, seleccionado) {
                        context
                            .read<WizardSucursalCubit>()
                            .alternarCodigoPostal(cp, seleccionado);
                      },
                    ),
                  const SizedBox(height: 24),

                  const Text(
                    'Límite de Distancia (Radio)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  MapaRadioCoberturaWidget(
                    centro: centroSucursal,
                    radioKm: state.radioTemporalKm,
                    mapUrl: mapUrl,
                  ),
                  const SizedBox(height: 16),

                  CoberturaSliderWidget(
                    radioActualKm: state.radioTemporalKm,
                    onChanged: (valor) {
                      context.read<EnvioAdminCubit>().cambiarRadio(valor);
                    },
                  ),
                  const Divider(height: 32),

                  const Text(
                    'Promoción de Envío',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: state.montoGratisTemporal?.toString() ?? '',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Monto mínimo para envío gratis',
                      hintText: 'Ej. 300.00',
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) => context
                        .read<EnvioAdminCubit>()
                        .cambiarMontoGratis(double.tryParse(valor)),
                  ),
                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        final authState = context.read<AuthCubit>().state;
                        if (authState is! AuthAuthenticated) return;

                        final configuracion = ConfiguracionEnvio(
                          id: state.configuracion?.id ?? '',
                          sucursalId: sucursalId,
                          estrategia:
                              state.configuracion?.estrategia ??
                              EstrategiaEnvio.hibrida,
                          radioMaximoKm: state.radioTemporalKm,
                          requerirValidacionCP: state.requiereCPTemporal,
                          montoMinimoEnvioGratis: state.montoGratisTemporal,
                          codigosPostalesPermitidos:
                              formState.codigosSeleccionados,
                          activa: true,
                          fechaCreacion:
                              state.configuracion?.fechaCreacion ??
                              DateTime.now(),
                        );

                        context.read<EnvioAdminCubit>().guardarConfiguracion(
                          usuarioActual: authState.perfil,
                          configuracion: configuracion,
                        );
                      },
                      child: const Text(
                        'Guardar Configuración',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
