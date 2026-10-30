import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/card_payment_result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/cancel_unpaid_order_use_case.dart'; // NUEVO
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/create_card_payment_use_case.dart';
import 'card_payment_state.dart';

class CardPaymentCubit extends Cubit<CardPaymentState> {
  final CreateCardPaymentUseCase _createCardPaymentUseCase;
  final CancelUnpaidOrderUseCase _cancelUnpaidOrderUseCase; 

  CardPaymentCubit({
    required CreateCardPaymentUseCase createCardPaymentUseCase,
    required CancelUnpaidOrderUseCase cancelUnpaidOrderUseCase, 
  })  : _createCardPaymentUseCase = createCardPaymentUseCase,
        _cancelUnpaidOrderUseCase = cancelUnpaidOrderUseCase, 
        super(const CardPaymentState.initial());

  Future<void> pay({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    int installments = 1,
  }) async {
    final isProcessing = state.maybeWhen(
      processing: () => true,
      orElse: () => false,
    );
    if (isProcessing) return;

    emit(const CardPaymentState.processing());

    final result = await _createCardPaymentUseCase
        .execute(
          orderId: orderId,
          token: token,
          paymentMethodId: paymentMethodId,
          paymentTypeId: paymentTypeId,
          installments: installments,
        )
        .run();

    if (isClosed) return;

    result.fold(
      (failure) => emit(CardPaymentState.error(translateFailure(failure))),
      (payment) {
        switch (payment.status) {
          case CardPaymentStatus.approved:
            emit(CardPaymentState.approved(payment.orderId));
          case CardPaymentStatus.rejected:
            emit(CardPaymentState.rejected(
              payment.message ?? 'El pago no se pudo completar.',
            ));
          case CardPaymentStatus.pending:
            emit(CardPaymentState.pending(payment.orderId));
        }
      },
    );
  }

  Future<void> abandon(String orderId) async {
    await _cancelUnpaidOrderUseCase.execute(orderId: orderId).run();
  }
}