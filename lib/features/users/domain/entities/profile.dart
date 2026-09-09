import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

part 'profile.freezed.dart';
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    required String email,
    required bool active,
    String? phone,
    required UserRole role,
    String? branchId,
    String? avatarUrl,
    required DateTime creationDate,
  }) = _Profile;
}

extension ProfileFormatX on Profile {
  String get fullNameSnapshot {
    final maternal = maternalLastName != null ? ' $maternalLastName' : '';
    return '$firstName $paternalLastName$maternal'.trim();
  }
}

extension AddressFormatX on Address {
  String get formattedSnapshot {
    final interior = (interiorNumber != null && interiorNumber!.isNotEmpty)
        ? ' Apt. $interiorNumber' 
        : '';
    return '$street #$exteriorNumber$interior, $neighborhood, Zip Code $zipCode';
  }
}