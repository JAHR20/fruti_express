import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/user_profile_model.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/data/datasources/user_remote_datasource.dart'; // 🌟 Traducido
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

class UserRepositoryImpl with SupabaseHandleException implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<AppUser>> getAll() {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getAll();
      return models.map((m) => m.toEntity()).toList();
    }, handleException);
  }

  @override
  ResultTask<AppUser> getById(String id) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.getById(id);
      if (model == null) {
        throw const PostgrestException(message: 'Not found', code: 'PGRST116');
      }
      return model.toEntity();
    }, handleException);
  }

  @override
  ResultTask<List<AppUser>> searchUsers(String query) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.searchUsers(query);
      return models.map((m) => m.toEntity()).toList();
    }, handleException);
  }

  @override
  ResultTask<List<AppUser>> getDeliveryPersons({String? branchId}) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getDeliveryPersons(
        branchId: branchId,
      );
      return models.map((m) => m.toEntity()).toList();
    }, handleException);
  }

  @override
  ResultTask<int> countActiveAdmins() {
    return TaskEither.tryCatch(
      () async =>
          remoteDatasource.countByRoleAndStatus(role: 'admin', active: true),
      handleException,
    );
  }

  @override
  ResultTask<bool> managerExistsInBranch(String branchId) {
    return TaskEither.tryCatch(
      () async => remoteDatasource.managerExistsInBranch(branchId),
      handleException,
    );
  }

  @override
  ResultTask<List<AppUser>> getCustomersWhoBoughtInBranch(
    String branchId,
  ) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getByBranch(branchId);
      return models.map((m) => m.toEntity()).toList();
    }, handleException);
  }

  @override
  ResultTask<UserProfile> update(UserProfile profile) {
    return TaskEither.tryCatch(() async {
      final model = UserProfileModel.fromDomain(profile); 
      final updated = await remoteDatasource.updateProfile(model);
      return updated.toEntity();
    }, handleException);
  }

  @override
  ResultTask<AppUser> changeStatus({required String id, required bool active}) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.changeStatus(
        id: id,
        active: active,
      );
      return model.toEntity();
    }, handleException);
  }

  @override
  ResultTask<AppUser> changeRole({
    required String id,
    required UserRole newRole,
    required String? branchId,
  }) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.changeRole(
        id: id,
        role: newRole.name,
        branchId: branchId
      );
      return model.toEntity();
    }, handleException);
  }
}