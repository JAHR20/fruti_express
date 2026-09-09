import 'package:freezed_annotation/freezed_annotation.dart';

part 'postal_location.freezed.dart';

@freezed
sealed class PostalLocation with _$PostalLocation {
  const factory PostalLocation({
    required String postalCode,
    required String state,
    required String municipality,
    @Default([]) List<String> availablePostalCodes, 
    @Default({}) Map<String, List<String>> neighborhoodsByPostalCode, 
  }) = _PostalLocation;
}