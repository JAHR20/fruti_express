// lib/features/products/domain/use_cases/get_offers_use_case.dart
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product_offers.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetOffersUseCase {
  final ProductRepository repository;

  GetOffersUseCase({required this.repository});

  /// Ofertas de la sucursal. Con [categoryId] incluye también las subcategorías;
  /// sin él (o si la categoría ya no existe) trae las de todas las categorías.
  ResultTask<ProductOffers> execute(String branchId, {String? categoryId}) {
    final cleanBranchId = branchId.trim();
    final cleanCategoryId = categoryId?.trim();

    return TaskEither.Do(($) async {
      if (cleanBranchId.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(FailureCode.invalidCategoryOrBranchId),
          ),
        );
      }

      return await $(
        repository.getOffers(
          cleanBranchId,
          categoryId: (cleanCategoryId == null || cleanCategoryId.isEmpty)
              ? null
              : cleanCategoryId,
        ),
      );
    });
  }
}