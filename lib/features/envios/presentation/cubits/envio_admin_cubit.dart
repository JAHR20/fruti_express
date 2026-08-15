import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_tarifas_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/guardar_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/guardar_tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/eliminar_tarifa_envio.dart';

import 'envio_admin_state.dart';

class EnvioAdminCubit extends Cubit<EnvioAdminState> {
  final ObtenerConfiguracionEnvioUseCase _obtenerConfiguracion;
  final ObtenerTarifasEnvioUseCase _obtenerTarifas;
  final GuardarConfiguracionEnvioUseCase _guardarConfiguracion;
  final GuardarTarifaEnvioUseCase _guardarTarifa;
  final EliminarTarifaEnvioUseCase _eliminarTarifa;

  EnvioAdminCubit({
    required ObtenerConfiguracionEnvioUseCase obtenerConfiguracion,
    required ObtenerTarifasEnvioUseCase obtenerTarifas,
    required GuardarConfiguracionEnvioUseCase guardarConfiguracion,
    required GuardarTarifaEnvioUseCase guardarTarifa,
    required EliminarTarifaEnvioUseCase eliminarTarifa,
  }) : _obtenerConfiguracion = obtenerConfiguracion,
       _obtenerTarifas = obtenerTarifas,
       _guardarConfiguracion = guardarConfiguracion,
       _guardarTarifa = guardarTarifa,
       _eliminarTarifa = eliminarTarifa,
       super(const EnvioAdminState());

  Future<void> cargarDatos(String sucursalId) async {
    emit(state.copyWith(isLoading: true, error: null, mensajeExito: null));

    final configResult = await _obtenerConfiguracion(sucursalId).run();
    final tarifasResult = await _obtenerTarifas(sucursalId).run();

    if (configResult.isLeft()) {
      final mensajeError = configResult.match(
        (failure) => failure.errorMessage,
        (_) => '',
      );
      emit(
        state.copyWith(isLoading: false, error: 'Error Config: $mensajeError'),
      );
      return;
    }

    if (tarifasResult.isLeft()) {
      final mensajeError = tarifasResult.match(
        (failure) => failure.errorMessage,
        (_) => '',
      );
      emit(
        state.copyWith(isLoading: false, error: 'Error Tarifas: $mensajeError'),
      );
      return;
    }

    final configuracion = configResult.getRight().toNullable();

    final tarifas = tarifasResult.getRight().toNullable() ?? [];

    emit(
      state.copyWith(
        isLoading: false,
        configuracion: configuracion,
        tarifas: tarifas,
        radioTemporalKm: configuracion?.radioMaximoKm ?? 10.0,
        requiereCPTemporal: configuracion?.requerirValidacionCP ?? false,
        montoGratisTemporal: configuracion?.montoMinimoEnvioGratis,
      ),
    );
  }

  Future<void> guardarConfiguracion({
    required Perfil usuarioActual,
    required ConfiguracionEnvio configuracion,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, mensajeExito: null));

    final result = await _guardarConfiguracion(
      usuarioActual: usuarioActual,
      configuracion: configuracion,
    ).run();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.errorMessage)),
      (_) => emit(
        state.copyWith(
          isLoading: false,
          configuracion: configuracion,
          mensajeExito: 'Configuración guardada correctamente.',
        ),
      ),
    );
  }

  Future<void> guardarTarifa({
    required Perfil usuarioActual,
    required TarifaEnvio tarifa,
  }) async {
    emit(
      state.copyWith(
        tarifaProcesandoId: tarifa.id,
        error: null,
        mensajeExito: null,
      ),
    );

    final result = await _guardarTarifa(
      usuarioActual: usuarioActual,
      tarifa: tarifa,
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(tarifaProcesandoId: null, error: failure.errorMessage),
      ),
      (_) {
        final index = state.tarifas.indexWhere((t) => t.id == tarifa.id);
        final nuevasTarifas = List<TarifaEnvio>.from(state.tarifas);

        if (index >= 0) {
          nuevasTarifas[index] = tarifa;
        } else {
          nuevasTarifas.add(tarifa);
        }

        nuevasTarifas.sort(
          (a, b) => a.distanciaMinKm.compareTo(b.distanciaMinKm),
        );

        emit(
          state.copyWith(
            tarifaProcesandoId: null,
            tarifas: nuevasTarifas,
            mensajeExito: 'Tarifa guardada correctamente.',
          ),
        );
      },
    );
  }

  Future<void> eliminarTarifa({
    required Perfil usuarioActual,
    required String tarifaId,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, mensajeExito: null));

    final result = await _eliminarTarifa(
      usuarioActual: usuarioActual,
      tarifaId: tarifaId,
    ).run();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.errorMessage)),
      (_) {
        final nuevasTarifas = state.tarifas
            .where((t) => t.id != tarifaId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            tarifas: nuevasTarifas,
            mensajeExito: 'Tarifa eliminada correctamente.',
          ),
        );
      },
    );
  }

  void cambiarRadio(double nuevoRadio) {
    emit(state.copyWith(radioTemporalKm: nuevoRadio));
  }

  void alternarValidacionCP(bool valor) {
    emit(state.copyWith(requiereCPTemporal: valor));
  }

  void cambiarMontoGratis(double? monto) {
    emit(state.copyWith(montoGratisTemporal: monto));
  }

  void inicializarConEnvioExistente(ConfiguracionEnvio? configuracion) {
    if (configuracion == null) return;
    emit(
      state.copyWith(
        configuracion: configuracion,
        requiereCPTemporal: configuracion.requerirValidacionCP,
        radioTemporalKm: configuracion.radioMaximoKm,
        montoGratisTemporal: configuracion.montoMinimoEnvioGratis,
      ),
    );
  }
}
