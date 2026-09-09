import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_user_orders_use_case.dart';
import 'customer_orders_state.dart';

class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  final GetUserOrdersUseCase _getUserOrdersUseCase;

  CustomerOrdersCubit({
    required GetUserOrdersUseCase getUserOrdersUseCase,
  })  : _getUserOrdersUseCase = getUserOrdersUseCase,
        super(const CustomerOrdersState.initial());

  Future<void> load(String userId) async {
    emit(const CustomerOrdersState.loading());

    final result = await _getUserOrdersUseCase.execute(userId).run();

    result.fold(
      (failure) => emit(CustomerOrdersState.error(translateFailure(failure))),
      (orders) {
        final sortedOrders = [...orders]
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        emit(CustomerOrdersState.loaded(sortedOrders));
      },
    );
  }
}