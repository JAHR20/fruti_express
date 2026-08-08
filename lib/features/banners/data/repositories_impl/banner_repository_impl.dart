import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/banner_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';

class BannerRepositoryImpl
    with SupabaseHandleException
    implements BannerRepository {
  final BannerRemoteDatasource remoteDatasource;

  BannerRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Banner>> obtenerActivos() => TaskEither.tryCatch(
    () async {
      final models = await remoteDatasource.obtenerActivos();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<List<Banner>> obtenerTodos() => TaskEither.tryCatch(
    () async {
      final models = await remoteDatasource.obtenerTodos();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<Banner?> obtenerPorId(String id) => TaskEither.tryCatch(
    () async {
      final model = await remoteDatasource.obtenerPorId(id);
      return model?.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Banner> crear(Banner banner) => TaskEither.tryCatch(
    () async {
      final model = BannerModelX.fromDomain(banner);
      final created = await remoteDatasource.crear(model);
      return created.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Banner> actualizar(Banner banner) => TaskEither.tryCatch(
    () async {
      final model = BannerModelX.fromDomain(banner);
      final updated = await remoteDatasource.actualizar(model);
      return updated.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Unit> cambiarEstado(String id, bool activo) => TaskEither.tryCatch(
    () async {
      await remoteDatasource.cambiarEstado(id, activo);
      return unit;
    },
    handleException,
  );

  @override
  ResultTask<Unit> eliminar(String id) => TaskEither.tryCatch(
    () async {
      await remoteDatasource.eliminar(id);
      return unit;
    },
    handleException,
  );

  @override
  ResultTask<String> subirImagen(File archivo, String nombreArchivo) =>
      TaskEither.tryCatch(
        () async => remoteDatasource.subirImagen(archivo, nombreArchivo),
        handleException,
      );
}