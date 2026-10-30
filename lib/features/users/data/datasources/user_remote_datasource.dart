import 'package:fruti_express_jahr_admin/features/users/data/models/app_user_model.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/user_profile_model.dart';

abstract class UserRemoteDatasource {
  Future<List<AppUserModel>> getAll();
  Future<List<AppUserModel>> getByBranch(String branchId);
  Future<AppUserModel?> getById(String id);
  Future<List<AppUserModel>> searchUsers(String query);
  Future<List<AppUserModel>> getDeliveryPersons({String? branchId});
  Future<AppUserModel> changeRole({
    required String id,
    required String role,
    String? branchId,
  });
  Future<AppUserModel> changeStatus({required String id, required bool active});
  Future<int> countByRoleAndStatus({
    required String role,
    required bool active,
  });
  Future<bool> managerExistsInBranch(String branchId);
  Future<UserProfileModel> updateProfile(UserProfileModel model);
}
