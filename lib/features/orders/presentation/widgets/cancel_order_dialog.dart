import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/cancellation_reason.dart';

typedef CancelOrderChoice = ({CancellationReason reason, String? note});

Future<CancelOrderChoice?> showCancelOrderDialog(BuildContext context) {
  return showDialog<CancelOrderChoice>(
    context: context,
    builder: (_) => const _CancelOrderDialog(),
  );
}

class _CancelOrderDialog extends StatefulWidget {
  const _CancelOrderDialog();

  @override
  State<_CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<_CancelOrderDialog> {
  CancellationReason? _reason;
  final _noteCtrl = TextEditingController();

  @override
  void dispose() {
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cancelar pedido'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'El pedido se cancelará y el producto regresará al inventario. '
              'Esta acción no se puede deshacer.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: CancellationReason.values
                  .map(
                    (r) => ChoiceChip(
                      label: Text(r.label),
                      selected: _reason == r,
                      onSelected: (_) => setState(() => _reason = r),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _noteCtrl,
              maxLength: 200,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Nota (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Volver'),
        ),
        FilledButton(
          onPressed: _reason == null
              ? null
              : () {
                  final note = _noteCtrl.text.trim();
                  Navigator.of(context).pop((
                    reason: _reason!,
                    note: note.isEmpty ? null : note,
                  ));
                },
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Cancelar pedido'),
        ),
      ],
    );
  }
}