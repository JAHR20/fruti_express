import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/complete_profile_page.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/welcome_page.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
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

  static const String completeProfilePath = '/complete-profile';
  static const String completeProfileName = 'complete-profile';

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
      GoRoute(
        path: completeProfilePath,
        name: completeProfileName,
        builder: (context, state) {
          final authState = sl<AuthCubit>().state;
          final currentUser = (authState as AuthAuthenticated).user;

          return BlocProvider(
            create: (_) => sl<EditProfileCubit>(),
            child: CompleteProfilePage(currentUser: currentUser),
          );
        },
      ),
    ];
  }
}
