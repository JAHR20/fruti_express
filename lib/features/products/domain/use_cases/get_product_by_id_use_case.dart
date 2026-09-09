import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase({required this.repository});

  ResultTask<Product> execute(String id) {
    final cleanId = id.trim();

    return TaskEither.Do(($) async {
      if (cleanId.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidProductId)),
        );
      }

      final product = await $(repository.getById(cleanId));
      return product;
    });
  }
}