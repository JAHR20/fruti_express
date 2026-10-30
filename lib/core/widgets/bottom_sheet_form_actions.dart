import 'package:flutter/material.dart';

class BottomSheetFormActions extends StatelessWidget {
  final bool isSaving;
  final String saveLabel;
  final VoidCallback onSave;

  const BottomSheetFormActions({
    super.key,
    required this.isSaving,
    this.saveLabel = 'Guardar',
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; 

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: isSaving ? null : () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              'Cancelar', 
              style: TextStyle(color: colors.onSurface),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: isSaving ? null : onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary, 
              foregroundColor: colors.onPrimary, 
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: isSaving
                ? SizedBox(
                    height: 20, width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2, 
                      color: colors.onPrimary, 
                    ),
                  )
                : Text(
                    saveLabel, 
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}