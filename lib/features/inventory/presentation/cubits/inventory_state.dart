import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default([]) List<Inventory> inventory, 
    @Default(false) bool isLoading,
    String? processingProductId, 
    String? errorMessage,
    String? operationError, 
    @Default(false) bool operationSuccessful, 
    String? branchId, 
  }) = _InventoryState;
}