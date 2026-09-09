import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetProductByNameUseCase {
  final ProductRepository repository;

  GetProductByNameUseCase({required this.repository});

  ResultTask<Product> execute(String name) {
    final trimmedName = name.trim();

    return TaskEither.Do(($) async {
      if (trimmedName.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidProductName)),
        );
      }

      final product = await $(repository.getByName(trimmedName));
      return product;
    });
  }
}