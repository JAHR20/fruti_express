import 'package:fruti_express_jahr_admin/features/payments/data/datasources/payment_remote_data_source.dart';
import 'package:fruti_express_jahr_admin/features/payments/data/models/card_payment_result_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final SupabaseClient _supabase;

  PaymentRemoteDataSourceImpl(this._supabase);

  @override
  Future<CardPaymentResultModel> createCardPayment({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    required int installments,
  }) async {
    try {
      final response = await _supabase.functions.invoke(
        'create-card-payment',
        body: {
          'order_id': orderId,
          'token': token,
          'payment_method_id': paymentMethodId,
          'payment_type_id': paymentTypeId,
          'installments': installments,
        },
      );

      final data = response.data;
      if (data is! Map) {
        throw const FormatException(
          'La respuesta de pago no tiene un formato válido.',
        );
      }
      return CardPaymentResultModel.fromJson(Map<String, dynamic>.from(data));
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error']?.toString() : null;
      throw Exception(message ?? 'No se pudo procesar el pago.');
    }
  }

  @override
  Future<String> verifyPayment({required String orderId}) async {
    try {
      final response = await _supabase.functions.invoke(
        'verify-payment',
        body: {'order_id': orderId},
      );

      final data = response.data;
      if (data is! Map || data['status'] is! String) {
        throw const FormatException(
          'La respuesta de verificación no tiene un formato válido.',
        );
      }
      return data['status'] as String;
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error']?.toString() : null;
      throw Exception(message ?? 'No se pudo verificar el pago.');
    }
  }

  @override
  Future<void> cancelUnpaidOrder({required String orderId}) async {
    await _supabase.rpc(
      'cancel_my_unpaid_order',
      params: {'p_order_id': orderId},
    );
  }
}
