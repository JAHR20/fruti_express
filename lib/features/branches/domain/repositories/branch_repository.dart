import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart'; 

abstract class BranchRepository {
  ResultTask<Branch> create(Branch branch);
  
  ResultTask<Branch> update(Branch branch);
  
  ResultTask<List<String>> getCoverage(String branchId);
  
  ResultTask<Unit> updateCoverage({
    required String branchId,
    required List<String> postalCodes,
  });
  
  ResultTask<Branch?> getById(String id);
  
  ResultTask<List<Branch>> getAll();
  
  ResultTask<Branch?> getByName(String name);
  
  ResultStream<List<Branch>> watchAll();
  
  ResultTask<Branch?> getByPostalCode(String postalCode);
}