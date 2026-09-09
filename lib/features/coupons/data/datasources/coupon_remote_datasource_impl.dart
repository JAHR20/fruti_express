import 'package:fruti_express_jahr_admin/features/coupons/data/models/coupon_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'coupon_remote_datasource.dart';

class CouponRemoteDataSourceImpl implements CouponRemoteDataSource {
  final SupabaseClient supabase;

  static const String _tableName = 'coupons';
  static const String _colId = 'id';
  static const String _colCode = 'code';
  static const String _colIsActive = 'is_active';
  static const String _colCreatedAt = 'created_at';

  CouponRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<CouponModel>> getAll({bool includeInactive = false}) async {
    var query = supabase.from(_tableName).select();

    if (!includeInactive) {
      query = query.eq(_colIsActive, true);
    }

    final response = await query.order(_colCreatedAt, ascending: false);

    return (response as List)
        .map((json) => CouponModel.fromJson(json))
        .toList();
  }

  @override
  Future<CouponModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();
    return response != null ? CouponModel.fromJson(response) : null;
  }

  @override
  Future<CouponModel?> getByCode(String code) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colCode, code)
        .maybeSingle();
    return response != null ? CouponModel.fromJson(response) : null;
  }

  @override
  Stream<List<CouponModel>> watchAll() {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colId])
        .order(_colCreatedAt)
        .map((data) => data.map((json) => CouponModel.fromJson(json)).toList());
  }

  @override
  Future<CouponModel> create(CouponModel model) async {
    final dataMap = model.toJsonForInsert();

    final response = await supabase
        .from(_tableName)
        .insert(dataMap)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al crear el cupón',
        code: '500',
      );
    }

    return CouponModel.fromJson(response);
  }

  @override
  Future<CouponModel> update(CouponModel model) async {
    final dataMap = model.toJsonForUpdate();
    final response = await supabase
        .from(_tableName)
        .update(dataMap)
        .eq(_colId, model.id)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al actualizar el cupón',
        code: '500',
      );
    }

    return CouponModel.fromJson(response);
  }

  @override
  Future<void> changeStatus(String id, bool newState) async {
    await supabase
        .from(_tableName)
        .update({_colIsActive: newState})
        .eq(_colId, id);
  }
}
