import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/crear_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/desactivar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/editar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias_activas.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/subir_imagen_categoria_usecase.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:image_picker/image_picker.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  final CrearCategoria _crearCategoriaUseCase;
  final CambiarEstadoCategoria _cambiarEstadoCategoriaUseCase;
  final EditarCategoria _editarCategoriaUseCase;
  final ObtenerCategorias _obtenerCategoriasUseCase;
  final ObtenerCategoriasActivas _obtenerCategoriasActivasUsecase;
  final SubirImagenCategoria _subirImagenCategoriaUseCase;

  CategoriaCubit({
    required CrearCategoria crearCategoriaUseCase,
    required CambiarEstadoCategoria cambiarEstadoCategoriaUseCase,
    required EditarCategoria editarCategoriaUseCase,
    required ObtenerCategorias obtenerCategoriasUseCase,
    required ObtenerCategoriasActivas obtenerCategoriasActivasUseCase,
    required SubirImagenCategoria subirImagenCategoriaUseCase,
  }) : _subirImagenCategoriaUseCase = subirImagenCategoriaUseCase,
       _obtenerCategoriasUseCase = obtenerCategoriasUseCase,
       _editarCategoriaUseCase = editarCategoriaUseCase,
       _cambiarEstadoCategoriaUseCase = cambiarEstadoCategoriaUseCase,
       _crearCategoriaUseCase = crearCategoriaUseCase,
       _obtenerCategoriasActivasUsecase = obtenerCategoriasActivasUseCase,
       super(const CategoriaState());


  Future<void> cargarCategorias(Perfil usuarioActual) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _obtenerCategoriasUseCase.ejecutar().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (lista) {
        emit(
          state.copyWith(
            isLoading: false,
            categorias: lista,
            errorMessage: null,
          ),
        );
      },
    );
  }


  Future<void> cargarCategoriasActivas() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _obtenerCategoriasActivasUsecase.ejecutar().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (categorias) {
        emit(
          state.copyWith(
            isLoading: false,
            categorias: categorias,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> cambiarEstadoCategoria({
    required Perfil usuarioActual,
    required String categoriaId,
    required bool nuevoEstado,
  }) async {
    emit(
      state.copyWith(
        categoriaProcesandoId: categoriaId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final resultado = await _cambiarEstadoCategoriaUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          categoriaId: categoriaId,
          nuevoEstado: nuevoEstado,
        )
        .run();

    resultado.fold(
      (failure) {
        emit(
          state.copyWith(
            categoriaProcesandoId: null,
            operacionError: failure.errorMessage,
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(categoriaProcesandoId: null, operacionExitosa: true),
        );

        await cargarCategorias(usuarioActual);
      },
    );
  }

  Future<void> crearCategoria({
    required Perfil usuarioActual,
    required String nombre,
    String? descripcion,
    XFile? imagenSeleccionada,
    String? categoriaPadreId,
  }) async {
    emit(
      state.copyWith(
        guardandoOperacion: true,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    String? imagenUrlFinal;

    if (imagenSeleccionada != null) {
      final uploadResult = await _subirImagenCategoriaUseCase
          .ejecutar(archivo: imagenSeleccionada, identificadorUnico: nombre)
          .run();

      final falloImagen = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              guardandoOperacion: false,
              operacionError: 'Error al subir imagen: ${failure.errorMessage}',
            ),
          );
          return true;
        },
        (url) {
          imagenUrlFinal = url;
          return false;
        },
      );

      if (falloImagen) return;
    }

    final result = await _crearCategoriaUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          nombre: nombre,
          descripcion: descripcion,
          imagenUrl: imagenUrlFinal,
          categoriaPadreId: categoriaPadreId,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            guardandoOperacion: false,
            operacionError: failure.errorMessage,
          ),
        );
      },
      (_) async {
        emit(state.copyWith(guardandoOperacion: false, operacionExitosa: true));
        await cargarCategorias(usuarioActual);
      },
    );
  }

  Future<void> editarCategoria({
    required Perfil usuarioActual,
    required String categoriaId,
    String? nombre,
    String? descripcion,
    XFile? imagenSeleccionada,
    String? categoriaPadreId,
    bool? activa,
  }) async {
    emit(
      state.copyWith(
        categoriaProcesandoId: categoriaId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    String? imageUrlFinal;

    if (imagenSeleccionada != null) {
      final identificador = nombre ?? categoriaId;

      final uploadResult = await _subirImagenCategoriaUseCase
          .ejecutar(
            archivo: imagenSeleccionada,
            identificadorUnico: identificador,
          )
          .run();

      final falloImagen = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              categoriaProcesandoId: null,
              operacionError:
                  'Error al actualizar la imagen: ${failure.errorMessage}',
            ),
          );
          return true;
        },
        (url) {
          imageUrlFinal = url;
          return false;
        },
      );

      if (falloImagen) return;
    }

    final result = await _editarCategoriaUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          categoriaId: categoriaId,
          nombre: nombre,
          descripcion: descripcion,
          imagenUrl: imageUrlFinal,
          categoriaPadreId: categoriaPadreId,
          activa: activa,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            categoriaProcesandoId: null,
            operacionError: failure.errorMessage,
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(categoriaProcesandoId: null, operacionExitosa: true),
        );
        await cargarCategorias(usuarioActual);
      },
    );
  }
}
