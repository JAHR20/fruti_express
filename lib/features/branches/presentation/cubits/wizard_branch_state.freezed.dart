// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard_branch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WizardBranchState {

 int get currentStep; String get name; String get street; String get exteriorNumber; String get postalCode; String? get neighborhood; String? get state; String? get municipality; double? get latitude; double? get longitude; List<String> get availablePostalCodes; List<String> get selectedPostalCodes; Map<String, List<String>> get neighborhoodsByPostalCode; ShippingConfig? get shippingConfig; bool get isSearchingLocation; bool get isSaving; bool get isLoadingConfig; String? get errorMessage; bool get isSaveSuccessful; bool get isStep1Completed; String? get createdBranchId;
/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WizardBranchStateCopyWith<WizardBranchState> get copyWith => _$WizardBranchStateCopyWithImpl<WizardBranchState>(this as WizardBranchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WizardBranchState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.state, state) || other.state == state)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.availablePostalCodes, availablePostalCodes)&&const DeepCollectionEquality().equals(other.selectedPostalCodes, selectedPostalCodes)&&const DeepCollectionEquality().equals(other.neighborhoodsByPostalCode, neighborhoodsByPostalCode)&&(identical(other.shippingConfig, shippingConfig) || other.shippingConfig == shippingConfig)&&(identical(other.isSearchingLocation, isSearchingLocation) || other.isSearchingLocation == isSearchingLocation)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isLoadingConfig, isLoadingConfig) || other.isLoadingConfig == isLoadingConfig)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSaveSuccessful, isSaveSuccessful) || other.isSaveSuccessful == isSaveSuccessful)&&(identical(other.isStep1Completed, isStep1Completed) || other.isStep1Completed == isStep1Completed)&&(identical(other.createdBranchId, createdBranchId) || other.createdBranchId == createdBranchId));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,name,street,exteriorNumber,postalCode,neighborhood,state,municipality,latitude,longitude,const DeepCollectionEquality().hash(availablePostalCodes),const DeepCollectionEquality().hash(selectedPostalCodes),const DeepCollectionEquality().hash(neighborhoodsByPostalCode),shippingConfig,isSearchingLocation,isSaving,isLoadingConfig,errorMessage,isSaveSuccessful,isStep1Completed,createdBranchId]);

@override
String toString() {
  return 'WizardBranchState(currentStep: $currentStep, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, state: $state, municipality: $municipality, latitude: $latitude, longitude: $longitude, availablePostalCodes: $availablePostalCodes, selectedPostalCodes: $selectedPostalCodes, neighborhoodsByPostalCode: $neighborhoodsByPostalCode, shippingConfig: $shippingConfig, isSearchingLocation: $isSearchingLocation, isSaving: $isSaving, isLoadingConfig: $isLoadingConfig, errorMessage: $errorMessage, isSaveSuccessful: $isSaveSuccessful, isStep1Completed: $isStep1Completed, createdBranchId: $createdBranchId)';
}


}

/// @nodoc
abstract mixin class $WizardBranchStateCopyWith<$Res>  {
  factory $WizardBranchStateCopyWith(WizardBranchState value, $Res Function(WizardBranchState) _then) = _$WizardBranchStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, String name, String street, String exteriorNumber, String postalCode, String? neighborhood, String? state, String? municipality, double? latitude, double? longitude, List<String> availablePostalCodes, List<String> selectedPostalCodes, Map<String, List<String>> neighborhoodsByPostalCode, ShippingConfig? shippingConfig, bool isSearchingLocation, bool isSaving, bool isLoadingConfig, String? errorMessage, bool isSaveSuccessful, bool isStep1Completed, String? createdBranchId
});


