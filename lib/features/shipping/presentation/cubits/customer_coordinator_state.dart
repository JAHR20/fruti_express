import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

part 'customer_coordinator_state.freezed.dart';

@freezed
abstract class CustomerCoordinatorState with _$CustomerCoordinatorState {
  const factory CustomerCoordinatorState.idle() = _Idle;
  const factory CustomerCoordinatorState.processing() = _Processing; 
  const factory CustomerCoordinatorState.changeSuccessful(Branch newBranch, bool wasAutomatic) = _ChangeSuccessful; 
  const factory CustomerCoordinatorState.outOfCoverage(Address address) = _OutOfCoverage; 
}