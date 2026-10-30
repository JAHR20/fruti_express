import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

part 'drivers_state.freezed.dart';

@freezed
abstract class DriversState with _$DriversState {
  const factory DriversState.initial() = _Initial; 
  const factory DriversState.loading() = _Loading; 
  const factory DriversState.loaded(List<AppUser> drivers) = _Loaded;
  const factory DriversState.error(String message) = _Error;
}