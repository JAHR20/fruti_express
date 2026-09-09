import 'package:go_router/go_router.dart';
import '../pages/admin_shell_page.dart';
import '../pages/admin_dashboard_page.dart';

abstract class AdminShellRoutes {
  static const String dashboardPath = '/dashboard';
  static const String dashboardName = 'admin-dashboard';

  static RouteBase buildRoute(List<RouteBase> childRoutes) {
    return ShellRoute(
      builder: (context, state, child) {
        return AdminShellPage(child: child);
      },
      routes: [
        GoRoute(
          path: dashboardPath,
          name: dashboardName,
          builder: (context, state) => const AdminDashboardPage(),
        ),
        ...childRoutes, 
      ],
    );
  }
}