$ShippingConfigCopyWith<$Res>? get shippingConfig;

}
/// @nodoc
class _$WizardBranchStateCopyWithImpl<$Res>
    implements $WizardBranchStateCopyWith<$Res> {
  _$WizardBranchStateCopyWithImpl(this._self, this._then);

  final WizardBranchState _self;
  final $Res Function(WizardBranchState) _then;

/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? name = null,Object? street = null,Object? exteriorNumber = null,Object? postalCode = null,Object? neighborhood = freezed,Object? state = freezed,Object? municipality = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? availablePostalCodes = null,Object? selectedPostalCodes = null,Object? neighborhoodsByPostalCode = null,Object? shippingConfig = freezed,Object? isSearchingLocation = null,Object? isSaving = null,Object? isLoadingConfig = null,Object? errorMessage = freezed,Object? isSaveSuccessful = null,Object? isStep1Completed = null,Object? createdBranchId = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,municipality: freezed == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,availablePostalCodes: null == availablePostalCodes ? _self.availablePostalCodes : availablePostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPostalCodes: null == selectedPostalCodes ? _self.selectedPostalCodes : selectedPostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,neighborhoodsByPostalCode: null == neighborhoodsByPostalCode ? _self.neighborhoodsByPostalCode : neighborhoodsByPostalCode // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,shippingConfig: freezed == shippingConfig ? _self.shippingConfig : shippingConfig // ignore: cast_nullable_to_non_nullable
as ShippingConfig?,isSearchingLocation: null == isSearchingLocation ? _self.isSearchingLocation : isSearchingLocation // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isLoadingConfig: null == isLoadingConfig ? _self.isLoadingConfig : isLoadingConfig // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaveSuccessful: null == isSaveSuccessful ? _self.isSaveSuccessful : isSaveSuccessful // ignore: cast_nullable_to_non_nullable
as bool,isStep1Completed: null == isStep1Completed ? _self.isStep1Completed : isStep1Completed // ignore: cast_nullable_to_non_nullable
as bool,createdBranchId: freezed == createdBranchId ? _self.createdBranchId : createdBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingConfigCopyWith<$Res>? get shippingConfig {
    if (_self.shippingConfig == null) {
    return null;
  }

  return $ShippingConfigCopyWith<$Res>(_self.shippingConfig!, (value) {
    return _then(_self.copyWith(shippingConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [WizardBranchState].
extension WizardBranchStatePatterns on WizardBranchState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WizardBranchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WizardBranchState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WizardBranchState value)  $default,){
final _that = this;
switch (_that) {
case _WizardBranchState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WizardBranchState value)?  $default,){
final _that = this;
switch (_that) {
case _WizardBranchState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  String name,  String street,  String exteriorNumber,  String postalCode,  String? neighborhood,  String? state,  String? municipality,  double? latitude,  double? longitude,  List<String> availablePostalCodes,  List<String> selectedPostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode,  ShippingConfig? shippingConfig,  bool isSearchingLocation,  bool isSaving,  bool isLoadingConfig,  String? errorMessage,  bool isSaveSuccessful,  bool isStep1Completed,  String? createdBranchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WizardBranchState() when $default != null:
return $default(_that.currentStep,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.state,_that.municipality,_that.latitude,_that.longitude,_that.availablePostalCodes,_that.selectedPostalCodes,_that.neighborhoodsByPostalCode,_that.shippingConfig,_that.isSearchingLocation,_that.isSaving,_that.isLoadingConfig,_that.errorMessage,_that.isSaveSuccessful,_that.isStep1Completed,_that.createdBranchId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  String name,  String street,  String exteriorNumber,  String postalCode,  String? neighborhood,  String? state,  String? municipality,  double? latitude,  double? longitude,  List<String> availablePostalCodes,  List<String> selectedPostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode,  ShippingConfig? shippingConfig,  bool isSearchingLocation,  bool isSaving,  bool isLoadingConfig,  String? errorMessage,  bool isSaveSuccessful,  bool isStep1Completed,  String? createdBranchId)  $default,) {final _that = this;
switch (_that) {
case _WizardBranchState():
return $default(_that.currentStep,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.state,_that.municipality,_that.latitude,_that.longitude,_that.availablePostalCodes,_that.selectedPostalCodes,_that.neighborhoodsByPostalCode,_that.shippingConfig,_that.isSearchingLocation,_that.isSaving,_that.isLoadingConfig,_that.errorMessage,_that.isSaveSuccessful,_that.isStep1Completed,_that.createdBranchId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  String name,  String street,  String exteriorNumber,  String postalCode,  String? neighborhood,  String? state,  String? municipality,  double? latitude,  double? longitude,  List<String> availablePostalCodes,  List<String> selectedPostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode,  ShippingConfig? shippingConfig,  bool isSearchingLocation,  bool isSaving,  bool isLoadingConfig,  String? errorMessage,  bool isSaveSuccessful,  bool isStep1Completed,  String? createdBranchId)?  $default,) {final _that = this;
switch (_that) {
case _WizardBranchState() when $default != null:
return $default(_that.currentStep,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.state,_that.municipality,_that.latitude,_that.longitude,_that.availablePostalCodes,_that.selectedPostalCodes,_that.neighborhoodsByPostalCode,_that.shippingConfig,_that.isSearchingLocation,_that.isSaving,_that.isLoadingConfig,_that.errorMessage,_that.isSaveSuccessful,_that.isStep1Completed,_that.createdBranchId);case _:
  return null;

}
}

}

/// @nodoc


class _WizardBranchState implements WizardBranchState {
  const _WizardBranchState({this.currentStep = 0, this.name = '', this.street = '', this.exteriorNumber = '', this.postalCode = '', this.neighborhood, this.state, this.municipality, this.latitude, this.longitude, final  List<String> availablePostalCodes = const <String>[], final  List<String> selectedPostalCodes = const <String>[], final  Map<String, List<String>> neighborhoodsByPostalCode = const <String, List<String>>{}, this.shippingConfig, this.isSearchingLocation = false, this.isSaving = false, this.isLoadingConfig = false, this.errorMessage, this.isSaveSuccessful = false, this.isStep1Completed = false, this.createdBranchId}): _availablePostalCodes = availablePostalCodes,_selectedPostalCodes = selectedPostalCodes,_neighborhoodsByPostalCode = neighborhoodsByPostalCode;
  

@override@JsonKey() final  int currentStep;
@override@JsonKey() final  String name;
@override@JsonKey() final  String street;
@override@JsonKey() final  String exteriorNumber;
@override@JsonKey() final  String postalCode;
@override final  String? neighborhood;
@override final  String? state;
@override final  String? municipality;
@override final  double? latitude;
@override final  double? longitude;
 final  List<String> _availablePostalCodes;
@override@JsonKey() List<String> get availablePostalCodes {
  if (_availablePostalCodes is EqualUnmodifiableListView) return _availablePostalCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availablePostalCodes);
}

 final  List<String> _selectedPostalCodes;
@override@JsonKey() List<String> get selectedPostalCodes {
  if (_selectedPostalCodes is EqualUnmodifiableListView) return _selectedPostalCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedPostalCodes);
}

 final  Map<String, List<String>> _neighborhoodsByPostalCode;
@override@JsonKey() Map<String, List<String>> get neighborhoodsByPostalCode {
  if (_neighborhoodsByPostalCode is EqualUnmodifiableMapView) return _neighborhoodsByPostalCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_neighborhoodsByPostalCode);
}

@override final  ShippingConfig? shippingConfig;
@override@JsonKey() final  bool isSearchingLocation;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isLoadingConfig;
@override final  String? errorMessage;
@override@JsonKey() final  bool isSaveSuccessful;
@override@JsonKey() final  bool isStep1Completed;
@override final  String? createdBranchId;

/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WizardBranchStateCopyWith<_WizardBranchState> get copyWith => __$WizardBranchStateCopyWithImpl<_WizardBranchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WizardBranchState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.state, state) || other.state == state)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._availablePostalCodes, _availablePostalCodes)&&const DeepCollectionEquality().equals(other._selectedPostalCodes, _selectedPostalCodes)&&const DeepCollectionEquality().equals(other._neighborhoodsByPostalCode, _neighborhoodsByPostalCode)&&(identical(other.shippingConfig, shippingConfig) || other.shippingConfig == shippingConfig)&&(identical(other.isSearchingLocation, isSearchingLocation) || other.isSearchingLocation == isSearchingLocation)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isLoadingConfig, isLoadingConfig) || other.isLoadingConfig == isLoadingConfig)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSaveSuccessful, isSaveSuccessful) || other.isSaveSuccessful == isSaveSuccessful)&&(identical(other.isStep1Completed, isStep1Completed) || other.isStep1Completed == isStep1Completed)&&(identical(other.createdBranchId, createdBranchId) || other.createdBranchId == createdBranchId));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,name,street,exteriorNumber,postalCode,neighborhood,state,municipality,latitude,longitude,const DeepCollectionEquality().hash(_availablePostalCodes),const DeepCollectionEquality().hash(_selectedPostalCodes),const DeepCollectionEquality().hash(_neighborhoodsByPostalCode),shippingConfig,isSearchingLocation,isSaving,isLoadingConfig,errorMessage,isSaveSuccessful,isStep1Completed,createdBranchId]);

