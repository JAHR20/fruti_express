import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/get_delivery_persons_use_case.dart';
import 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  final GetDeliveryPersonsUseCase _getDeliveryPersons; 

  DriversCubit({required GetDeliveryPersonsUseCase getDeliveryPersons})
      : _getDeliveryPersons = getDeliveryPersons,
        super(const DriversState.initial());

  Future<void> load({required AppUser requester}) async {
    emit(const DriversState.loading());

    final result = await _getDeliveryPersons(
      requester: requester,
    ).run();

    result.fold(
      (failure) => emit(DriversState.error(translateFailure(failure))),
      (drivers) => emit(DriversState.loaded(drivers)),
    );
  }
}