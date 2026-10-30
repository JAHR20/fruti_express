import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

part 'users_state.freezed.dart';

enum UsersTab { 
  all,
  deliveryPersons,
  customers,
}

@freezed
abstract class UsersState with _$UsersState {
  const factory UsersState({
    @Default([]) List<AppUser> users,
    @Default(false) bool isLoading,
    @Default(UsersTab.all) UsersTab tab,
    String? processingUserId,
    String? errorMessage,
    @Default('') String searchQuery,
  }) = _UsersState;
}