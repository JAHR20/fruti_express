import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import '../cubits/product_cubit.dart';
import '../pages/search_page.dart';
import '../pages/admin_products_page.dart';

abstract class ProductRoutes {
  static const String searchPath = '/customer/search';
  static const String searchName = 'customer-product-search';

  static const String adminListPath = '/dashboard/products';
  static const String adminListName = 'admin-products';

  static List<RouteBase> buildCustomerRoutes() {
    return [
      GoRoute(
        path: searchPath,
        name: searchName,
        builder: (context, state) {
          final activeBranchId = state.extra as String?;

          if (activeBranchId == null) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Selecciona primero una dirección de entrega.',
                ),
              ),
            );
          }

          return BlocProvider(
            create: (_) => sl<ProductCubit>(),
            child: SearchPage(branchId: activeBranchId),
          );
        },
      ),
    ];
  }

  static List<RouteBase> buildAdminRoutes() {
    return [
      GoRoute(
        path: adminListPath,
        name: adminListName,
        builder: (context, state) {
          final currentUser =
              (sl<AuthCubit>().state as AuthAuthenticated).profile;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<ProductCubit>()..loadAllProducts(),
              ),
              BlocProvider(
                create: (_) =>
                    sl<CategoryCubit>()..loadCategories(currentUser),
              ),
            ],
            child: const AdminProductsPage(),
          );
        },
      ),
    ];
  }
}