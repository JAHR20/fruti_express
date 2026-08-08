import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

// 🌟 Importamos los casos de uso que acabas de refactorizar
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
  }) : _reducirStockUseCase = reducirStockUseCase, _aumentarStockUseCase = aumentarStockUseCase, _obtenerInventarioPorSucursalUseCase = obtenerInventarioPorSucursalUseCase, super(InventarioInitial());

  // --- 🔍 CONSULTAR LA LISTA ---
  Future<void> cargarInventario(String sucursalId) async {
    emit(const InventarioState.loading());
    final resultado = await _obtenerInventarioPorSucursalUseCase.ejecutar(sucursalId: sucursalId).run();
    
    resultado.fold(
      (failure) => emit(InventarioState.error(failure.errorMessage)),
      (lista) => emit(InventarioState.loaded(lista)),
    );
  }

  Future<void> ajustarStockManual({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
    required bool esAumento,
  }) async {
    // 🌟 USAMOS EL PATTERN MATCHING DE FREEZED
    state.maybeWhen(
      loaded: (inventario, _) {
        // Emitimos el mismo estado pero cambiando SOLO el ID de carga
        emit(InventarioState.loaded(inventario, actualizandoProductoId: productoId));
      },
      orElse: () {},
    );

    final resultado = esAumento 
        ? await _aumentarStockUseCase.ejecutar(
            usuarioActual: usuarioActual,
            productoId: productoId,
            sucursalId: sucursalId,
            cantidad: cantidad,
          ).run()
        : await _reducirStockUseCase.ejecutar(
            usuarioActual: usuarioActual,
            productoId: productoId,
            sucursalId: sucursalId,
            cantidad: cantidad,
          ).run();

    resultado.fold(
      (failure) {
        emit(InventarioState.error(failure.errorMessage));
        cargarInventario(sucursalId);
      },
      (_) => cargarInventario(sucursalId),
    );
  }
}