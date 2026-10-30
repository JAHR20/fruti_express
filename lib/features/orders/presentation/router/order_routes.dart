import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/pages/card_payment_page.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/pages/payment_pending_page.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';

import '../../domain/entities/order.dart';
import '../cubits/order_cubit.dart';
import '../cubits/driver_orders_cubit.dart';
import '../cubits/manager_orders_cubit.dart';
import '../cubits/drivers_cubit.dart';

import '../pages/checkout_page.dart';
import '../pages/order_successful_page.dart';
import '../pages/driver_dashboard_page.dart';
import '../pages/orders_dashboard_page.dart';

abstract class OrderRoutes {
  static const String driverDashboardPath = '/deliveryperson';
  static const String driverDashboardName = 'driver-dashboard';

  static const String checkoutPath = '/customer/checkout';
  static const String checkoutName = 'customer-checkout';

  static const String orderSuccessfulPath = '/customer/order-successful';
  static const String orderSuccessfulName = 'order-successful';

  static const String adminOrdersPath = '/dashboard/orders';
  static const String adminOrdersName = 'admin-orders';

  static const String paymentPendingPath = '/customer/payment-pending';
  static const String paymentPendingName = 'payment-pending';

  static const String cardPaymentPath = '/customer/card-payment';
  static const String cardPaymentName = 'card-payment';

  static List<RouteBase> buildAdminRoutes() {
    return [
      GoRoute(
        path: adminOrdersPath,
        name: adminOrdersName,
        builder: (context, state) {
          final currentUser = (sl<AuthCubit>().state as AuthAuthenticated).user;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ManagerOrdersCubit>()),
              BlocProvider(create: (_) => sl<DriversCubit>()),
              BlocProvider(create: (_) => sl<BranchCubit>()),
            ],
            child: OrdersDashboardPage(key: ValueKey(currentUser.id)),
          );
        },
      ),
    ];
  }

  static List<RouteBase> buildDeliveryRoutes() {
    return [
      GoRoute(
        path: driverDashboardPath,
        name: driverDashboardName,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<DriverOrdersCubit>(),
          child: const DriverDashboardPage(),
        ),
      ),
    ];
  }

  static List<RouteBase> buildCustomerRoutes() {
    return [
      GoRoute(
        path: checkoutPath,
        name: checkoutName,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<OrderCubit>()),
              BlocProvider(create: (_) => sl<BranchCubit>()..loadBranches()),
              BlocProvider(create: (_) => sl<ShippingAdminCubit>()),
            ],
            child: BlocListener<BranchCubit, BranchState>(
              listener: (context, state) {
                if (state.branches.isNotEmpty) {
                  final activeBranchId = state.branches.first.id;
                  context.read<ShippingAdminCubit>().loadData(activeBranchId);
                }
              },
              child: const CheckoutPage(),
            ),
          );
        },
      ),
      GoRoute(
        path: orderSuccessfulPath,
        name: orderSuccessfulName,
        builder: (context, state) {
          final order = state.extra as Order;
          return OrderSuccessfulPage(order: order);
        },
      ),

      GoRoute(
        path: cardPaymentPath,
        name: cardPaymentName,
        builder: (context, state) {
          final order = state.extra as Order;
          return CardPaymentPage(order: order);
        },
      ),

      GoRoute(
        path: paymentPendingPath,
        name: paymentPendingName,
        builder: (context, state) {
          final order = state.extra as Order;
          return PaymentPendingPage(order: order);
        },
      ),
    ];
  }
}
