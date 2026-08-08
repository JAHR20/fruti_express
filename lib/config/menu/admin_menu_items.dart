import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

// 🌟 El equivalente a tu "sealed class" o clase abstracta de Compose
class AdminMenuItem {
  final String titulo;
  final String ruta;
  final IconData icono;
  // ¡La magia! Pasamos la regla de tu extensión como un atributo
  final bool Function(Perfil usuario) tienePermiso;

  const AdminMenuItem({
    required this.titulo,
    required this.ruta,
    required this.icono,
    required this.tienePermiso,
  });
}

// 🌟 La lista de objetos centralizada. ¡Adiós al hardcodeo!
final menuAdminItems = <AdminMenuItem>[
  AdminMenuItem(
    titulo: 'Resumen',
    ruta: AppRouter.adminDashboard,
    icono: Icons.dashboard_outlined,
    tienePermiso: (usuario) => true, // Todos los del admin lo ven
  ),
  AdminMenuItem(
    titulo: 'Sucursales',
    ruta: AppRouter.adminSucursales,
    icono: Icons.store_outlined,
    tienePermiso: (usuario) => usuario.puedeCrearSucursal,
  ),
  // Nota: Si no tienes AppRouter.adminPedidos, ajusta la ruta
  AdminMenuItem(
    titulo: 'Pedidos',
    ruta: AppRouter.adminPedidos,
    icono: Icons.shopping_cart_outlined,
    tienePermiso: (usuario) => usuario.puedeGestionarPedidos,
  ),
  AdminMenuItem(
    titulo: 'Usuarios',
    ruta: AppRouter.adminEncargadoUsuarios,
    icono: Icons.people_outline,
    tienePermiso: (usuario) => usuario.puedeHacerEncargadoUsuario,
  ),
  AdminMenuItem(
    titulo: 'Categorías',
    ruta: AppRouter.adminCategories,
    icono: Icons.category_outlined,
    tienePermiso: (usuario) => usuario.puedeGestionarCatalogo,
  ),
  AdminMenuItem(
    titulo: 'Productos',
    ruta: AppRouter.adminProductos,
    icono: Icons.production_quantity_limits_outlined,
    tienePermiso: (usuario) => usuario.puedeGestionarCatalogo,
  ),
  AdminMenuItem(
    titulo: 'Inventario',
    ruta: AppRouter.adminInventarioProductos,
    icono: Icons.inventory_2_outlined,
    tienePermiso: (usuario) => usuario.puedeGestionarInventario,
  ),
  AdminMenuItem(
    titulo: 'Banners',
    ruta: AppRouter.adminBanners,
    icono: Icons.post_add_rounded,
    tienePermiso: (usuario) => usuario.puedeGestionarBanners,
  ),
];
