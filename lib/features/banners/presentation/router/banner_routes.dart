import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';

import '../cubits/promo_banner_cubit.dart';
import '../pages/admin_promo_banners_page.dart';

abstract class BannerRoutes {
  static const String adminBannersPath = '/dashboard/banners';
  static const String adminBannersName = 'admin-banners';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: adminBannersPath,
        name: adminBannersName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<PromoBannerCubit>(),
            child: const AdminPromoBannersPage(),
          );
        },
      ),
    ];
  }
}