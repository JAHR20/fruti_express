import 'package:flutter/material.dart';

class AnimatedEmptyState extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const AnimatedEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.actionText,
    this.onActionPressed,
  });

  @override
  State<AnimatedEmptyState> createState() => _AnimatedEmptyStateState();
}

class _AnimatedEmptyStateState extends State<AnimatedEmptyState>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.elasticOut,
              builder: (context, scaleValue, child) {
                return Transform.scale(scale: scaleValue, child: child);
              },
              child: AnimatedBuilder(
                animation: _floatAnimation,
                builder: (context, child) {
                  final floatOffset = _floatAnimation.value * -15.0;
                  final shadowWidth = 60.0 - (_floatAnimation.value * 20.0);
                  final shadowOpacity = 0.2 - (_floatAnimation.value * 0.1);

                  return Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0, floatOffset),
                        child: Container(
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: IconTheme(
                            data: IconThemeData(
                              color: colorScheme.primary,
                              size: 60,
                            ),
                            child: widget.icon,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 8,
                        width: shadowWidth,
                        decoration: BoxDecoration(
                          color: colorScheme.shadow.withValues(alpha: shadowOpacity), // 👈 de paso, el fix de Colors.black que vimos antes
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            if (widget.actionText != null && widget.onActionPressed != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: widget.onActionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  widget.actionText!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}