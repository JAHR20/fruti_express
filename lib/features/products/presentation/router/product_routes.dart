import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/cubits/admin_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/pages/product_details_page.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import '../customer/pages/search_page.dart';
import '../admin/pages/admin_products_page.dart';

abstract class ProductRoutes {
  static const String searchPath = '/customer/search';
  static const String searchName = 'customer-product-search';

  static const String detailsPath = '/customer/product-details';
  static const String detailsName = 'customer-product-details';

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
                child: Text('Selecciona primero una dirección de entrega.'),
              ),
            );
          }

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<CustomerProductsCubit>()),
              BlocProvider(create: (_) => sl<CategoryCubit>()),
            ],
            child: SearchPage(branchId: activeBranchId),
          );
        },
      ),
      GoRoute(
        path: detailsPath,
        name: detailsName,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final product = extras['product'] as Product;
          final branchId = extras['branchId'] as String;
          final categoryName = extras['categoryName'] as String?;

          return ProductDetailsPage(
            product: product,
            branchId: branchId,
            categoryName: categoryName,
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
          final currentUser = (sl<AuthCubit>().state as AuthAuthenticated).user;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<AdminProductsCubit>()..loadAllProducts(),
              ),
              BlocProvider(
                create: (_) => sl<CategoryCubit>()..loadCategories(currentUser),
              ),
            ],
            child: const AdminProductsPage(),
          );
        },
      ),
    ];
  }
}
