import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';

class CouponInputCard extends StatefulWidget {
  const CouponInputCard({super.key});

  @override
  State<CouponInputCard> createState() => _CouponInputCardState();
}

class _CouponInputCardState extends State<CouponInputCard> {
  final _couponController = TextEditingController();

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (prev, curr) => 
          prev.operationError != curr.operationError ||
          prev.appliedCoupon != curr.appliedCoupon,
      listener: (context, state) {
        if (state.operationError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.operationError!), backgroundColor: Colors.red),
          );
        } else if (state.appliedCoupon != null) {
          // Mostrar éxito real
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('¡Cupón ${state.appliedCoupon!.code} aplicado con éxito!'), 
              backgroundColor: Colors.green
            ),
          );
        }
      },
      builder: (context, state) {
        final hasCoupon = state.appliedCoupon != null;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasCoupon ? 'Cupón aplicado' : '¿Tienes un código de descuento?',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        textCapitalization: TextCapitalization.characters,
                        enabled: !hasCoupon,
                        decoration: InputDecoration(
                          hintText: hasCoupon ? state.appliedCoupon!.code : 'Ej. FRUTI20',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasCoupon ? Colors.grey : const Color(0xFF1E3A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      ),
                      onPressed: hasCoupon 
                          ? null 
                          : () {
                              final code = _couponController.text.trim();
                              if (code.isNotEmpty) {
                                FocusScope.of(context).unfocus();
                                context.read<CartCubit>().validateAndApplyCoupon(code);
                              }
                            },
                      child: const Text('Aplicar', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}