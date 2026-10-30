import 'dart:async';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class WatchInventoryChangesUseCase {
  final ProductRepository _repository;

  WatchInventoryChangesUseCase({required ProductRepository repository})
      : _repository = repository;

  Stream<void> execute(String branchId) {
    return _repository.watchInventoryChanges(branchId);
  }
}
