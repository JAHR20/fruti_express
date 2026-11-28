// lib/features/users/presentation/widgets/delete_account_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/delete_account_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/delete_account_state.dart';

/// "Eliminar mi cuenta" para el perfil del cliente. Trae su propio cubit, así
/// que no hace falta tocar rutas ni proveedores.
class DeleteAccountSection extends StatelessWidget {
  const DeleteAccountSection({super.key});

  Future<bool> _confirm(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => const _ConfirmDeleteDialog(),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => sl<DeleteAccountCubit>(),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) {
          state.whenOrNull(
            deleted: () {
              // La cuenta ya no existe: se cierra la sesión local.
              context.read<AuthCubit>().logout();
            },
            error: (message) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: TextStyle(color: colors.onError),
                  ),
                  backgroundColor: colors.error,
                ),
              );
              context.read<DeleteAccountCubit>().clearError();
            },
          );
        },
        builder: (context, state) {
          final isDeleting = state.maybeWhen(
            deleting: () => true,
            orElse: () => false,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Zona de riesgo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.error,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Si eliminas tu cuenta, no podrás recuperarla.',
                style: TextStyle(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.error,
                  side: BorderSide(color: colors.error),
                ),
                onPressed: isDeleting
                    ? null
                    : () async {
                        final cubit = context.read<DeleteAccountCubit>();
                        final confirmed = await _confirm(context);
                        if (confirmed) cubit.deleteAccount();
                      },
                icon: isDeleting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.delete_forever_outlined),
                label: Text(isDeleting ? 'Eliminando…' : 'Eliminar mi cuenta'),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Diálogo de confirmación. Es un StatefulWidget propio para que él mismo
/// cree y destruya su controlador: si se destruyera desde fuera al cerrar el
/// diálogo, el campo de texto lo seguiría usando durante la animación de salida.
class _ConfirmDeleteDialog extends StatefulWidget {
  const _ConfirmDeleteDialog();

  @override
  State<_ConfirmDeleteDialog> createState() => _ConfirmDeleteDialogState();
}

class _ConfirmDeleteDialogState extends State<_ConfirmDeleteDialog> {
  static const _confirmWord = 'ELIMINAR';

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _matches => _controller.text.trim().toUpperCase() == _confirmWord;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      title: const Text('Eliminar mi cuenta'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Se eliminarán tu cuenta y tus direcciones guardadas. '
            'Tus pedidos anteriores se conservan sin tus datos personales.\n\n'
            'Esta acción no se puede deshacer.',
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
              labelText: 'Escribe $_confirmWord para confirmar',
            ),
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: colors.error),
          onPressed: _matches ? () => Navigator.pop(context, true) : null,
          child: Text('Eliminar', style: TextStyle(color: colors.onError)),
        ),
      ],
    );
  }
}