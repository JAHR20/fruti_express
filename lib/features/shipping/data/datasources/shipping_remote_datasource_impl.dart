import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/datasources/shipping_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_config_model.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_rate_model.dart';

class ShippingRemoteDataSourceImpl implements ShippingRemoteDataSource {
  final SupabaseClient _supabaseClient;

  static const String _tableConfig = 'shipping_configuration';
  static const String _tableCoverage = 'branch_coverage';
  static const String _tableRates = 'shipping_rates';
  static const String _colBranchId = 'branch_id';
  static const String _colZipCode = 'zip_code';
  static const String _colIsActive = 'is_active';
  static const String _colMinDistance = 'min_distance_km';

  static const String _saveShippingConfigurationRpc =
      'save_shipping_configuration';
  static const String _configurationParam = 'p_configuration';
  static const String _zipCodesParam = 'p_zip_codes';

  ShippingRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<ShippingConfigModel?> getConfig(String branchId) async {
    try {
      final response = await _supabaseClient
          .from(_tableConfig)
          .select()
          .eq(_colBranchId, branchId)
          .maybeSingle();

      if (response == null) {
        return null;
      }

      final coverageResponse = await _supabaseClient
          .from(_tableCoverage)
          .select(_colZipCode)
          .eq(_colBranchId, branchId);

      final fullData = Map<String, dynamic>.from(response);
      fullData[_tableCoverage] = coverageResponse;

      return ShippingConfigModel.fromSupabase(fullData);
    } on PostgrestException catch (e) {
      throw ServerFailure(
        FailureCode.databaseError,
        params: {'errorCode': e.code, 'errorMsg': e.message},
      );
    } catch (e) {
      throw ServerFailure(
        FailureCode.serverError,
        params: {'errorMsg': e.toString()},
      );
    }
  }

  @override
  Future<List<ShippingRateModel>> getRates(String branchId) async {
    try {
      final response = await _supabaseClient
          .from(_tableRates)
          .select()
          .eq(_colBranchId, branchId)
          .eq(_colIsActive, true)
          .order(_colMinDistance, ascending: true);

      return response.map((json) => ShippingRateModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerFailure(
        FailureCode.databaseError,
        params: {'errorCode': e.code, 'errorMsg': e.message},
      );
    } catch (e) {
      throw ServerFailure(
        FailureCode.serverError,
        params: {'errorMsg': e.toString()},
      );
    }
  }

  @override
  Future<void> saveConfig(ShippingConfigModel config) async {
    try {
      await _supabaseClient.rpc(
        _saveShippingConfigurationRpc,
        params: {
          _configurationParam: config.toJsonForInsert(),
          _zipCodesParam: config.allowedZipCodes,
        },
      );
    } on PostgrestException catch (e) {
      throw ServerFailure(
        FailureCode.databaseError,
        params: {'errorCode': e.code, 'errorMsg': e.message},
      );
    } catch (e) {
      throw ServerFailure(
        FailureCode.serverError,
        params: {'errorMsg': e.toString()},
      );
    }
  }


  @override
  Future<void> saveRates({
    required String branchId,
    required List<ShippingRateModel> rates,
  }) async {
    try {
      final ratesJson = rates.map((rate) {
        final json = rate.toJson();

        if (rate.id.isEmpty) {
          json.remove('id');
          json.remove('created_at');
        }

        return json;
      }).toList();

      await _supabaseClient.rpc(
        'save_shipping_rates',
        params: {'p_branch_id': branchId, 'p_rates': ratesJson},
      );
    } on PostgrestException catch (e) {
      throw ServerFailure(
        FailureCode.databaseError,
        params: {'errorCode': e.code, 'errorMsg': e.message},
      );
    } catch (e) {
      throw ServerFailure(
        FailureCode.serverError,
        params: {'errorMsg': e.toString()},
      );
    }
  }


  @override
  Future<Set<String>> getBranchesWithConfiguredShipping() async {
    try {
      final data = await _supabaseClient
          .from(_tableConfig)
          .select(_colBranchId);

      return (data as List).map((row) => row[_colBranchId] as String).toSet();
    } on PostgrestException catch (e) {
      throw ServerFailure(
        FailureCode.databaseError,
        params: {'errorCode': e.code, 'errorMsg': e.message},
      );
    } catch (e) {
      throw ServerFailure(
        FailureCode.serverError,
        params: {'errorMsg': e.toString()},
      );
    }
  }
}
