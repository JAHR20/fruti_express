import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase({required this.repository});

  ResultTask<List<Product>> execute(String categoryId, String branchId) {
    final cleanCategoryId = categoryId.trim();
    final cleanBranchId = branchId.trim();

    return TaskEither.Do(($) async {
      if (cleanCategoryId.isEmpty || cleanBranchId.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidCategoryOrBranchId)),
        );
      }

      final products = await $(repository.getByCategory(cleanCategoryId, cleanBranchId));
      return products;
    });
  }
}