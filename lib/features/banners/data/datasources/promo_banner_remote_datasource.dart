import 'dart:io';
import 'package:fruti_express_jahr_admin/features/banners/data/models/promo_banner_model.dart';

abstract class PromoBannerRemoteDataSource { 
  Future<List<PromoBannerModel>> getActiveBanners();
  Future<List<PromoBannerModel>> getAllBanners(); 
  Future<PromoBannerModel?> getById(String id); 
  
  Future<PromoBannerModel> create(PromoBannerModel model); 
  Future<PromoBannerModel> update(PromoBannerModel model); 
  Future<void> changeStatus(String id, bool isActive); 
  Future<void> delete(String id); 
  Future<String> uploadImage(File file, String fileName); 
}