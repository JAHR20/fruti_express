import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

class PedidoExitosoPage extends StatelessWidget {
  final Pedido pedido; // Recibimos el pedido que acabamos de crear

  const PedidoExitosoPage({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // 🌟 Ícono gigante de éxito (Puedes cambiarlo por una animación Lottie después)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              const SizedBox(height: 32),
              
              // 🌟 Mensaje de agradecimiento
              const Text(
                '¡Pedido Confirmado!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                'Hemos recibido tu pedido de Fruti Express y ya estamos preparándolo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),
              
              // 🌟 Tarjeta con el resumen
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Número de Orden',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '#${pedido.id.substring(0, 8).toUpperCase()}', // Mostramos un pedacito del ID
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
                        const Text('Total pagado:', style: TextStyle(fontSize: 16)),
                        Text(
                          '\$${pedido.total}', // Formatea a moneda si tienes un helper
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // 🌟 Botón para volver al inicio
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Usamos go() para borrar todo el historial de navegación
                    // y que no pueda regresar a la pantalla de pago dándole "Atrás"
                    context.go(AppRouter.clienteInicio); // 🌟 Usamos la ruta de bienvenida
                  },
                  child: const Text(
                    'Volver a la Tienda',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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