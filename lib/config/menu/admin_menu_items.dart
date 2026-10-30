import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/router/banner_routes.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/router/branch_routes.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/router/category_routes.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/router/coupons_router.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/admin_shell_routes.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/router/inventory_routes.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';

class AdminMenuItem {
  final String title;
  final String path;
  final IconData iconSelected;
  final IconData iconUnselected;
  final bool Function(AppUser usuario) hasPermission;

  const AdminMenuItem({
    required this.title,
    required this.path,
    required this.iconSelected,
    required this.iconUnselected,
    required this.hasPermission,
  });
}

final menuAdminItems = <AdminMenuItem>[
  AdminMenuItem(
    title: 'Resumen',
    path: AdminShellRoutes.dashboardPath,
    iconSelected: Icons.dashboard,
    iconUnselected: Icons.dashboard_outlined,
    hasPermission: (user) => true, 
  ),
  AdminMenuItem(
    title: 'Sucursales',
    path: BranchRoutes.listPath,
    iconSelected: Icons.store,
    iconUnselected: Icons.storefront_outlined,
    hasPermission: (user) => user.canCreateBranch,
  ),

  AdminMenuItem(
    title: 'Pedidos',
    path: OrderRoutes.adminOrdersPath,
    iconSelected: Icons.receipt,
    iconUnselected: Icons.receipt_outlined,
    hasPermission: (user) => user.canManageOrders,
  ),
  AdminMenuItem(
    title: 'Usuarios',
    path: UserRoutes.adminUsersPath,
    iconSelected: Icons.people,
    iconUnselected: Icons.people_outline,
    hasPermission: (user) => user.canMakeUserManager,
  ),
  AdminMenuItem(
    title: 'Categorías',
    path: CategoryRoutes.adminListPath,
    iconSelected: Icons.category,
    iconUnselected: Icons.category_outlined,
    hasPermission: (user) => user.canManageCatalog,
  ),
  AdminMenuItem(
    title: 'Productos',
    path: ProductRoutes.adminListPath,
    iconSelected: Icons.shopping_bag,
    iconUnselected: Icons.shopping_bag_outlined,
    hasPermission: (user) => user.canManageCatalog,
  ),
  AdminMenuItem(
    title: 'Cupones',
    path: CouponsRouter.adminCouponsPath,
    iconSelected: Icons.confirmation_number,
    iconUnselected: Icons.confirmation_number_outlined,
    hasPermission: (user) => user.canManageCoupons,
  ),
  AdminMenuItem(
    title: 'Inventario',
    path: InventoryRoutes.adminInventoryPath,
    iconSelected: Icons.inventory_2,
    iconUnselected: Icons.inventory_2_outlined,
    hasPermission: (user) => user.canManageInventory,
  ),
  AdminMenuItem(
    title: 'Banners',
    path: BannerRoutes.adminBannersPath,
    iconSelected: Icons.note_add,
    iconUnselected: Icons.note_add_outlined,
    hasPermission: (user) => user.canManageBanners,
  ),
];
