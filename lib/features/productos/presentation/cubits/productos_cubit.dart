import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/actualizar_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/buscar_productos.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/cambiar_estado_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/crear_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_producto_por_id.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_producto_por_nombre.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_productos_por_categoria.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_productos_por_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_todos_productos.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/subir_imagen_producto.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'productos_state.dart';

class ProductosCubit extends Cubit<ProductosState> {
  final ActualizarProducto _actualizarProductoUseCase;
  final CambiarEstadoProducto _cambiarEstadoProductoUseCase;
  final CrearProducto _crearProductoUseCase;
  final ObtenerProductoPorId _obtenerProductoPorIdUseCase;
  final ObtenerProductoPorNombre _obtenerProductoPorNombreUseCase;
  final ObtenerProductosPorCategoria _obtenerProductosPorCategoriaUseCase;
  final ObtenerTodosLosProductos _obtenerTodosProductosUseCase;
  final SubirImagenProducto _subirImagenProductoUseCase;
  final BuscarProductos _buscarProductosUseCase;
  final ObtenerProductosPorSucursal _obtenerProductosPorSucursalUseCase;

  ProductosCubit({
    required ActualizarProducto actualizarProductoUseCase,
    required CambiarEstadoProducto cambiarEstadoProductoUseCase,
    required CrearProducto crearProductoUseCase,
    required ObtenerProductoPorId obtenerProductoPorIdUseCase,
    required ObtenerProductoPorNombre obtenerProductoPorNombreUseCase,
    required ObtenerProductosPorCategoria obtenerProductosPorCategoriaUseCase,
    required ObtenerTodosLosProductos obtenerTodosProductosUseCase,
    required SubirImagenProducto subirImagenProductoUseCase,
    required BuscarProductos buscarProductosUseCase,
    required ObtenerProductosPorSucursal obtenerProductosPorSucursalUseCase,
  }) : _actualizarProductoUseCase = actualizarProductoUseCase,
       _cambiarEstadoProductoUseCase = cambiarEstadoProductoUseCase,
       _crearProductoUseCase = crearProductoUseCase,
       _obtenerProductoPorIdUseCase = obtenerProductoPorIdUseCase,
       _obtenerProductoPorNombreUseCase = obtenerProductoPorNombreUseCase,
       _obtenerProductosPorCategoriaUseCase =
           obtenerProductosPorCategoriaUseCase,
       _obtenerTodosProductosUseCase = obtenerTodosProductosUseCase,
       _subirImagenProductoUseCase = subirImagenProductoUseCase,
       _buscarProductosUseCase = buscarProductosUseCase,
       _obtenerProductosPorSucursalUseCase = obtenerProductosPorSucursalUseCase,
       super(const ProductosState());

  int _busquedaIdActual = 0;

