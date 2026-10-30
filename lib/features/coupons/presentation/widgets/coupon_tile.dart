import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/coupon.dart';
import '../cubits/coupon_cubit.dart';
import '../cubits/coupon_state.dart';

class CouponTile extends StatelessWidget {
  final Coupon coupon;
  final AppUser currentUser;
  final VoidCallback onEdit;

  const CouponTile({
    super.key, 
    required this.coupon, 
    required this.currentUser,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colors.secondary),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: coupon.isValidNow ? colors.primaryContainer : colors.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                coupon.isValidNow ? 'Válido' : 'Inválido',
                style: TextStyle(
                  color: coupon.isValidNow ? colors.onPrimaryContainer : colors.onErrorContainer,
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
                        ? colors.error 
                        : colors.onSurfaceVariant,
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
                      iconSize: 30,
                      icon: Icon(Icons.edit, color: colors.secondaryContainer),
                      onPressed: onEdit,
                      tooltip: 'Editar Cupón',
                    ),
                    const SizedBox(width: 4),
                    Tooltip(
                      message: coupon.isActive ? 'Desactivar' : 'Activar',
                      child: Switch(
                        activeThumbColor: colors.primary,
                        activeTrackColor: colors.primaryFixedDim,
                        value: coupon.isActive,
                        onChanged: (bool newValue) {
                          context.read<CouponCubit>().changeCouponStatus(
                            currentUser: currentUser, 
                            couponId: coupon.id,
                            newState: newValue, 
                          );
                        },
                      ),
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