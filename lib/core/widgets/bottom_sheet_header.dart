import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final bool isDisabled;

  const BottomSheetHeader({super.key, required this.title, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; 

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: colors.primary, 
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: colors.onSurfaceVariant), 
          onPressed: isDisabled ? null : () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}