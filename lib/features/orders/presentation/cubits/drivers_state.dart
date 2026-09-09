import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

part 'drivers_state.freezed.dart';

@freezed
abstract class DriversState with _$DriversState {
  const factory DriversState.initial() = _Initial; 
  const factory DriversState.loading() = _Loading; 
  const factory DriversState.loaded(List<Profile> drivers) = _Loaded; // repartidores -> drivers
  const factory DriversState.error(String message) = _Error;
}