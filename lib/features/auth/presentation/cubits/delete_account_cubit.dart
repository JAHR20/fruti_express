// lib/features/auth/presentation/cubits/delete_account_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/delete_account_use_case.dart';
import 'delete_account_state.dart';

/// Estado propio de la eliminación de cuenta. Va aparte de AuthCubit para que,
/// si falla, el usuario siga con su sesión y no lo saque de la pantalla.
class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase _deleteAccountUseCase;

  DeleteAccountCubit({required DeleteAccountUseCase deleteAccountUseCase})
    : _deleteAccountUseCase = deleteAccountUseCase,
      super(const DeleteAccountState.idle());

  Future<void> deleteAccount() async {
    final alreadyDeleting = state.maybeWhen(
      deleting: () => true,
      orElse: () => false,
    );
    if (alreadyDeleting) return;

    emit(const DeleteAccountState.deleting());

    final result = await _deleteAccountUseCase().run();

    if (isClosed) return;

    result.fold(
      (failure) => emit(DeleteAccountState.error(translateFailure(failure))),
      (_) => emit(const DeleteAccountState.deleted()),
    );
  }

  void clearError() => emit(const DeleteAccountState.idle());
}