import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';

class DriverQuickActions extends StatelessWidget {
  final String phone;
  final String address;
  final ContactService contactService;

  const DriverQuickActions({
    super.key,
    required this.phone,
    required this.address,
    required this.contactService,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: _QuickActionButton(
            icon: Icon(Icons.call_outlined, color: colorScheme.onPrimaryContainer),
            label: 'Llamar',
            background: colorScheme.secondaryContainer,
            onTap: () => contactService.makeCall(phone),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _QuickActionButton(
            icon: FaIcon(FontAwesomeIcons.whatsapp, color: colorScheme.onPrimaryContainer),
            label: 'WhatsApp',
            background: colorScheme.primary,
            onTap: () => contactService.openWhatsApp(phone),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _QuickActionButton(
            icon: FaIcon(FontAwesomeIcons.map, color: colorScheme.onPrimaryContainer),
            label: 'Maps',
            background: colorScheme.tertiary,
            onTap: () => contactService.openMaps(address),
          ),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color background;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: background,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
