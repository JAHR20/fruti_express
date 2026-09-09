import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/router/banner_routes.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/router/branch_routes.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/router/category_routes.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/router/coupons_router.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/admin_shell_routes.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/router/inventory_routes.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';

class AdminMenuItem {
  final String title;
  final String path;
  final IconData icon;
  final bool Function(Profile usuario) hasPermission;

  const AdminMenuItem({
    required this.title,
    required this.path,
    required this.icon,
    required this.hasPermission,
  });
}

final menuAdminItems = <AdminMenuItem>[
  AdminMenuItem(
    title: 'Resumen',
    path: AdminShellRoutes.dashboardPath,
    icon: Icons.dashboard_outlined,
    hasPermission: (user) => true, 
  ),
  AdminMenuItem(
    title: 'Sucursales',
    path: BranchRoutes.listPath,
    icon: Icons.store_outlined,
    hasPermission: (user) => user.canCreateBranch,
  ),

  AdminMenuItem(
    title: 'Pedidos',
    path: OrderRoutes.adminOrdersPath,
    icon: Icons.shopping_cart_outlined,
    hasPermission: (user) => user.canManageOrders,
  ),
  AdminMenuItem(
    title: 'Usuarios',
    path: UserRoutes.adminUsersPath,
    icon: Icons.people_outline,
    hasPermission: (user) => user.canMakeUserManager,
  ),
  AdminMenuItem(
    title: 'Categorías',
    path: CategoryRoutes.adminListPath,
    icon: Icons.category_outlined,
    hasPermission: (user) => user.canManageCatalog,
  ),
  AdminMenuItem(
    title: 'Productos',
    path: ProductRoutes.adminListPath,
    icon: Icons.production_quantity_limits_outlined,
    hasPermission: (user) => user.canManageCatalog,
  ),
  AdminMenuItem(
    title: 'Cupones',
    path: CouponsRouter.adminCouponsPath,
    icon: Icons.confirmation_number_rounded,
    hasPermission: (user) => user.canManageCoupons,
  ),
  AdminMenuItem(
    title: 'Inventario',
    path: InventoryRoutes.adminInventoryPath,
    icon: Icons.inventory_2_outlined,
    hasPermission: (user) => user.canManageInventory,
  ),
  AdminMenuItem(
    title: 'Banners',
    path: BannerRoutes.adminBannersPath,
    icon: Icons.post_add_rounded,
    hasPermission: (user) => user.canManageBanners,
  ),
];
