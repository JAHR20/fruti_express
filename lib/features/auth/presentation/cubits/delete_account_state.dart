// lib/features/auth/presentation/cubits/delete_account_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.freezed.dart';

@freezed
abstract class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.idle() = _Idle;
  const factory DeleteAccountState.deleting() = _Deleting;
  const factory DeleteAccountState.deleted() = _Deleted;
  const factory DeleteAccountState.error(String message) = _Error;
}