@override
String toString() {
  return 'WizardBranchState(currentStep: $currentStep, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, state: $state, municipality: $municipality, latitude: $latitude, longitude: $longitude, availablePostalCodes: $availablePostalCodes, selectedPostalCodes: $selectedPostalCodes, neighborhoodsByPostalCode: $neighborhoodsByPostalCode, shippingConfig: $shippingConfig, isSearchingLocation: $isSearchingLocation, isSaving: $isSaving, isLoadingConfig: $isLoadingConfig, errorMessage: $errorMessage, isSaveSuccessful: $isSaveSuccessful, isStep1Completed: $isStep1Completed, createdBranchId: $createdBranchId)';
}


}

/// @nodoc
abstract mixin class _$WizardBranchStateCopyWith<$Res> implements $WizardBranchStateCopyWith<$Res> {
  factory _$WizardBranchStateCopyWith(_WizardBranchState value, $Res Function(_WizardBranchState) _then) = __$WizardBranchStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, String name, String street, String exteriorNumber, String postalCode, String? neighborhood, String? state, String? municipality, double? latitude, double? longitude, List<String> availablePostalCodes, List<String> selectedPostalCodes, Map<String, List<String>> neighborhoodsByPostalCode, ShippingConfig? shippingConfig, bool isSearchingLocation, bool isSaving, bool isLoadingConfig, String? errorMessage, bool isSaveSuccessful, bool isStep1Completed, String? createdBranchId
});


