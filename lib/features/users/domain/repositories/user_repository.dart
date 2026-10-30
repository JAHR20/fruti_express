import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

abstract class UserRepository {
  ResultTask<AppUser> getById(String id);
  
  ResultTask<List<AppUser>> getAll();
  
  ResultTask<List<AppUser>> getDeliveryPersons({String? branchId});
  
  ResultTask<int> countActiveAdmins();
  
  ResultTask<bool> managerExistsInBranch(String branchId);
  
  ResultTask<List<AppUser>> getCustomersWhoBoughtInBranch(String branchId);
  
  ResultTask<List<AppUser>> searchUsers(String query);
  
  ResultTask<UserProfile> update(UserProfile profile);
  
  ResultTask<AppUser> changeStatus({required String id, required bool active});
  
  ResultTask<AppUser> changeRole({
    required String id,
    required UserRole newRole,
    required String? branchId,
  });
}