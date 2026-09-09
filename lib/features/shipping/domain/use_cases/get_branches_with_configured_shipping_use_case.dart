import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';

class GetBranchesWithConfiguredShippingUseCase { // ObtenerSucursalesConEnvioConfiguradoUseCase -> GetBranchesWithConfiguredShippingUseCase
  final ShippingRepository _repository;

  GetBranchesWithConfiguredShippingUseCase(this._repository);

  ResultTask<Set<String>> execute() {
    return _repository.getBranchesWithConfiguredShipping();
  }
}