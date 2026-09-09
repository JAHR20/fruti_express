import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase({required this.repository});

  ResultTask<List<Product>> execute() {
    return TaskEither.Do(($) async {
      final products = await $(repository.getAll());
      return products;
    });
  }
}