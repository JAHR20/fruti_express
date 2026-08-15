import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';

class AccionesRapidasRepartidor extends StatelessWidget {
  final String telefono;
  final String direccion;
  final ContactoService contactoService;

  const AccionesRapidasRepartidor({
    super.key,
    required this.telefono,
    required this.direccion,
    required this.contactoService,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BotonAccionRapida(
            icono: Icons.phone,
            etiqueta: 'Llamar',
            color: Colors.green,
            onTap: () => contactoService.llamar(telefono),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _BotonAccionRapida(
            icono: Icons.chat,
            etiqueta: 'WhatsApp',
            color: const Color(0xFF25D366),
            onTap: () => contactoService.abrirWhatsApp(telefono),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _BotonAccionRapida(
            icono: Icons.map_outlined,
            etiqueta: 'Maps',
            color: Colors.blue,
            onTap: () => contactoService.abrirMaps(direccion),
          ),
        ),
      ],
    );
  }
}

class _BotonAccionRapida extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final Color color;
  final VoidCallback onTap;

  const _BotonAccionRapida({
    required this.icono,
    required this.etiqueta,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              etiqueta,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}