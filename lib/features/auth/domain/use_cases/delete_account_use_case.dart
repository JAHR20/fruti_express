// lib/features/auth/domain/use_cases/delete_account_use_case.dart
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';

/// Elimina la cuenta del usuario con sesión iniciada.
/// El servidor decide si se puede (por ejemplo, no con pedidos en curso).
class DeleteAccountUseCase {
  final AuthRepository _repository;

  DeleteAccountUseCase(this._repository);

  ResultTask<Unit> call() => _repository.deleteAccount();
}