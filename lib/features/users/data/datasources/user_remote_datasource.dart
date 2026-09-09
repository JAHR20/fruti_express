import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart';

abstract class UserRemoteDatasource {
  Future<List<ProfileModel>> getAll();
  Future<List<ProfileModel>> getByBranch(String branchId);
  Future<ProfileModel?> getById(String id);
  Future<List<ProfileModel>> searchUsers(String query);
  Future<List<ProfileModel>> getDeliveryPersons({String? branchId});
  Future<ProfileModel> changeRole({required String id, required String role});
  Future<ProfileModel> changeStatus({required String id, required bool active});
  Future<int> countByRoleAndStatus({required String role, required bool active});
  Future<bool> managerExistsInBranch(String branchId);
  Future<ProfileModel> updateProfile(ProfileModel model);
}