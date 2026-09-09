import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/coupon.dart';
import '../cubits/coupon_cubit.dart';
import '../cubits/coupon_state.dart';

class CouponTile extends StatelessWidget {
  final Coupon coupon;
  final Profile currentUser;
  final VoidCallback onEdit;

  const CouponTile({
    super.key, 
    required this.coupon, 
    required this.currentUser,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final symbol = coupon.discountType == DiscountType.percentage ? '%' : '\$';
    final valueDisplay = coupon.discountType == DiscountType.percentage 
        ? '${coupon.discountValue}$symbol'
        : '$symbol${coupon.discountValue}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              coupon.code, 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: coupon.isValidNow ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                coupon.isValidNow ? 'Válido' : 'Inválido',
                style: TextStyle(
                  color: coupon.isValidNow ? Colors.green.shade700 : Colors.red.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Descuento: $valueDisplay'),
              Text('Mínimo de compra: \$${coupon.minPurchaseAmount}'),
              Text('Usos: ${coupon.usedCount} / ${coupon.usageLimit?.toString() ?? 'Ilimitados'}'),
              if (coupon.validUntil != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Expira: ${DateFormat('dd/MM/yyyy').format(coupon.validUntil!)}', 
                  style: TextStyle(
                    color: coupon.validUntil!.isBefore(DateTime.now()) 
                        ? Colors.red 
                        : Colors.grey.shade700,
                  ),
                ),
              ],
            ],
          ),
        ),
        trailing: BlocBuilder<CouponCubit, CouponState>(
          builder: (context, state) {
            if (state.processingCouponId == coupon.id) {
              return const Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 24, 
                  height: 24, 
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: onEdit,
                      tooltip: 'Editar Cupón',
                    ),
                    IconButton(
                      icon: Icon(
                        coupon.isActive ? Icons.toggle_on : Icons.toggle_off, 
                        color: coupon.isActive ? Colors.green : Colors.grey, 
                        size: 32,
                      ),
                      tooltip: coupon.isActive ? 'Desactivar' : 'Activar',
                      onPressed: () {
                        context.read<CouponCubit>().changeCouponStatus(
                          currentUser: currentUser, 
                          couponId: coupon.id,
                          newState: !coupon.isActive, 
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}