import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/search_users_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/change_user_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/change_user_role_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/count_active_admins_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/manager_exists_in_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/get_customers_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/get_delivery_persons_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/get_user_by_id_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/get_all_users_use_case.dart';

import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final SearchUsersUseCase _searchUsersUseCase;
  final ChangeUserStatusUseCase _changeUserStatusUseCase;
  final ChangeUserRoleUseCase _changeUserRoleUseCase;
  final CountActiveAdminsUseCase _countActiveAdminsUseCase;
  final ManagerExistsInBranchUseCase _managerExistsInBranchUseCase;
  final GetCustomersUseCase _getCustomersUseCase;
  final GetDeliveryPersonsUseCase _getDeliveryPersonsUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetAllUsersUseCase _getAllUsersUseCase;

  UsersCubit({
    required SearchUsersUseCase searchUsersUseCase,
    required ChangeUserStatusUseCase changeUserStatusUseCase,
    required ChangeUserRoleUseCase changeUserRoleUseCase,
    required CountActiveAdminsUseCase countActiveAdminsUseCase,
    required ManagerExistsInBranchUseCase managerExistsInBranchUseCase,
    required GetCustomersUseCase getCustomersUseCase,
    required GetDeliveryPersonsUseCase getDeliveryPersonsUseCase,
    required GetUserByIdUseCase getUserByIdUseCase,
    required GetAllUsersUseCase getAllUsersUseCase,
  }) : _getAllUsersUseCase = getAllUsersUseCase,
       _getUserByIdUseCase = getUserByIdUseCase,
       _getDeliveryPersonsUseCase = getDeliveryPersonsUseCase,
       _getCustomersUseCase = getCustomersUseCase,
       _managerExistsInBranchUseCase = managerExistsInBranchUseCase,
       _changeUserRoleUseCase = changeUserRoleUseCase,
       _changeUserStatusUseCase = changeUserStatusUseCase,
       _countActiveAdminsUseCase = countActiveAdminsUseCase,
       _searchUsersUseCase = searchUsersUseCase,
       super(const UsersState());

  Future<void> loadUsers(Profile currentUser) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, tab: UsersTab.all),
    );
    final result = await _getAllUsersUseCase.execute(currentUser).run();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (list) => emit(
        state.copyWith(
          users: list,
          isLoading: false,
          errorMessage: null,
          tab: UsersTab.all,
        ),
      ),
    );
  }

  Future<void> loadCustomers(Profile currentUser) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        tab: UsersTab.customers,
      ),
    );
    final result = await _getCustomersUseCase.execute(currentUser).run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (list) => emit(
        state.copyWith(
          users: list,
          isLoading: false,
          errorMessage: null,
          tab: UsersTab.customers,
        ),
      ),
    );
  }

  Future<void> loadDeliveryPersons({
    required Profile currentUser,
    String? branchIdFilter,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        tab: UsersTab.deliveryPersons,
      ),
    );
    // Usamos 'call' porque tu caso de uso lo definió así
    final result = await _getDeliveryPersonsUseCase(
      requester: currentUser,
      optionalBranchId: branchIdFilter,
    ).run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (list) => emit(
        state.copyWith(
          users: list,
          isLoading: false,
          errorMessage: null,
          tab: UsersTab.deliveryPersons,
        ),
      ),
    );
  }

  Future<void> searchUsers({
    required Profile currentUser,
    required String query,
  }) async {
    final cleanQuery = query.trim();

    if (cleanQuery.isEmpty) {
      emit(state.copyWith(searchQuery: ''));
      switch (state.tab) {
        case UsersTab.all:
          return loadUsers(currentUser);
        case UsersTab.deliveryPersons:
          return loadDeliveryPersons(currentUser: currentUser);
        case UsersTab.customers:
          return loadCustomers(currentUser);
      }
    }

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        searchQuery: cleanQuery,
      ),
    );
    final result = await _searchUsersUseCase
        .execute(currentUser: currentUser, query: cleanQuery)
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (list) => emit(
        state.copyWith(
          users: list,
          isLoading: false,
          errorMessage: null,
          searchQuery: cleanQuery,
        ),
      ),
    );
  }

  Future<void> changeUserStatus({
    required Profile currentUser,
    required String targetUserId,
    required bool activate,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        processingUserId: targetUserId,
      ),
    );
    final result = await _changeUserStatusUseCase
        .execute(
          currentUser: currentUser,
          targetUserId: targetUserId,
          activate: activate,
        )
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
          processingUserId: null,
        ),
      ),
      (_) {
        emit(state.copyWith(processingUserId: null));
        loadUsers(currentUser); // Recargamos para actualizar la UI
      },
    );
  }

  Future<void> changeRole({
    required Profile currentUser,
    required String targetUserId,
    required UserRole newRole,
    String? assignedBranchId,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        processingUserId: targetUserId,
      ),
    );
    final result = await _changeUserRoleUseCase
        .execute(
          currentUser: currentUser,
          targetUserId: targetUserId,
          newRole: newRole,
          assignedBranchId: assignedBranchId,
        )
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
          processingUserId: null,
        ),
      ),
      (_) {
        emit(state.copyWith(processingUserId: null));
        loadUsers(currentUser); // Recargamos la lista
      },
    );
  }

  Future<void> verifyBranchManager({
    required Profile currentUser,
    required String branchId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _managerExistsInBranchUseCase
        .execute(requester: currentUser, branchId: branchId)
        .run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (hasManager) {
        if (hasManager) {
          // Generamos el error directamente usando nuestro traductor para mantener el estándar
          final errorMsg = translateFailure(
            const Failure.alreadyExists(FailureCode.branchAlreadyHasManager),
          );
          emit(state.copyWith(isLoading: false, errorMessage: errorMsg));
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: null));
        }
      },
    );
  }

  Future<void> loadUserById({
    required Profile currentUser,
    required String targetId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getUserByIdUseCase
        .execute(requester: currentUser, targetId: targetId)
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (profile) => emit(
        state.copyWith(users: [profile], isLoading: false, errorMessage: null),
      ),
    );
  }

  Future<bool> checkIfLastAdmin({required Profile currentUser}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _countActiveAdminsUseCase.execute(currentUser).run();

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
        return false;
      },
      (adminCount) {
        emit(state.copyWith(isLoading: false));
        return adminCount <= 1;
      },
    );
  }
}
