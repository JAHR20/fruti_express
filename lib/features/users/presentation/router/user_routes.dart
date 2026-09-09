import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';

import '../cubits/edit_profile_cubit.dart'; 
import '../cubits/users_cubit.dart'; 
import '../pages/edit_profile_page.dart'; 
import '../pages/users_page.dart';

abstract class UserRoutes {
  static const String editProfilePath = '/customer/edit_profile';
  static const String editProfileName = 'customer-edit-profile';
  
  static const String adminUsersPath = '/dashboard/users';
  static const String adminUsersName = 'admin-users';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: editProfilePath,
        name: editProfileName,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<EditProfileCubit>(),
            child: const EditProfilePage(),
          );
        },
      ),
      GoRoute(
        path: adminUsersPath,
        name: adminUsersName,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<UsersCubit>()),
              BlocProvider(create: (context) => sl<BranchCubit>()),
            ],
            child: UsersPage(
              currentUser: (sl<AuthCubit>().state as AuthAuthenticated).profile,
            ),
          );
        },
      ),
    ];
  }
}