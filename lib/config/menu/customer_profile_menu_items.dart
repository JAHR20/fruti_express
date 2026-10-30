import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/router/address_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';

class CustomerProfileMenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String routeName;
  final bool isDestructive;

  const CustomerProfileMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.routeName,
    this.isDestructive = false,
  });
}

// Lista principal de opciones de cuenta de cliente
final customerAccountItems = <CustomerProfileMenuItem>[
  CustomerProfileMenuItem(
    title: 'Editar perfil',
    subtitle: 'Nombre, teléfono, alias',
    icon: Icons.person_outline,
    routeName: UserRoutes.editProfileName,
  ),
  CustomerProfileMenuItem(
    title: 'Mis direcciones',
    subtitle: 'Agrega o edita tus direcciones',
    icon: Icons.location_on_outlined,
    routeName: AddressRoutes.myAddressesName,
  ),
  CustomerProfileMenuItem(
    title: 'Ayuda y soporte',
    subtitle: 'Obtén ayuda con tu cuenta',
    icon: Icons.help_outline,
    routeName: UserRoutes.editProfileName, // Cambia esto a la ruta correcta de ayuda y soporte
  ),
  CustomerProfileMenuItem(
    title: 'Mis pedidos',
    subtitle: 'Revisa el historial de tus pedidos',
    icon: Icons.shopping_bag_outlined,
    routeName: UserRoutes.editProfileName, // Cambia esto a la ruta correcta de ayuda y soporte
  ),
];