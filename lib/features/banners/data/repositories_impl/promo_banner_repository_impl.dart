import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/promo_banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/promo_banner_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';

class PromoBannerRepositoryImpl 
    with SupabaseHandleException
    implements PromoBannerRepository {
  final PromoBannerRemoteDataSource remoteDataSource; 

  PromoBannerRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<List<PromoBanner>> getActiveBanners() => TaskEither.tryCatch(
    () async {
      final models = await remoteDataSource.getActiveBanners();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<List<PromoBanner>> getAllBanners() => TaskEither.tryCatch(
    () async {
      final models = await remoteDataSource.getAllBanners();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<PromoBanner?> getById(String id) => TaskEither.tryCatch(
    () async {
      final model = await remoteDataSource.getById(id);
      return model?.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<PromoBanner> create(PromoBanner banner) => TaskEither.tryCatch(
    () async {
      final model = PromoBannerModelX.fromDomain(banner);
      final created = await remoteDataSource.create(model);
      return created.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<PromoBanner> update(PromoBanner banner) => TaskEither.tryCatch(
    () async {
      final model = PromoBannerModelX.fromDomain(banner);
      final updated = await remoteDataSource.update(model);
      return updated.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Unit> changeStatus(String id, bool isActive) => TaskEither.tryCatch(
    () async {
      await remoteDataSource.changeStatus(id, isActive);
      return unit;
    },
    handleException,
  );

  @override
  ResultTask<Unit> delete(String id) => TaskEither.tryCatch(
    () async {
      await remoteDataSource.delete(id);
      return unit;
    },
    handleException,
  );

  @override
  ResultTask<String> uploadImage(File file, String fileName) =>
      TaskEither.tryCatch(
        () async => remoteDataSource.uploadImage(file, fileName),
        handleException,
      );
}