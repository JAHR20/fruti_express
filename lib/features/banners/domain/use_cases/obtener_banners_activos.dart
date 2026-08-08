import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';

class ObtenerBannersActivos {
  final BannerRepository _repository;
  ObtenerBannersActivos(this._repository);

  ResultTask<List<Banner>> ejecutar() => _repository.obtenerActivos();
}