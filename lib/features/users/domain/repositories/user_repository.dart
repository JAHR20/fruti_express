import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

abstract class UserRepository {
  ResultTask<Profile> getById(String id);
  
  ResultTask<List<Profile>> getAll();
  
  ResultTask<List<Profile>> getDeliveryPersons({String? branchId});
  
  ResultTask<int> countActiveAdmins();
  
  ResultTask<bool> managerExistsInBranch(String branchId);
  
  ResultTask<List<Profile>> getCustomersWhoBoughtInBranch(String branchId);
  
  ResultTask<List<Profile>> searchUsers(String query);
  
  ResultTask<Profile> update(Profile profile);
  
  ResultTask<Profile> changeStatus({required String id, required bool active});
  
  ResultTask<Profile> changeRole({
    required String id,
    required UserRole newRole,
  });
}