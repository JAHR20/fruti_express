import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/router/auth_routes.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/admin_shell_routes.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/router/customer_shell_routes.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/router/branch_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';

abstract class RouteGuard {
  static String? redirect(BuildContext context, GoRouterState state) {
    final authState = sl<AuthCubit>().state;
    final currentPath = state.uri.path;
    
    final isPublicRoute =
        currentPath == AuthRoutes.welcomePath ||
        currentPath == AuthRoutes.loginPath ||
        currentPath == AuthRoutes.registerPath;

    if (authState is! AuthAuthenticated) {
      return isPublicRoute ? null : AuthRoutes.loginPath;
    }

    final user = authState.user;

    if (!user.profile.isComplete) {
      return currentPath == AuthRoutes.completeProfilePath
          ? null
          : AuthRoutes.completeProfilePath;
    }

    if (currentPath == AuthRoutes.completeProfilePath) {
      if (user.isStaff) return AdminShellRoutes.dashboardPath;
      if (user.isDeliveryPerson) return OrderRoutes.driverDashboardPath;
      return CustomerShellRoutes.homePath;
    }

    if (isPublicRoute) {
      if (user.isStaff) return AdminShellRoutes.dashboardPath;
      if (user.isDeliveryPerson) return OrderRoutes.driverDashboardPath;
      return CustomerShellRoutes.homePath;
    }

    if (currentPath.startsWith('/dashboard') && !user.isStaff) {
      return user.isDeliveryPerson 
          ? OrderRoutes.driverDashboardPath 
          : CustomerShellRoutes.homePath;
    }

    if (currentPath == BranchRoutes.listPath && !user.canCreateBranch) {
      return AdminShellRoutes.dashboardPath;
    }

    if (currentPath.startsWith('/branches') && !user.canCreateBranch) {
      return AdminShellRoutes.dashboardPath;
    }

    if (currentPath == UserRoutes.adminUsersPath && !user.canManageUsers) {
      return AdminShellRoutes.dashboardPath;
    }

    return null;
  }
}