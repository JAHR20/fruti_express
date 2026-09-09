import 'package:fruti_express_jahr_admin/features/addresses/data/models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getByUser(String userId);
  
  Future<AddressModel> create(AddressModel model);
  
  Future<AddressModel> update(AddressModel model);
  
  Future<void> delete(String id);
  
  Future<void> setAsMain(String userId, String addressId);
}