import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String alias,
    required String street,
    @JsonKey(name: 'exterior_number') required String exteriorNumber,
    @JsonKey(name: 'interior_number') String? interiorNumber,
    required String neighborhood,
    @JsonKey(name: 'zip_code') required String zipCode,
    required String municipality,
    required String state,
    @JsonKey(name: 'references_text') String? references,
    @JsonKey(name: 'is_primary') @Default(false) bool isMain,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required double latitude,
    required double longitude,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

extension AddressModelX on AddressModel {
  Address toDomain() => Address(
    id: id,
    userId: userId,
    alias: alias,
    street: street,
    exteriorNumber: exteriorNumber,
    interiorNumber: interiorNumber,
    neighborhood: neighborhood,
    zipCode: zipCode,
    municipality: municipality,
    state: state,
    references: references,
    isMain: isMain,
    createdAt: createdAt,
    updatedAt: updatedAt,
    latitude: latitude,
    longitude: longitude,
  );

  static AddressModel fromDomain(Address d) => AddressModel(
    id: d.id,
    userId: d.userId,
    alias: d.alias,
    street: d.street,
    exteriorNumber: d.exteriorNumber,
    interiorNumber: d.interiorNumber,
    neighborhood: d.neighborhood,
    zipCode: d.zipCode,
    municipality: d.municipality,
    state: d.state,
    references: d.references,
    isMain: d.isMain,
    createdAt: d.createdAt,
    updatedAt: d.updatedAt,
    latitude: d.latitude,
    longitude: d.longitude,
  );
}
