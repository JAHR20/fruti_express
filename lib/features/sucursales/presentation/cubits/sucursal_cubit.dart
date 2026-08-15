import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_sucursales_con_envio_configurado.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/cambiar_estado_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_sucursales.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'sucursal_state.dart';

class SucursalCubit extends Cubit<SucursalState> {
  final ObtenerSucursales _obtenerSucursalesUseCase;
  final CambiarEstadoSucursal _cambiarEstadoSucursalUseCase;
  final ObtenerSucursalesConEnvioConfiguradoUseCase
  _obtenerSucursalesConEnvioUseCase;

  SucursalCubit({
    required ObtenerSucursales obtenerSucursalesUseCase,
    required CambiarEstadoSucursal cambiarEstadoSucursalUseCase,
    required ObtenerSucursalesConEnvioConfiguradoUseCase
    obtenerSucursalesConEnvioConfiguradoUseCase,
  }) : _cambiarEstadoSucursalUseCase = cambiarEstadoSucursalUseCase,
       _obtenerSucursalesUseCase = obtenerSucursalesUseCase,
       _obtenerSucursalesConEnvioUseCase =
           obtenerSucursalesConEnvioConfiguradoUseCase,
       super(const SucursalState());

  Future<void> cargarSucursales() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final futureSucursales = _obtenerSucursalesUseCase.ejecutar().run();
    final futureEnvios = _obtenerSucursalesConEnvioUseCase().run();
    final resultadoSucursales = await futureSucursales;
    final resultadoEnvios = await futureEnvios;

    if (resultadoSucursales.isLeft()) {
      final mensaje = resultadoSucursales.match(
        (failure) => failure.errorMessage,
        (_) => '',
      );
      emit(state.copyWith(isLoading: false, errorMessage: mensaje));
      return;
    }

    final lista = resultadoSucursales.getRight().toNullable() ?? [];

    final sucursalesConEnvio =
        resultadoEnvios.getRight().toNullable() ?? <String>{};

    emit(
      state.copyWith(
        sucursales: lista,
        sucursalesConEnvioConfigurado: sucursalesConEnvio,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }

  Future<void> cambiarEstadoSucursal({
    required Perfil usuarioActual,
    required String sucursalId,
    required bool nuevoEstado,
  }) async {
    emit(state.copyWith(sucursalProcesandoId: sucursalId, errorMessage: null));

    final resultado = await _cambiarEstadoSucursalUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          sucursalId: sucursalId,
          nuevoEstado: nuevoEstado,
        )
        .run();

    resultado.fold(
      (failure) {
        emit(
          state.copyWith(
            sucursalProcesandoId: null,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (sucursalActualizada) {
        final nuevasSucursales = state.sucursales.map((sucursal) {
          if (sucursal.id == sucursalActualizada.id) {
            return sucursalActualizada;
          }

          return sucursal;
        }).toList();

        emit(
          state.copyWith(
            sucursales: nuevasSucursales,
            sucursalProcesandoId: null,
            errorMessage: null,
          ),
        );
      },
    );
  }
}
