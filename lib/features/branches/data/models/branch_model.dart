
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@freezed
sealed class BranchModel with _$BranchModel {
  const factory BranchModel({
    required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'street') required String street,
    @JsonKey(name: 'exterior_number') required String exteriorNumber,
    @JsonKey(name: 'zip_code') required String postalCode,
    @JsonKey(name: 'neighborhood') required String neighborhood,
    @JsonKey(name: 'municipality') required String municipality,
    @JsonKey(name: 'state') required String state,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'is_active') required bool active,
    @JsonKey(name: 'created_at') required DateTime creationDate,
    @JsonKey(name: 'updated_at') DateTime? updateDate,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}

extension BranchModelX on BranchModel {
  Branch toDomain() => Branch(
        id: id,
        name: name,
        street: street,
        exteriorNumber: exteriorNumber,
        postalCode: postalCode,
        neighborhood: neighborhood,
        municipality: municipality,
        state: state,
        latitude: latitude,
        longitude: longitude,
        active: active,
        creationDate: creationDate,
        updateDate: updateDate,
      );

  // De Dominio (Branch) a Data (BranchModel)
  static BranchModel fromDomain(Branch b) => BranchModel(
        id: b.id,
        name: b.name,
        street: b.street,
        exteriorNumber: b.exteriorNumber,
        postalCode: b.postalCode,
        neighborhood: b.neighborhood,
        municipality: b.municipality,
        state: b.state,
        latitude: b.latitude,
        longitude: b.longitude,
        active: b.active,
        creationDate: b.creationDate,
        updateDate: b.updateDate,
      );
}