// lib/features/products/presentation/router/product_offers_routes.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/pages/customer_offers_page.dart';
import 'package:go_router/go_router.dart';

abstract class ProductOffersRoutes {
  static const String path = '/customer/offers';
  static const String name = 'customer-offers';

  /// Parámetros (extra): `branchId` (obligatorio) y `categoryId` (opcional).
  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: path,
        name: name,
        builder: (context, state) {
          final extras = (state.extra as Map<String, dynamic>?) ?? const {};
          final branchId = (extras['branchId'] as String?) ?? '';
          final categoryId = extras['categoryId'] as String?;

          return BlocProvider(
            create: (_) => sl<CustomerProductsCubit>()
              ..loadOffers(branchId, categoryId: categoryId),
            child: CustomerOffersPage(branchId: branchId),
          );
        },
      ),
    ];
  }
}