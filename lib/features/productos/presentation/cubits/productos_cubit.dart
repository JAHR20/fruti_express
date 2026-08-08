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
  final BuscarProductos _buscarProductosUsecase;
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
    required BuscarProductos buscarProductosUsecase,
    required ObtenerProductosPorSucursal obtenerProductosPorSucursalUseCase,
  }) : _buscarProductosUsecase = buscarProductosUsecase,
       _subirImagenProductoUseCase = subirImagenProductoUseCase,
       _obtenerTodosProductosUseCase = obtenerTodosProductosUseCase,
       _obtenerProductosPorCategoriaUseCase =
           obtenerProductosPorCategoriaUseCase,
       _obtenerProductoPorNombreUseCase = obtenerProductoPorNombreUseCase,
       _obtenerProductoPorIdUseCase = obtenerProductoPorIdUseCase,
       _crearProductoUseCase = crearProductoUseCase,
       _cambiarEstadoProductoUseCase = cambiarEstadoProductoUseCase,
       _actualizarProductoUseCase = actualizarProductoUseCase,
       _obtenerProductosPorSucursalUseCase = obtenerProductosPorSucursalUseCase,
       super(const ProductosState.initial());

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
    emit(const ProductosState.loading());
    String? urlFinal = imagenUrl;

    if (imagenArchivo != null) {
      final extensionReal = imagenArchivo.path.split('.').last.toLowerCase();
      final nombreUnico =
          '${DateTime.now().millisecondsSinceEpoch}_${nombre.replaceAll(' ', '_')}.$extensionReal';

      final uploadResult = await _subirImagenProductoUseCase
          .ejecutar(imagenArchivo, nombreUnico)
          .run();

      final hasError = uploadResult.fold(
        (failure) {
          emit(
            ProductosState.error(
              'Error al subir imagen: ${failure.errorMessage}',
            ),
          );
          return true;
        },
        (url) {
          urlFinal = url;
          return false;
        },
      );

      if (hasError) return;
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
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (_) => cargarTodosLosProductos(),
    );
  }

  Future<void> cambiarEstadoProducto({
    required Perfil usuarioActual,
    required String productoId,
    required bool nuevoEstado,
  }) async {
    emit(const ProductosState.loading());

    final result = await _cambiarEstadoProductoUseCase
        .ejecutar(
          usuario: usuarioActual,
          productoId: productoId,
          nuevoEstado: nuevoEstado,
        )
        .run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (_) => cargarTodosLosProductos(),
    );
  }

  Future<void> buscar(String query, String sucursalId) async {
    if (query.trim().isEmpty) {
      emit(const ProductosState.loaded(productos: []));
      return;
    }

    emit(const ProductosState.loading());

    final resultadoEither = await _buscarProductosUsecase
        .ejecutar(query.trim(), sucursalId)
        .run();

    resultadoEither.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (productos) => emit(ProductosState.loaded(productos: productos)),
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
    emit(const ProductosState.loading());
    String? imageUrlFinal;

    if (imagenArchivo != null) {
      final extensionReal = imagenArchivo.path.split('.').last.toLowerCase();
      final nombreUnico =
          '${DateTime.now().millisecondsSinceEpoch}_${nombre.replaceAll(' ', '_')}.$extensionReal';

      final uploadResult = await _subirImagenProductoUseCase
          .ejecutar(imagenArchivo, nombreUnico)
          .run();

      final hasError = uploadResult.fold(
        (failure) {
          emit(
            ProductosState.error(
              'Error al subir imagen: ${failure.errorMessage}',
            ),
          );
          return true;
        },
        (url) {
          imageUrlFinal = url;
          return false;
        },
      );

      if (hasError) return;
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
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (_) => cargarTodosLosProductos(),
    );
  }

  Future<void> cargarProductoPorId(String id) async {
    emit(const ProductosState.loading());

    final result = await _obtenerProductoPorIdUseCase.ejecutar(id).run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      // 🌟 Pasamos el producto al campo productoDetalle
      (producto) => emit(
        ProductosState.loaded(productos: const [], productoDetalle: producto),
      ),
    );
  }

  Future<void> buscarProductoPorNombre(String nombre) async {
    if (nombre.trim().isEmpty) return;

    emit(const ProductosState.loading());

    final result = await _obtenerProductoPorNombreUseCase
        .ejecutar(nombre)
        .run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (producto) => emit(ProductosState.loaded(productos: [producto])),
    );
  }

  Future<void> cargarProductosPorCategoria(String categoriaId, String sucursalId) async {
    emit(const ProductosState.loading());

    final result = await _obtenerProductosPorCategoriaUseCase
        .ejecutar(categoriaId, sucursalId)
        .run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (productos) => emit(
        ProductosState.loaded(
          productos: productos,
          categoriaIdActual: categoriaId,
        ),
      ),
    );
  }

  Future<void> cargarTodosLosProductos() async {
    emit(const ProductosState.loading());

    final result = await _obtenerTodosProductosUseCase.ejecutar().run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (productos) => emit(ProductosState.loaded(productos: productos)),
    );
  }

  Future<void> cargarProductosPorSucursal(String sucursalId) async {
    emit(const ProductosState.loading());

    final result = await _obtenerProductosPorSucursalUseCase
        .ejecutar(sucursalId)
        .run();

    result.fold(
      (failure) => emit(ProductosState.error(failure.errorMessage)),
      (productos) => emit(ProductosState.loaded(productos: productos)),
    );
  }
}
