import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart'; // Banner -> PromoBanner
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';

class GetActivePromoBannersUseCase { 
  final PromoBannerRepository _repository;
  GetActivePromoBannersUseCase(this._repository);

  ResultTask<List<PromoBanner>> execute() => _repository.getActiveBanners(); 
}