import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/productos/data/datasources/producto_remote_datasource.dart';
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
    () async => await remoteDatasource.obtenerTodos(),
    handleException,
  );

  @override
  ResultTask<Producto> crear(Producto producto) => TaskEither.tryCatch(
    () async => await remoteDatasource.crear(producto),
    handleException,
  );

  @override
  ResultTask<Producto> actualizar(Producto producto) => TaskEither.tryCatch(
    () async => await remoteDatasource.actualizar(producto),
    handleException,
  );

  @override
  ResultTask<Unit> eliminar(String id) => TaskEither.tryCatch(() async {
    await remoteDatasource.eliminar(id);
    return unit;
  }, handleException);

  @override
  ResultTask<List<Producto>> obtenerPorCategoria(String categoriaId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorCategoria(categoriaId),
        handleException,
      );
  @override
  ResultTask<Producto> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final res = await remoteDatasource.obtenerPorId(id);
    if (res == null) {
      throw const PostgrestException(
        message: 'Producto no encontrado',
        code: 'PGRST116',
      );
    }
    return res;
  }, handleException);

  @override
  ResultTask<Producto> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final res = await remoteDatasource.obtenerPorNombre(nombre);
        if (res == null) {
          throw const PostgrestException(
            message: 'Producto no encontrado',
            code: 'PGRST116',
          );
        }
        return res;
      }, handleException);

  @override
  ResultTask<bool> existePorNombre(String nombre) => TaskEither.tryCatch(
    () async => await remoteDatasource.existePorNombre(nombre),
    handleException,
  );
}
