import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/cambiar_estado_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_sucursales.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'sucursal_state.dart';

class SucursalCubit extends Cubit<SucursalState> {
  final ObtenerSucursales _obtenerSucursalesUseCase;
  final CambiarEstadoSucursal _cambiarEstadoSucursalUseCase;

  SucursalCubit({
    required ObtenerSucursales obtenerSucursalesUseCase,
    required CambiarEstadoSucursal cambiarEstadoSucursalUseCase,
  })  : _cambiarEstadoSucursalUseCase = cambiarEstadoSucursalUseCase,
        _obtenerSucursalesUseCase = obtenerSucursalesUseCase,
        super(const SucursalState.initial()); // ← corregido

  Future<void> cargarSucursales() async {
    emit(const SucursalState.loading());
    final resultado = await _obtenerSucursalesUseCase.ejecutar().run();
    resultado.fold(
      (failure) => emit(SucursalState.error(failure.errorMessage)),
      (lista) => emit(SucursalState.loaded(lista)),
    );
  }

  Future<void> cambiarEstadoSucursal({
    required Perfil usuarioActual,
    required String sucursalId,
    required bool nuevoEstado,
  }) async {
    emit(const SucursalState.loading());
    final resultado = await _cambiarEstadoSucursalUseCase.ejecutar(
      usuarioActual: usuarioActual,
      sucursalId: sucursalId,
      nuevoEstado: nuevoEstado,
    ).run();
    resultado.fold(
      (failure) {
        debugPrint("🚨 Error al cambiar estado: ${failure.errorMessage}");
        emit(SucursalState.error(failure.errorMessage));
      },
      (_) => cargarSucursales(),
    );
  }
}