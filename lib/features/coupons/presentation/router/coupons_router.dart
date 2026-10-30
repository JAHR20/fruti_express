import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/cubits/coupon_cubit.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/pages/admin_coupons_page.dart';
import 'package:go_router/go_router.dart';

abstract class CouponsRouter {
  static const String adminCouponsPath = '/dashboard/coupons';
  static const String adminCouponsName = 'AdminCoupons';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: adminCouponsPath,
        name: adminCouponsName,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<CouponCubit>(),
            child: const AdminCouponsPage(),
          );
        },
      ),
    ];
  }
}
