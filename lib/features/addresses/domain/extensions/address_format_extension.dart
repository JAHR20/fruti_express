// features/addresses/domain/extensions/address_format_extension.dart
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

extension AddressFormatX on Address {
  String get formattedSnapshot {
    final interior = interiorNumber != null && interiorNumber!.isNotEmpty
        ? ' Int. $interiorNumber'
        : '';
    final refs = references != null && references!.isNotEmpty
        ? ' (Ref: $references)'
        : '';
    return '$alias: $street #$exteriorNumber$interior, $neighborhood, '
        '$municipality, $state, C.P. $zipCode$refs';
  }
}