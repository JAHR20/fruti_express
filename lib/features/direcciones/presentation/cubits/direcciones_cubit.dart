import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/actualizar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/crear_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/eliminar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/establecer_direccion_principal_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/obtener_direcciones_use_case.dart';

import 'direcciones_state.dart';

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
  }) : _obtenerDirecciones = obtenerDirecciones,
       _crearDireccion = crearDireccion,
       _actualizarDireccion = actualizarDireccion,
       _eliminarDireccion = eliminarDireccion,
       _establecerPrincipal = establecerPrincipal,
       super(const DireccionesState());


  Future<void> cargarDirecciones(String usuarioId) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        operacionError: null,
        usuarioId: usuarioId,
      ),
    );

    final result = await _obtenerDirecciones(usuarioId).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage:
                'No pudimos cargar las direcciones. Verifica tu conexión.',
          ),
        );
      },
      (direcciones) {
        emit(
          state.copyWith(
            isLoading: false,
            direcciones: direcciones,
            errorMessage: null,
            usuarioId: usuarioId,
          ),
        );
      },
    );
  }


  Future<void> crearDireccion(Direccion nuevaDireccion) async {
    emit(
      state.copyWith(
        operacionError: null,
        operacionExitosa: false,
        direccionProcesandoId: 'nueva',
      ),
    );

    final result = await _crearDireccion(nuevaDireccion).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            direccionProcesandoId: null,
            operacionError: 'Hubo un error al guardar la dirección.',
            operacionExitosa: false,
          ),
        );
      },
      (direccionCreada) {
        final nuevaLista = [...state.direcciones, direccionCreada];

        emit(
          state.copyWith(
            direcciones: nuevaLista,
            direccionProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  Future<void> actualizarDireccion(Direccion direccion) async {
    emit(
      state.copyWith(
        direccionProcesandoId: direccion.id,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _actualizarDireccion(direccion).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            direccionProcesandoId: null,
            operacionError: 'No pudimos actualizar la dirección.',
            operacionExitosa: false,
          ),
        );
      },
      (direccionActualizada) {
        final nuevaLista = state.direcciones.map((direccionActual) {
          return direccionActual.id == direccionActualizada.id
              ? direccionActualizada
              : direccionActual;
        }).toList();

        emit(
          state.copyWith(
            direcciones: nuevaLista,
            direccionProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  Future<void> eliminarDireccion(String id) async {
    emit(
      state.copyWith(
        direccionProcesandoId: id,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _eliminarDireccion(id).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            direccionProcesandoId: null,
            operacionError: 'Error al intentar eliminar la dirección.',
            operacionExitosa: false,
          ),
        );
      },
      (_) {
        final nuevaLista = state.direcciones
            .where((direccion) => direccion.id != id)
            .toList();

        emit(
          state.copyWith(
            direcciones: nuevaLista,
            direccionProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  Future<void> establecerComoPrincipal(
    String usuarioId,
    String direccionId,
  ) async {
    emit(
      state.copyWith(
        direccionPrincipalProcesandoId: direccionId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _establecerPrincipal(
      usuarioId: usuarioId,
      direccionId: direccionId,
    ).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            direccionPrincipalProcesandoId: null,
            operacionError: 'No pudimos establecer la dirección principal.',
            operacionExitosa: false,
          ),
        );
      },
      (_) {
        final nuevaLista = state.direcciones.map((direccion) {
          return direccion.copyWith(esPrincipal: direccion.id == direccionId);
        }).toList();

        emit(
          state.copyWith(
            direcciones: nuevaLista,
            direccionPrincipalProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  void limpiarResultadoOperacion() {
    emit(state.copyWith(operacionError: null, operacionExitosa: false));
  }
}
