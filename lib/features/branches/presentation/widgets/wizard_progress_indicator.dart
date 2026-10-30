import 'package:flutter/material.dart';

class WizardStepInfo {
  final String title;
  final IconData icon;

  const WizardStepInfo({
    required this.title,
    required this.icon,
  });
}

class WizardProgressIndicator extends StatelessWidget {
  final List<WizardStepInfo> steps;
  final int currentStep;

  const WizardProgressIndicator({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < steps.length; i++) ...[
            _PillStep(
              title: steps[i].title,
              stepIcon: steps[i].icon,
              isActive: currentStep == i,
              isCompleted: currentStep > i,
            ),
            if (i != steps.length - 1) ...[
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: currentStep > i
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ],
        ],
      ),
    );
  }
}

class _PillStep extends StatelessWidget {
  final String title;
  final IconData stepIcon;
  final bool isActive;
  final bool isCompleted;

  const _PillStep({
    required this.title,
    required this.stepIcon,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color backgroundColor;
    final Color foregroundColor;
    final Color borderColor;

    if (isActive) {
      // Paso actual
      backgroundColor = colorScheme.primaryFixedDim;
      foregroundColor = colorScheme.onPrimaryFixed;
      borderColor = colorScheme.primary;
    } else if (isCompleted) {
      // Paso terminado
      backgroundColor = colorScheme.primaryContainer;
      foregroundColor = colorScheme.onPrimaryContainer;
      borderColor = colorScheme.primary;
    } else {
      // Paso pendiente
      backgroundColor = colorScheme.surface;
      foregroundColor = colorScheme.onSurfaceVariant;
      borderColor = colorScheme.outlineVariant;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: isActive ? 20 : 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              isCompleted
                  ? Icons.check_circle_rounded
                  : stepIcon,
              key: ValueKey(isCompleted),
              color: foregroundColor,
              size: 20,
            ),
          ),
          if (isActive) ...[
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}