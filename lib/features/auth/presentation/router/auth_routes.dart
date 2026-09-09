import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';

abstract class AuthRoutes {
  static const String welcomePath = '/welcome';
  static const String welcomeName = 'welcome';
  
  static const String loginPath = '/login';
  static const String loginName = 'login';
  
  static const String registerPath = '/register';
  static const String registerName = 'register';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: welcomePath,
        name: welcomeName,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: loginPath,
        name: loginName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: registerPath,
        name: registerName,
        builder: (context, state) => const RegisterPage(),
      ),
    ];
  }
}