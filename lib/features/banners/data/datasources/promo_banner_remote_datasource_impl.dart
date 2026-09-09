import 'dart:io';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/promo_banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/promo_banner_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PromoBannerRemoteDataSourceImpl implements PromoBannerRemoteDataSource {
  final SupabaseClient supabase;
  
  static const String _tableName = 'banners';
  static const String _colId = 'id';
  static const String _colIsActive = 'is_active';
  static const String _colSortOrder = 'display_order';
  static const String _colCreatedAt = 'created_at';

  PromoBannerRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<PromoBannerModel>> getActiveBanners() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colIsActive, true)
        .order(_colSortOrder, ascending: true);
        
    return (response as List).map((json) => PromoBannerModel.fromJson(json)).toList();
  }

  @override
  Future<List<PromoBannerModel>> getAllBanners() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .order(_colSortOrder, ascending: true);
        
    return (response as List).map((json) => PromoBannerModel.fromJson(json)).toList();
  }

  @override
  Future<PromoBannerModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();
        
    return response != null ? PromoBannerModel.fromJson(response) : null;
  }

  @override
  Future<PromoBannerModel> create(PromoBannerModel model) async {
    final data = model.toJson(); 
    data.remove(_colId);
    data.remove(_colCreatedAt);
    
    final response = await supabase
        .from(_tableName)
        .insert(data)
        .select()
        .single();
        
    return PromoBannerModel.fromJson(response);
  }

  @override
  Future<PromoBannerModel> update(PromoBannerModel model) async {
    final response = await supabase
        .from(_tableName)
        .update(model.toJson())
        .eq(_colId, model.id)
        .select()
        .single();
        
    return PromoBannerModel.fromJson(response);
  }

  @override
  Future<void> changeStatus(String id, bool isActive) async { 
    await supabase
        .from(_tableName)
        .update({_colIsActive: isActive})
        .eq(_colId, id);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from(_tableName).delete().eq(_colId, id);
  }

  @override
  Future<String> uploadImage(File file, String fileName) async { 
    final path = 'banners/$fileName'; 
    final extension = fileName.split('.').last.toLowerCase();

    String contentType = 'image/jpeg';
    if (extension == 'png') contentType = 'image/png';
    if (extension == 'webp') contentType = 'image/webp';

    await supabase.storage
        .from('imagenes_banners')
        .upload(
          path,
          file,
          fileOptions: FileOptions(
            cacheControl: '3600',
            upsert: true,
            contentType: contentType,
          ),
        );

    return supabase.storage.from('imagenes_banners').getPublicUrl(path);
  }
}