import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';

class DireccionCard extends StatelessWidget {
  final Direccion direccion;
  final bool estaSeleccionada;
  final VoidCallback? onTap;

  const DireccionCard({
    super.key,
    required this.direccion,
    required this.estaSeleccionada,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sucursalState = context.watch<SucursalCubit>().state;
    final envioState = context.watch<EnvioClienteCubit>().state;
    final sucursales = sucursalState.sucursales;
    final configuraciones = envioState.configuraciones;

    bool tieneCobertura = false;
    String motivoSinCobertura = '';
    if (sucursales.isNotEmpty && configuraciones.isNotEmpty) {
      double distanciaMinimaEncontrada = double.infinity;
      double radioDeLaSucursalMasCercana = 0.0;
      bool fueRechazadoPorCP = false;

      for (var sucursal in sucursales) {
        final configIndex = configuraciones.indexWhere(
          (c) => c.sucursalId == sucursal.id,
        );
        if (configIndex == -1) {
          continue;
        }

        final configSucursal = configuraciones[configIndex];
        if (configSucursal.requerirValidacionCP &&
            !configSucursal.codigosPostalesPermitidos.contains(
              direccion.codigoPostal,
            )) {
          fueRechazadoPorCP = true;
          continue;
        }

        if (sucursal.latitud != null && sucursal.longitud != null) {
          final distanciaKm = GetIt.I<UbicacionService>().calcularDistancia(
            lat1: sucursal.latitud!,
            lon1: sucursal.longitud!,
            lat2: direccion.latitud,
            lon2: direccion.longitud,
          );

          if (distanciaKm < distanciaMinimaEncontrada) {
            distanciaMinimaEncontrada = distanciaKm;
            radioDeLaSucursalMasCercana = configSucursal.radioMaximoKm;
          }

          if (distanciaKm <= configSucursal.radioMaximoKm) {
            tieneCobertura = true;
            motivoSinCobertura = '';
            break;
          }
        }
      }

      if (!tieneCobertura) {
        if (distanciaMinimaEncontrada != double.infinity) {
          motivoSinCobertura =
              'A ${distanciaMinimaEncontrada.toStringAsFixed(1)} km (Máx: $radioDeLaSucursalMasCercana km)';
        } else if (fueRechazadoPorCP) {
          motivoSinCobertura = 'C.P. fuera de área';
        } else {
          motivoSinCobertura = 'Sin cobertura';
        }
      }
    } else {
      tieneCobertura = false;
      motivoSinCobertura = 'Calculando zona...';
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Opacity(
        opacity: tieneCobertura ? 1.0 : 0.55,
        child: Card(
          elevation: estaSeleccionada ? 4 : (tieneCobertura ? 2 : 0),
          color: estaSeleccionada ? const Color(0xFFEFF6FF) : Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: !tieneCobertura
                  ? Colors.red.shade300
                  : (estaSeleccionada
                        ? const Color(0xFF1E3A8A)
                        : Colors.transparent),
              width: estaSeleccionada ? 2.0 : 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          direccion.alias.toLowerCase().contains('casa')
                              ? Icons.home
                              : Icons.location_on,
                          color: tieneCobertura
                              ? const Color(0xFF1E3A8A)
                              : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          direccion.alias,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    if (!tieneCobertura)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.block,
                              size: 14,
                              color: Colors.red.shade700,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              motivoSinCobertura,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const Divider(height: 24),
                Text(
                  '${direccion.calle} #${direccion.numExt}'
                  '${direccion.numInt != null ? ' Int. ${direccion.numInt}' : ''}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Col. ${direccion.colonia}, C.P. ${direccion.codigoPostal}',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Text(
                  '${direccion.municipio}, ${direccion.estado}',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                if (direccion.referencias != null &&
                    direccion.referencias!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Ref: ${direccion.referencias}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