@override $ShippingConfigCopyWith<$Res>? get shippingConfig;

}
/// @nodoc
class __$WizardBranchStateCopyWithImpl<$Res>
    implements _$WizardBranchStateCopyWith<$Res> {
  __$WizardBranchStateCopyWithImpl(this._self, this._then);

  final _WizardBranchState _self;
  final $Res Function(_WizardBranchState) _then;

/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? name = null,Object? street = null,Object? exteriorNumber = null,Object? postalCode = null,Object? neighborhood = freezed,Object? state = freezed,Object? municipality = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? availablePostalCodes = null,Object? selectedPostalCodes = null,Object? neighborhoodsByPostalCode = null,Object? shippingConfig = freezed,Object? isSearchingLocation = null,Object? isSaving = null,Object? isLoadingConfig = null,Object? errorMessage = freezed,Object? isSaveSuccessful = null,Object? isStep1Completed = null,Object? createdBranchId = freezed,}) {
  return _then(_WizardBranchState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,municipality: freezed == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,availablePostalCodes: null == availablePostalCodes ? _self._availablePostalCodes : availablePostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPostalCodes: null == selectedPostalCodes ? _self._selectedPostalCodes : selectedPostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,neighborhoodsByPostalCode: null == neighborhoodsByPostalCode ? _self._neighborhoodsByPostalCode : neighborhoodsByPostalCode // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,shippingConfig: freezed == shippingConfig ? _self.shippingConfig : shippingConfig // ignore: cast_nullable_to_non_nullable
as ShippingConfig?,isSearchingLocation: null == isSearchingLocation ? _self.isSearchingLocation : isSearchingLocation // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isLoadingConfig: null == isLoadingConfig ? _self.isLoadingConfig : isLoadingConfig // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaveSuccessful: null == isSaveSuccessful ? _self.isSaveSuccessful : isSaveSuccessful // ignore: cast_nullable_to_non_nullable
as bool,isStep1Completed: null == isStep1Completed ? _self.isStep1Completed : isStep1Completed // ignore: cast_nullable_to_non_nullable
as bool,createdBranchId: freezed == createdBranchId ? _self.createdBranchId : createdBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WizardBranchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingConfigCopyWith<$Res>? get shippingConfig {
    if (_self.shippingConfig == null) {
    return null;
  }

  return $ShippingConfigCopyWith<$Res>(_self.shippingConfig!, (value) {
    return _then(_self.copyWith(shippingConfig: value));
  });
}
}

// dart format on
