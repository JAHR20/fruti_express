import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/pages/customer_categories_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/providers/customer_dependency_provider.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/customer_orders_page.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/pages/customer_profile_page.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_cubit.dart';

// Import de Vistas
import '../pages/customer_shell_page.dart';
import '../pages/customer_home_view.dart';

abstract class CustomerShellRoutes {
  static const String homePath = '/customer/home';
  static const String homeName = 'customer-home';

  static const String categoriesPath = '/cliente/categorias';
  static const String categoriesName = 'customer-categories-tab';

  static const String ordersPath = '/cliente/pedidos';
  static const String ordersName = 'customer-orders-tab';

  static const String profilePath = '/cliente/perfil';
  static const String profileName = 'customer-profile-tab';

  static RouteBase buildRoute() {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomerDependencyProvider(
          child: CustomerShellPage(navigationShell: navigationShell),
        );
      },
      branches: [
        // RAMA 1: Inicio
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: homePath,
              name: homeName,
              builder: (context, state) => const CustomerHomeView(),
            ),
          ],
        ),

        // RAMA 2: Categorías
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: categoriesPath,
              name: categoriesName,
              builder: (context, state) {
                return BlocProvider(
                  create: (context) =>
                      sl<CategoryCubit>()..loadActiveCategories(),
                  child: const CustomerCategoriesPage(),
                );
              },
            ),
          ],
        ),

        // RAMA 3: Pedidos
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ordersPath,
              name: ordersName,
              builder: (context, state) => BlocProvider(
                create: (_) => sl<CustomerOrdersCubit>(),
                child: const CustomerOrdersPage(),
              ),
            ),
          ],
        ),

        // RAMA 4: Perfil
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: profilePath,
              name: profileName,
              builder: (context, state) => const CustomerProfilePage(),
            ),
          ],
        ),
      ],
    );
  }
}
