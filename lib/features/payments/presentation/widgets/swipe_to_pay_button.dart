import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';

class SwipeToPayButton extends StatefulWidget {
  final bool isBusy;
  final bool enabled;
  final VoidCallback onSwipeCompleted;

  const SwipeToPayButton({
    super.key,
    required this.isBusy,
    required this.enabled,
    required this.onSwipeCompleted,
  });

  @override
  State<SwipeToPayButton> createState() => _SwipeToPayButtonState();
}

class _SwipeToPayButtonState extends State<SwipeToPayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  double _dragValue = 0.0;
  double _maxDrag = 0.0;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {
          _dragValue = _animController.value * _maxDrag;
        });
      });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _resetSlider() {
    _animController.animateTo(0.0, curve: Curves.easeOutCubic);
  }

  void _completeSlider() {
    _animController.animateTo(1.0, curve: Curves.easeOut).then((_) {
      widget.onSwipeCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final total = state.orderPreview?.total ?? 0;
        final formattedTotal = CurrencyFormatter.format(total);

        if (widget.isBusy) {
          return Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colorScheme.primary,
                ),
              ),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            const handleSize = 48.0;
            const padding = 4.0;
            _maxDrag = maxWidth - handleSize - (padding * 2);

            return Opacity(
              opacity: widget.enabled ? 1.0 : 0.4,
              child: Container(
                height: 56,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: _dragValue + handleSize + (padding * 2),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Desliza para pagar',
                            style: TextStyle(
                              color: _dragValue > (_maxDrag * 0.4)
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formattedTotal,
                            style: TextStyle(
                              color: _dragValue > (_maxDrag * 0.4)
                                  ? colorScheme.onPrimary
                                  : colorScheme.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: padding + _dragValue,
                      child: GestureDetector(
                        onHorizontalDragUpdate: widget.enabled
                            ? (details) {
                                setState(() {
                                  _animController.stop();
                                  _dragValue += details.delta.dx;
                                  _dragValue = _dragValue.clamp(0.0, _maxDrag);
                                  _animController.value = _maxDrag > 0
                                      ? _dragValue / _maxDrag
                                      : 0.0;
                                });
                              }
                            : null,
                        onHorizontalDragEnd: widget.enabled
                            ? (details) {
                                if (_dragValue >= _maxDrag * 0.75) {
                                  _completeSlider(); 
                                } else {
                                  _resetSlider();    
                                }
                              }
                            : null,
                        child: Container(
                          width: handleSize,
                          height: handleSize,
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 6,
                                offset: const Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: colorScheme.primary,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}