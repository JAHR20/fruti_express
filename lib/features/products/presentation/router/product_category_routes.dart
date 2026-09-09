// features/products/presentation/router/product_category_routes.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/pages/category_products_page.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import '../cubits/product_cubit.dart';

abstract class ProductCategoryRoutes {
  static const String path = '/customer/categories/products';
  static const String name = 'customer-products-by-category';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: path,
        name: name,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final category = extras['category'] as Category;
          final branchId = extras['branchId'] as String;

          return BlocProvider(
            create: (_) => sl<ProductCubit>()
              ..loadProductsByCategory(category.id, branchId),
            child: CategoryProductsPage(category: category),
          );
        },
      ),
    ];
  }
}