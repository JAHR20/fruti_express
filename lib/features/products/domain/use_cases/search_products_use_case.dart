import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class SearchProductsUseCase {
  final ProductRepository repository;

  SearchProductsUseCase({required this.repository});
  
  ResultTask<List<Product>> execute(String query, String branchId) {
    final trimmedQuery = query.trim();
    final trimmedBranchId = branchId.trim();

    return TaskEither.Do(($) async {
      if (trimmedQuery.isEmpty || trimmedBranchId.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidSearchParameters)),
        );
      }

      final products = await $(repository.searchProducts(trimmedQuery, trimmedBranchId));

      return products;
    });
  }
}