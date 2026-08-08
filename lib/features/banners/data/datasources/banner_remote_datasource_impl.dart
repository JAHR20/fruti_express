import 'dart:io';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/banner_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BannerRemoteDatasourceImpl implements BannerRemoteDatasource {
  final SupabaseClient supabase;
  static const String _table = 'banners';

  BannerRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<BannerModel>> obtenerActivos() async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('activo', true)
        .order('orden', ascending: true);
    return (response as List).map((json) => BannerModel.fromJson(json)).toList();
  }

  @override
  Future<List<BannerModel>> obtenerTodos() async {
    final response = await supabase
        .from(_table)
        .select()
        .order('orden', ascending: true);
    return (response as List).map((json) => BannerModel.fromJson(json)).toList();
  }

  @override
  Future<BannerModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? BannerModel.fromJson(response) : null;
  }

  @override
  Future<BannerModel> crear(BannerModel model) async {
    final datos = model.toJson();
    datos.remove('id');
    datos.remove('fecha_creacion');
    final response = await supabase
        .from(_table)
        .insert(datos)
        .select()
        .single();
    return BannerModel.fromJson(response);
  }

  @override
  Future<BannerModel> actualizar(BannerModel model) async {
    final response = await supabase
        .from(_table)
        .update(model.toJson())
        .eq('id', model.id)
        .select()
        .single();
    return BannerModel.fromJson(response);
  }

  @override
  Future<void> cambiarEstado(String id, bool activo) async {
    await supabase
        .from(_table)
        .update({'activo': activo})
        .eq('id', id);
  }

  @override
  Future<void> eliminar(String id) async {
    await supabase.from(_table).delete().eq('id', id);
  }

  @override
  Future<String> subirImagen(File archivo, String nombreArchivo) async {
    final ruta = 'banners/$nombreArchivo';
    final extension = nombreArchivo.split('.').last.toLowerCase();

    String tipoContenido = 'image/jpeg';
    if (extension == 'png') tipoContenido = 'image/png';
    if (extension == 'webp') tipoContenido = 'image/webp';

    await supabase.storage
        .from('imagenes_banners')
        .upload(
          ruta,
          archivo,
          fileOptions: FileOptions(
            cacheControl: '3600',
            upsert: true,
            contentType: tipoContenido,
          ),
        );

    return supabase.storage.from('imagenes_banners').getPublicUrl(ruta);
  }
}