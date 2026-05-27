
/*
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: locator<AuthViewModel>(),
    redirect: (context, state) {
      final authVM = locator<AuthViewModel>();
      final isLoggingIn = state.matchedLocation == '/login';

      // 1. Si no hay sesión, todos al login
      if (!authVM.isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        final rol = authVM.currentUser?.rol;

        // IMPORTANTE: Comparar contra el Enum UserRole
        if (rol == UserRole.admin) {
          return '/dashboard'; // <--- Esto te lleva a la HomeScreen
        } else {
          return '/repartidor-home'; // <--- Esto te lleva a Mis Entregas
        }
      }

      // 3. Protección de Rutas para Admin (O de SOLID: Abierto a extensión)
      final adminOnlyRoutes = [
        '/inventory',
        '/add-product',
        '/users',
        '/add-staff',
        '/pedidos',
        '/categorias',
      ];
      final isTryingAdminRoute = adminOnlyRoutes.any(
        (route) => state.matchedLocation.startsWith(route),
      );

      if (isTryingAdminRoute && authVM.currentUser?.rol != UserRole.admin) {
        return '/repartidor-home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginAdminScreen(),
      ),
      // DASHBOARD PRINCIPAL (KPIs)
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const HomeScreen(),
      ),
      // GESTIÓN DE PEDIDOS (La que acabamos de hacer)
      GoRoute(
        path: '/pedidos',
        builder: (context, state) => const PedidosDashboardScreen(),
      ),
      GoRoute(
        path: '/pedido-detalle',
        builder: (context, state) {
          final pedido = state.extra as PedidoEntity;
          return PedidoDetailScreen(
            pedido: pedido,
            pedidoVM: locator<PedidoViewModel>(),
          );
        },
      ),
      // INVENTARIO
      GoRoute(
        path: '/inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
      GoRoute(
        path: '/add-product',
        builder: (context, state) {
          final producto = state.extra as ProductoEntity?;
          return AddProductScreen(productoParaEditar: producto);
        },
      ),
      // PERSONAL (REPARTIDORES)
      GoRoute(path: '/users', builder: (context, state) => const UserScreen()),
      GoRoute(
        path: '/ventasReport',
        builder: (context, state) => const VentasScreen(),
      ),
      //RUTAS DE REPARTIDOR
      GoRoute(
        path: '/repartidor-home',
        builder: (context, state) => const DriverOrdersScreen(),
      ),
    ],
  );
}
*/