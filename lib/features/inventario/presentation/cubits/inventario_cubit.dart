import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/obtener_inventario_por_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/aumentar_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/reducir_stock.dart';

import 'inventario_state.dart';

class InventarioCubit extends Cubit<InventarioState> {
  final ObtenerInventarioPorSucursal _obtenerInventarioPorSucursalUseCase;
  final AumentarStock _aumentarStockUseCase;
  final ReducirStock _reducirStockUseCase;

  InventarioCubit({
    required ObtenerInventarioPorSucursal obtenerInventarioPorSucursalUseCase,
    required AumentarStock aumentarStockUseCase,
    required ReducirStock reducirStockUseCase,
  }) : _obtenerInventarioPorSucursalUseCase =
           obtenerInventarioPorSucursalUseCase,
       _aumentarStockUseCase = aumentarStockUseCase,
       _reducirStockUseCase = reducirStockUseCase,
       super(const InventarioState());

  Future<void> cargarInventario(String sucursalId) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        operacionError: null,
        sucursalId: sucursalId,
      ),
    );

    final resultado = await _obtenerInventarioPorSucursalUseCase
        .ejecutar(sucursalId: sucursalId)
        .run();

    resultado.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (inventario) {
        emit(
          state.copyWith(
            isLoading: false,
            inventario: inventario,
            errorMessage: null,
            sucursalId: sucursalId,
          ),
        );
      },
    );
  }

  Future<void> ajustarStockManual({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
    required bool esAumento,
  }) async {
    emit(
      state.copyWith(
        productoProcesandoId: productoId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final resultado = esAumento
        ? await _aumentarStockUseCase
              .ejecutar(
                usuarioActual: usuarioActual,
                productoId: productoId,
                sucursalId: sucursalId,
                cantidad: cantidad,
              )
              .run()
        : await _reducirStockUseCase
              .ejecutar(
                usuarioActual: usuarioActual,
                productoId: productoId,
                sucursalId: sucursalId,
                cantidad: cantidad,
              )
              .run();

    await resultado.fold(
      (failure) async {
        emit(
          state.copyWith(
            productoProcesandoId: null,
            operacionError: failure.errorMessage,
            operacionExitosa: false,
          ),
        );
      },

      (_) async {
        emit(
          state.copyWith(
            productoProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );

        await cargarInventario(sucursalId);

        emit(state.copyWith(operacionExitosa: false));
      },
    );
  }

  void limpiarErrorOperacion() {
    emit(state.copyWith(operacionError: null));
  }

  void limpiarError() {
    emit(state.copyWith(errorMessage: null));
  }
}
