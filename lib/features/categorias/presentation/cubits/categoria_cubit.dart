import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/crear_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/desactivar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/editar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias_activas.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:image_picker/image_picker.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  // Asumiendo que inyectas tus Use Cases (Ajusta los nombres a los tuyos)
  final CrearCategoria _crearCategoriaUseCase;
  final CambiarEstadoCategoria _cambiarEstadoCategoriaUseCase;
  final EditarCategoria _editarCategoriaUseCase;
  final ObtenerCategorias _obtenerCategoriasUseCase;
  final ObtenerCategoriasActivas _obtenerCategoriasActivasUsecase;
  final StorageService _storageService;

  CategoriaCubit({
    required CrearCategoria crearCategoriaUseCase,
    required CambiarEstadoCategoria cambiarEstadoCategoriaUseCase,
    required EditarCategoria editarCategoriaUseCase,
    required ObtenerCategorias obtenerCategoriasUseCase,
    required ObtenerCategoriasActivas obtenerCategoriasActivasUseCase,
    required StorageService storageService,
  }) : _storageService = storageService,
       _obtenerCategoriasUseCase = obtenerCategoriasUseCase,
       _editarCategoriaUseCase = editarCategoriaUseCase,
       _cambiarEstadoCategoriaUseCase = cambiarEstadoCategoriaUseCase,
       _crearCategoriaUseCase = crearCategoriaUseCase,
       _obtenerCategoriasActivasUsecase = obtenerCategoriasActivasUseCase,
       super(const CategoriaState.initial());

  // 1. Obtener lista
  Future<void> cargarCategorias(Perfil usuarioActual) async {
    emit(const CategoriaState.loading());

    final result = await _obtenerCategoriasUseCase.ejecutar().run();

    result.fold(
      (failure) => emit(CategoriaState.error(failure.errorMessage)),
      (lista) => emit(CategoriaState.loaded(lista)),
    );
  }

  Future<void> cargarCategoriasActivas() async {
    emit(const CategoriaState.loading());
    final result = await _obtenerCategoriasActivasUsecase.ejecutar().run();
    result.fold(
      (failure) => emit(CategoriaState.error(failure.errorMessage)),
      (categorias) => emit(CategoriaState.loaded(categorias)),
    );
  }

  // 3. Cambiar estado de una categoría
  Future<void> cambiarEstadoCategoria({
    required Perfil usuarioActual,
    required String categoriaId,
    required bool nuevoEstado,
  }) async {
    emit(const CategoriaState.loading());

    final resultado = await _cambiarEstadoCategoriaUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          categoriaId: categoriaId,
          nuevoEstado: nuevoEstado,
        )
        .run();

    resultado.fold(
      (failure) => emit(CategoriaState.error(failure.errorMessage)),
      (_) => cargarCategorias(usuarioActual),
    );
  }

  Future<void> crearCategoria({
    required Perfil usuarioActual,
    required String nombre,
    String? descripcion,
    XFile? imagenSeleccionada,
    String? categoriaPadreId,
  }) async {
    emit(const CategoriaState.loading());

    try {
      String? imagenUrlFinal;
      if (imagenSeleccionada != null) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final nombreLimpio = nombre.replaceAll(' ', '_').toLowerCase();
        final pathUnico = '${nombreLimpio}_$timestamp.jpg';

        imagenUrlFinal = await _storageService.uploadImage(
          file: imagenSeleccionada,
          bucketName: 'categorias',
          pathName: pathUnico,
        );
      }
      // Ejecutamos el caso de uso
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
        (failure) => emit(CategoriaState.error(failure.errorMessage)),
        (_) => cargarCategorias(usuarioActual),
      );
    } catch (e) {
      emit(CategoriaError('Error al subir la imagen'));
      return;
    }
  }

  // 📝 4. Editar Categoría
  Future<void> editarCategoria({
    required Perfil usuarioActual,
    required String categoriaId,
    String? nombre,
    String? descripcion,
    XFile? imagenSeleccionada,
    String? categoriaPadreId,
    bool? activa,
  }) async {
    emit(const CategoriaState.loading());

    try {
      String? imageUrlFinal;
      if (imagenSeleccionada != null) {
        final nombreLimpio =
            nombre?.replaceAll(' ', '_').toLowerCase() ?? 'cat';
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final pathUnico = '${nombreLimpio}_${categoriaId}_$timestamp';

        imageUrlFinal = await _storageService.uploadImage(
          file: imagenSeleccionada,
          bucketName: 'categorias',
          pathName: pathUnico,
        );
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

      // 4. Manejamos el resultado funcional
      result.fold(
        (failure) => emit(CategoriaState.error(failure.errorMessage)),
        (_) => cargarCategorias(usuarioActual),
      );
    } catch (e) {
      // 🚨 Capturamos si falla la subida a Supabase
      emit(CategoriaError("Error al actualizar la imagen de la categoría: $e"));
    }
  }
}
