import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String id,
    required String userId, 
    required String alias,
    required String street, 
    required String exteriorNumber,
    String? interiorNumber, 
    required String neighborhood,
    required String zipCode, 
    required String municipality,
    required String state, 
    String? references, 
    @Default(false) bool isMain, 
    required DateTime createdAt, 
    DateTime? updatedAt, 
    required double latitude, 
    required double longitude, 
  }) = _Address;
}