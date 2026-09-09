import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/data/datasources/user_remote_datasource.dart'; // 🌟 Traducido
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

class UserRepositoryImpl with SupabaseHandleException implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Profile>> getAll() {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getAll();
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<Profile> getById(String id) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.getById(id);
      if (model == null) {
        throw const PostgrestException(message: 'Not found', code: 'PGRST116');
      }
      return model.toDomain();
    }, handleException);
  }

  @override
  ResultTask<List<Profile>> searchUsers(String query) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.searchUsers(query);
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<List<Profile>> getDeliveryPersons({String? branchId}) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getDeliveryPersons(
        branchId: branchId,
      );
      return models.map((m) => m.toDomain()).toList();
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
  ResultTask<List<Profile>> getCustomersWhoBoughtInBranch(
    String branchId,
  ) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.getByBranch(branchId);
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<Profile> update(Profile profile) {
    return TaskEither.tryCatch(() async {
      final model = ProfileModelX.fromDomain(profile); 
      final updated = await remoteDatasource.updateProfile(model);
      return updated.toDomain();
    }, handleException);
  }

  @override
  ResultTask<Profile> changeStatus({required String id, required bool active}) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.changeStatus(
        id: id,
        active: active,
      );
      return model.toDomain();
    }, handleException);
  }

  @override
  ResultTask<Profile> changeRole({
    required String id,
    required UserRole newRole,
  }) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.changeRole(
        id: id,
        role: newRole.name,
      );
      return model.toDomain();
    }, handleException);
  }
}