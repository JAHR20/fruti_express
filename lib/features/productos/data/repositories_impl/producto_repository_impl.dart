import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/productos/data/datasources/producto_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/productos/data/models/producto_model.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductoRepositoryImpl
    with SupabaseHandleException
    implements ProductoRepository {
  final ProductoRemoteDatasource remoteDatasource;

  ProductoRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Producto>> obtenerTodos() => TaskEither.tryCatch(
    () async {
      final models = await remoteDatasource.obtenerTodos();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<List<Producto>> obtenerPorCategoria(String categoriaId, String sucursalId) =>
      TaskEither.tryCatch(
        () async {
          final models = await remoteDatasource.obtenerPorCategoria(categoriaId, sucursalId);
          return models.map((m) => m.toDomain()).toList();
        },
        handleException,
      );

  @override
  ResultTask<Producto> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.obtenerPorId(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Producto no encontrado',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Producto> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.obtenerPorNombre(nombre);
        if (model == null) {
          throw const PostgrestException(
            message: 'Producto no encontrado',
            code: 'PGRST116',
          );
        }
        return model.toDomain();
      }, handleException);

  @override
  ResultTask<bool> existePorNombre(String nombre) => TaskEither.tryCatch(
    () async => remoteDatasource.existePorNombre(nombre),
    handleException,
  );

  @override
  ResultTask<List<Producto>> buscarProductos(String query, String sucursalId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.buscarProductos(query, sucursalId);
        // Convertimos la lista de Modelos a lista de Entidades Puras
        return models.map((model) => model.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<Producto> crear(Producto producto) => TaskEither.tryCatch(
    () async {
      final model = ProductoModelX.fromDomain(producto);
      final created = await remoteDatasource.crear(model);
      return created.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Producto> actualizar(Producto producto) => TaskEither.tryCatch(
    () async {
      final model = ProductoModelX.fromDomain(producto);
      final updated = await remoteDatasource.actualizar(model);
      return updated.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Unit> eliminar(String id) => TaskEither.tryCatch(() async {
    await remoteDatasource.eliminar(id);
    return unit;
  }, handleException);

  @override
  ResultTask<String> subirImagen(File archivo, String nombreArchivo) =>
      TaskEither.tryCatch(
        () async => remoteDatasource.subirImagen(archivo, nombreArchivo),
        handleException,
      );

  @override
  ResultTask<List<Producto>> obtenerPorSucursal(String sucursalId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorSucursal(sucursalId);
        // Convertimos la lista de Modelos a lista de Entidades Puras
        return models.map((model) => model.toDomain()).toList();
      }, handleException);
}