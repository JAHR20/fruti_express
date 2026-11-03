import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/customer_shell_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';

class OrderSuccessfulPage extends StatelessWidget {
  final Order order;

  const OrderSuccessfulPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorTheme.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: colorTheme.primaryContainer,
                  size: 100,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                '¡Pedido Confirmado!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.secondaryContainer,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                'Hemos recibido tu pedido de Fruti Express y ya estamos preparándolo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: colorTheme.surfaceContainerHighest,
                ),
              ),
              const SizedBox(height: 32),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorTheme.surfaceBright),
                ),
                child: Column(
                  children: [
                    Text(
                      'Número de Orden',
                      style: TextStyle(
                        color: colorTheme.surfaceContainerHighest,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '#${order.id.substring(0, 8).toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total pagado:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          order.total.toCurrencyFormat,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorTheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    context.goNamed(CustomerShellRoutes.homeName);
                  },
                  child: Text(
                    'Volver a la Tienda',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorTheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
