import 'package:flutter/material.dart';

class WizardStepCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry innerPadding;

  const WizardStepCard({
    super.key,
    required this.child,
    this.innerPadding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: innerPadding,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}