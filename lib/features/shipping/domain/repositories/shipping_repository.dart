import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

abstract class ShippingRepository { 
  ResultTask<ShippingConfig?> getConfig(String branchId); 
  
  ResultTask<Unit> saveConfig(ShippingConfig config); 
  
  ResultTask<List<ShippingRate>> getRates(String branchId); 
  
  ResultTask<Set<String>> getBranchesWithConfiguredShipping(); 
  
  ResultTask<Unit> saveRate(ShippingRate rate); 
  
  ResultTask<Unit> deleteRate(String rateId);
}