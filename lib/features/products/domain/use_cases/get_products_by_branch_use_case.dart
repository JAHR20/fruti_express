import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetProductsByBranchUseCase {
  final ProductRepository repository;

  GetProductsByBranchUseCase({required this.repository});

  ResultTask<List<Product>> execute(String branchId) {
    final cleanBranchId = branchId.trim();

    return TaskEither.Do(($) async {
      if (cleanBranchId.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidBranchId)),
        );
      }

      final products = await $(repository.getByBranch(cleanBranchId));
      return products;
    });
  }
}