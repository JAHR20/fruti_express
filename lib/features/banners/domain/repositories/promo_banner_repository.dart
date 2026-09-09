import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

abstract class PromoBannerRepository { 
  
  ResultTask<List<PromoBanner>> getActiveBanners(); 
  ResultTask<List<PromoBanner>> getAllBanners(); 
  ResultTask<PromoBanner?> getById(String id); 

  ResultTask<PromoBanner> create(PromoBanner banner); 
  ResultTask<PromoBanner> update(PromoBanner banner); 
  ResultTask<Unit> changeStatus(String id, bool isActive);
  ResultTask<Unit> delete(String id); 
  ResultTask<String> uploadImage(File file, String fileName); 
}