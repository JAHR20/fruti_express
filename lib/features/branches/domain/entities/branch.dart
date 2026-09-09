import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch.freezed.dart';

@freezed
sealed class Branch with _$Branch {
  const factory Branch({
    required String id,
    required String name, 
    required String street, 
    required String exteriorNumber, 
    required String postalCode,
    required String neighborhood, 
    required String municipality, 
    required String state, 
    double? latitude, 
    double? longitude, 
    required bool active, 
    required DateTime creationDate,
    DateTime? updateDate, 
  }) = _Branch;
}