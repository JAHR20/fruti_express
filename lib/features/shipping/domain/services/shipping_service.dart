import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_quote.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart'; 
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart'; 

abstract class ShippingService { 
  Either<Failure, ShippingQuote> calculateQuote({ 
    required Branch branch, 
    required Address address, 
    required ShippingConfig config, 
    required List<ShippingRate> rates, 
  });

  bool validateCoverage({ 
    required Branch branch,
    required Address address,
    required ShippingConfig config,
  });
}