  Future<void> cargarTodosLosProductos() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _obtenerTodosProductosUseCase.ejecutar().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (productos) {
        emit(
          state.copyWith(
            isLoading: false,
            productos: productos,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> cargarProductosPorSucursal(String sucursalId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _obtenerProductosPorSucursalUseCase
        .ejecutar(sucursalId)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (productos) {
        emit(
          state.copyWith(
            isLoading: false,
            productos: productos,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> buscar(String query, String sucursalId) async {
    final texto = query.trim();

    final miBusquedaId = ++_busquedaIdActual;

    if (texto.isEmpty) {
      emit(
        state.copyWith(
          productos: const [],
          errorMessage: null,
          isLoading: false,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _buscarProductosUseCase
        .ejecutar(texto, sucursalId)
        .run();

    if (miBusquedaId != _busquedaIdActual) return;

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (productos) {
        emit(
          state.copyWith(
            isLoading: false,
            productos: productos,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> cargarProductosPorCategoria(
    String categoriaId,
    String sucursalId,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        categoriaIdActual: categoriaId,
        errorMessage: null,
      ),
    );

    final result = await _obtenerProductosPorCategoriaUseCase
        .ejecutar(categoriaId, sucursalId)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (productos) {
        emit(
          state.copyWith(
            isLoading: false,
            productos: productos,
            categoriaIdActual: categoriaId,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> cargarProductoPorId(String id) async {
    emit(
      state.copyWith(
        isLoading: true,
        productoDetalle: null,
        errorMessage: null,
      ),
    );

    final result = await _obtenerProductoPorIdUseCase.ejecutar(id).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (producto) {
        emit(
          state.copyWith(
            isLoading: false,
            productoDetalle: producto,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> buscarProductoPorNombre(String nombre) async {
    final texto = nombre.trim();

    if (texto.isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _obtenerProductoPorNombreUseCase.ejecutar(texto).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (producto) {
        emit(
          state.copyWith(
            isLoading: false,
            productos: [producto],
            productoDetalle: producto,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> crearProducto({
    required Perfil usuarioActual,
    required String categoriaId,
    required String nombre,
    String? descripcion,
    required int precioActual,
    int? precioComparacion,
    required UnidadMedida unidadMedida,
    File? imagenArchivo,
  }) async {
    emit(
      state.copyWith(
        guardandoOperacion: true,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    String? imageUrlFinal;

    if (imagenArchivo != null) {
      final extensionReal = imagenArchivo.path.split('.').last.toLowerCase();

      final nombreUnico =
          '${DateTime.now().millisecondsSinceEpoch}_'
          '${nombre.replaceAll(' ', '_')}.$extensionReal';

      final uploadResult = await _subirImagenProductoUseCase
          .ejecutar(imagenArchivo, nombreUnico)
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
          imageUrlFinal = url;
          return false;
        },
      );

      if (falloImagen) return;
    }

    final result = await _crearProductoUseCase
        .ejecutar(
          usuario: usuarioActual,
          categoriaId: categoriaId,
          nombre: nombre,
          descripcion: descripcion,
          precioActual: precioActual,
          precioComparacion: precioComparacion,
          unidadMedida: unidadMedida,
          imagenUrl: imageUrlFinal,
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
      (producto) {
        emit(
          state.copyWith(
            guardandoOperacion: false,
            operacionExitosa: true,
            productos: [...state.productos, producto],
          ),
        );
      },
    );
  }

  Future<void> actualizarProducto({
    required Perfil usuarioActual,
    required String productoId,
    required String categoriaId,
    required String nombre,
    String? descripcion,
    required int precioActual,
    int? precioComparacion,
    required UnidadMedida unidadMedida,
    String? imagenUrl,
    required bool isActive,
    File? imagenArchivo,
  }) async {
    emit(
      state.copyWith(
        productoProcesandoId: productoId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    String? urlFinal = imagenUrl;

    if (imagenArchivo != null) {
      final extensionReal = imagenArchivo.path.split('.').last.toLowerCase();

      final nombreUnico =
          '${DateTime.now().millisecondsSinceEpoch}_'
          '${nombre.replaceAll(' ', '_')}.$extensionReal';

      final uploadResult = await _subirImagenProductoUseCase
          .ejecutar(imagenArchivo, nombreUnico)
          .run();

      final falloImagen = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              productoProcesandoId: null,
              operacionError: 'Error al subir imagen: ${failure.errorMessage}',
            ),
          );

          return true;
        },
        (url) {
          urlFinal = url;
          return false;
        },
      );

      if (falloImagen) return;
    }

    final result = await _actualizarProductoUseCase
        .ejecutar(
          usuario: usuarioActual,
          productoId: productoId,
          categoriaId: categoriaId,
          nombre: nombre,
          descripcion: descripcion,
          precioActual: precioActual,
          precioComparacion: precioComparacion,
          unidadMedida: unidadMedida,
          imagenUrl: urlFinal,
          isActive: isActive,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            productoProcesandoId: null,
            operacionError: failure.errorMessage,
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(productoProcesandoId: null, operacionExitosa: true),
        );

        await cargarTodosLosProductos();
      },
    );
  }

  Future<void> cambiarEstadoProducto({
    required Perfil usuarioActual,
    required String productoId,
    required bool nuevoEstado,
  }) async {
    emit(
      state.copyWith(
        productoProcesandoId: productoId,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _cambiarEstadoProductoUseCase
        .ejecutar(
          usuario: usuarioActual,
          productoId: productoId,
          nuevoEstado: nuevoEstado,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            productoProcesandoId: null,
            operacionError: failure.errorMessage,
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(productoProcesandoId: null, operacionExitosa: true),
        );

        await cargarTodosLosProductos();
      },
    );
  }
}
