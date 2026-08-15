
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

import 'envio_cliente_state.dart';

class EnvioClienteCubit extends Cubit<EnvioClienteState> {
  final ObtenerConfiguracionEnvioUseCase _obtenerConfiguracion;

  EnvioClienteCubit({
    required ObtenerConfiguracionEnvioUseCase obtenerConfiguracion,
  }) : _obtenerConfiguracion = obtenerConfiguracion,
       super(const EnvioClienteState());

  Future<void> cargarConfiguracionesDeSucursales(
    List<Sucursal> sucursales,
  ) async {
    if (sucursales.isEmpty) return;

    emit(state.copyWith(isLoading: true, error: null));

    final List<ConfiguracionEnvio> configuracionesDescargadas = [];
    String? ultimoError;

    for (var sucursal in sucursales) {

      final result = await _obtenerConfiguracion(sucursal.id).run();

      result.fold(
        (failure) {
          ultimoError = failure.errorMessage;
        },
        (config) {
          if (config != null) {
            configuracionesDescargadas.add(config);
          }
        },
      );
    }
    emit(
      state.copyWith(
        isLoading: false,
        configuraciones: configuracionesDescargadas,
        error: ultimoError,
      ),
    );
  }
}
