import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import '../cubits/category_cubit.dart';
import '../pages/admin_categories_page.dart';
import '../pages/customer_categories_page.dart';

abstract class CategoryRoutes {
  static const String customerListPath = '/customer/categories';
  static const String customerListName = 'customer-categories';

  static const String adminListPath = '/dashboard/categories';
  static const String adminListName = 'admin-categories';

  static List<RouteBase> buildCustomerRoutes() {
    return [
      GoRoute(
        path: customerListPath,
        name: customerListName,
        builder: (context, state) {
          return BlocProvider(
            create: (_) =>
                sl<CategoryCubit>()..loadActiveCategories(),
            child: const CustomerCategoriesPage(),
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
          return BlocProvider(
            create: (_) => sl<CategoryCubit>(),
            child: const AdminCategoriesPage(),
          );
        },
      ),
    ];
  }
}