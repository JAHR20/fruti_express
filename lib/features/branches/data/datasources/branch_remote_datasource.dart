import 'package:fruti_express_jahr_admin/features/branches/data/models/branch_model.dart';

abstract class BranchRemoteDatasource {
  Future<List<BranchModel>> getAll();
  Future<BranchModel?> getById(String id);
  Future<BranchModel> create(BranchModel model);
  Future<BranchModel> update(BranchModel model);
  Future<BranchModel?> getByName(String name);
  Stream<List<BranchModel>> watchAll();
  Future<List<String>> getCoverage(String branchId);
  Future<void> updateCoverage({
    required String branchId,
    required List<String> postalCodes,
  });
  Future<BranchModel?> getByPostalCode(String postalCode);
}