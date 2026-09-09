import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/address.dart'; 

abstract class AddressRepository {
  ResultTask<List<Address>> getByUser(String userId); 
  ResultTask<Address> create(Address address);
  ResultTask<Address> update(Address address); 
  ResultTask<Unit> delete(String id); 
  
  ResultTask<Unit> setAsMain({ 
    required String userId,
    required String addressId,
  });
}