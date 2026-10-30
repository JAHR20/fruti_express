import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/router/coupons_router.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_category_routes.dart';
import 'package:go_router/go_router.dart';

import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/config/router/route_guard.dart';

// Imports de tus rutas modulares
import 'package:fruti_express_jahr_admin/features/auth/presentation/router/auth_routes.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/router/category_routes.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/router/cart_routes.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/router/branch_routes.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/router/address_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/router/inventory_routes.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/router/banner_routes.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/customer_shell_routes.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/admin_shell_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AuthRoutes.welcomePath,
    refreshListenable: GoRouterRefreshStream(sl<AuthCubit>().stream),
    redirect: RouteGuard.redirect,

    routes: [
      // Públicas
      ...AuthRoutes.buildRoutes(),

      // Cliente - rutas fuera del Shell
      ...ProductRoutes.buildCustomerRoutes(),
      ...ProductCategoryRoutes.buildRoutes(),
      ...CartRoutes.buildRoutes(),
      ...AddressRoutes.buildRoutes(),
      ...OrderRoutes.buildCustomerRoutes(),
      ...UserRoutes.buildCustomerRoutes(),

      CustomerShellRoutes.buildRoute(),
      ...BranchRoutes.buildStandaloneRoutes(),

      // Admin - Shell
      AdminShellRoutes.buildRoute([
        ...ProductRoutes.buildAdminRoutes(),
        ...CategoryRoutes.buildAdminRoutes(),
        ...BranchRoutes.buildShellRoutes(),
        ...InventoryRoutes.buildRoutes(),
        ...BannerRoutes.buildRoutes(),
        ...UserRoutes.buildAdminRoutes(),
        ...OrderRoutes.buildAdminRoutes(),
        ...CouponsRouter.buildRoutes(),
      ]),

      // Repartidor
      ...OrderRoutes.buildDeliveryRoutes(),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
