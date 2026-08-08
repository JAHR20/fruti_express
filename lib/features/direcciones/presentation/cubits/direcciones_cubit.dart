import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/actualizar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/crear_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/eliminar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/establecer_direccion_principal_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/obtener_direcciones_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';

class DireccionesCubit extends Cubit<DireccionesState> {
  final ObtenerDireccionesUseCase _obtenerDirecciones;
  final CrearDireccionUseCase _crearDireccion;
  final ActualizarDireccionUseCase _actualizarDireccion;
  final EliminarDireccionUseCase _eliminarDireccion;
  final EstablecerDireccionPrincipalUseCase _establecerPrincipal;

  DireccionesCubit({
    required ObtenerDireccionesUseCase obtenerDirecciones,
    required CrearDireccionUseCase crearDireccion,
    required ActualizarDireccionUseCase actualizarDireccion,
    required EliminarDireccionUseCase eliminarDireccion,
    required EstablecerDireccionPrincipalUseCase establecerPrincipal,
  })  : _obtenerDirecciones = obtenerDirecciones,
        _crearDireccion = crearDireccion,
        _actualizarDireccion = actualizarDireccion,
        _eliminarDireccion = eliminarDireccion,
        _establecerPrincipal = establecerPrincipal,
        super(const DireccionesState.initial());

  /// 📥 Obtiene todas las direcciones de un cliente
  Future<void> cargarDirecciones(String usuarioId) async {
    emit(const DireccionesState.loading());

    final result = await _obtenerDirecciones(usuarioId).run();

    result.fold(
      (falla) => emit(const DireccionesState.error('No pudimos cargar tus direcciones. Verifica tu conexión.')),
      (direcciones) => emit(DireccionesState.loaded(direcciones)),
    );
  }

  Future<void> crearDireccion(Direccion nuevaDireccion) async {
    final result = await _crearDireccion(nuevaDireccion).run();

    result.fold(
      (falla) {
        print('💀 ERROR REAL EN SUPABASE: $falla');
        emit(const DireccionesState.error('Hubo un error al guardar tu dirección.'));
        },
      (direccionCreada) {
        // Actualizamos la vista inmediatamente añadiendo la nueva dirección
        state.maybeMap(
          loaded: (currentState) {
            final nuevaLista = List<Direccion>.from(currentState.direcciones)..add(direccionCreada);
            emit(DireccionesState.loaded(nuevaLista));
          },
          // Si por alguna razón estaba vacío, recargamos desde cero
          orElse: () => cargarDirecciones(nuevaDireccion.usuarioId),
        );
      },
    );
  }

  /// ✏️ Actualiza una dirección existente en memoria
  Future<void> actualizarDireccion(Direccion direccion) async {
    final result = await _actualizarDireccion(direccion).run();

    result.fold(
      (falla) => emit(const DireccionesState.error('No pudimos actualizar la dirección.')),
      (direccionActualizada) {
        state.maybeMap(
          loaded: (currentState) {
            final nuevaLista = currentState.direcciones.map((d) {
              return d.id == direccionActualizada.id ? direccionActualizada : d;
            }).toList();
            emit(DireccionesState.loaded(nuevaLista));
          },
          orElse: () {},
        );
      },
    );
  }

  /// 🗑️ Elimina una dirección y la quita de la pantalla
  Future<void> eliminarDireccion(String id) async {
    final result = await _eliminarDireccion(id).run();

    result.fold(
      (falla) => emit(const DireccionesState.error('Error al intentar eliminar la dirección.')),
      (_) {
        state.maybeMap(
          loaded: (currentState) {
            final nuevaLista = currentState.direcciones.where((d) => d.id != id).toList();
            emit(DireccionesState.loaded(nuevaLista));
          },
          orElse: () {},
        );
      },
    );
  }

  /// ⭐ Marca una dirección como principal y desmarca las demás
  Future<void> establecerComoPrincipal(String usuarioId, String direccionId) async {
    final result = await _establecerPrincipal(
      usuarioId: usuarioId,
      direccionId: direccionId,
    ).run();

    result.fold(
      (falla) => emit(const DireccionesState.error('No pudimos establecer la dirección principal.')),
      (_) {
        state.maybeMap(
          loaded: (currentState) {
            // Mapeamos la lista para poner en 'true' la seleccionada y 'false' el resto
            final nuevaLista = currentState.direcciones.map((d) {
              return d.copyWith(esPrincipal: d.id == direccionId);
            }).toList();
            
            emit(DireccionesState.loaded(nuevaLista));
          },
          orElse: () {},
        );
      },
    );
  }
}