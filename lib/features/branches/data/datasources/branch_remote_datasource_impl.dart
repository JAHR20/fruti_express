import 'package:fruti_express_jahr_admin/features/branches/data/models/branch_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'branch_remote_datasource.dart';

class BranchRemoteDatasourceImpl implements BranchRemoteDatasource {
  final SupabaseClient supabase;

  static const String _tableName = 'branches';
  static const String _tableCoverage = 'branch_coverage';
  static const String _colId = 'id';
  static const String _colName = 'name';
  static const String _colBranchId = 'branch_id';
  static const String _colZipCode = 'zip_code';

  BranchRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<BranchModel>> getAll() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .order(_colName, ascending: true);

    return (response as List)
        .map((json) => BranchModel.fromJson(json))
        .toList();
  }

  @override
  Future<BranchModel?> getByName(String name) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colName, name)
        .maybeSingle();

    if (response == null) return null;

    return BranchModel.fromJson(response);
  }

  @override
  Stream<List<BranchModel>> watchAll() {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colId])
        .order(_colName)
        .map(
          (data) => data.map((json) => BranchModel.fromJson(json)).toList(),
        );
  }

  @override
  Future<BranchModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();

    if (response == null) return null;

    return BranchModel.fromJson(response);
  }

  @override
  Future<BranchModel> create(BranchModel model) async {
    final data = model.toJson();
    data.remove(_colId);
    final response = await supabase
        .from(_tableName)
        .insert(data)
        .select()
        .single();

    return BranchModel.fromJson(response);
  }

  @override
  Future<BranchModel> update(BranchModel model) async {
    final data = model.toJson();
    data.remove(_colId);
    final response = await supabase
        .from(_tableName)
        .update(data)
        .eq(_colId, model.id)
        .select()
        .single();

    return BranchModel.fromJson(response);
  }

  @override
  Future<List<String>> getCoverage(String branchId) async {
    final response = await supabase
        .from(_tableCoverage)
        .select(_colZipCode)
        .eq(_colBranchId, branchId);
        
    return (response as List)
        .map((row) => row[_colZipCode] as String)
        .toList();
  }

  @override
  Future<BranchModel?> getByPostalCode(String postalCode) async {
    final response = await supabase
        .from(_tableCoverage)
        .select('$_tableName(*)')
        .eq(_colZipCode, postalCode)
        .maybeSingle();

    if (response == null || response[_tableName] == null) {
      return null;
    }

    return BranchModel.fromJson(response[_tableName]);
  }

  @override
  Future<void> updateCoverage({
    required String branchId,
    required List<String> postalCodes,
  }) async {
    await supabase
        .from(_tableCoverage)
        .delete()
        .eq(_colBranchId, branchId);

    if (postalCodes.isNotEmpty) {
      final insertList = postalCodes
          .map((cp) => {_colBranchId: branchId, _colZipCode: cp})
          .toList();

      await supabase.from(_tableCoverage).insert(insertList);
    }
  }
}