import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

import 'envio_cliente_state.dart';

class EnvioClienteCubit extends Cubit<EnvioClienteState> {
  final ObtenerConfiguracionEnvioUseCase _obtenerConfiguracion;

  EnvioClienteCubit({
    required ObtenerConfiguracionEnvioUseCase obtenerConfiguracion,
  })  : _obtenerConfiguracion = obtenerConfiguracion,
        super(const EnvioClienteState());

  /// Descarga las configuraciones de todas las sucursales activas
  Future<void> cargarConfiguracionesDeSucursales(List<Sucursal> sucursales) async {
    if (sucursales.isEmpty) return;

    emit(state.copyWith(isLoading: true, error: null));

    List<ConfiguracionEnvio> configuracionesDescargadas = [];

    // Iteramos sobre cada sucursal para traer su propia regla de envíos
    for (var sucursal in sucursales) {
      final result = await _obtenerConfiguracion(sucursal.id).run();

      result.fold(
        (failure) {
          // Si una falla, no detenemos el proceso, solo imprimimos el error
          print('⚠️ Error al cargar config de la sucursal ${sucursal.id}: ${failure.errorMessage}');
        },
        (config) {
          if (config != null) {
            configuracionesDescargadas.add(config);
          }
        },
      );
    }

    // 🌟 Guardamos todas las configuraciones exitosas en el estado
    emit(state.copyWith(
      isLoading: false,
      configuraciones: configuracionesDescargadas,
    ));
  }
}