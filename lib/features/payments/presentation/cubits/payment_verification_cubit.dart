import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/verify_payment_use_case.dart';
import 'payment_verification_state.dart';

class PaymentVerificationCubit extends Cubit<PaymentVerificationState> {
  final VerifyPaymentUseCase _verifyPaymentUseCase;
  bool _isVerifying = false;

  PaymentVerificationCubit({
    required VerifyPaymentUseCase verifyPaymentUseCase,
  })  : _verifyPaymentUseCase = verifyPaymentUseCase,
        super(const PaymentVerificationState.initial());

  Future<void> verify(String orderId) async {
    if (_isVerifying) return;
    _isVerifying = true;

    final result = await _verifyPaymentUseCase
        .execute(orderId: orderId)
        .run();

    _isVerifying = false;
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        PaymentVerificationState.error(translateFailure(failure)),
      ),
      (status) => emit(PaymentVerificationState.status(status)),
    );
  }
}