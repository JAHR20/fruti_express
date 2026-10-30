import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';


class CustomerDependencyProvider extends StatelessWidget {
  final Widget child;

  const CustomerDependencyProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final authState = sl<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return child; 
    
    final usuarioActual = authState.user; 

    final branchCubit = sl<BranchCubit>()..loadBranches()..startRealtime();
    final customerShippingCubit = sl<CustomerShippingCubit>();
    
    final cartCubit = context.read<CartCubit>();
    final customerProductsCubit = context.read<CustomerProductsCubit>();
    final addressCubit = context.read<AddressCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CategoryCubit>()..loadCategories(usuarioActual)),
        BlocProvider(create: (_) => sl<PromoBannerCubit>()..loadActiveBanners()),
        BlocProvider.value(value: branchCubit),
        BlocProvider.value(value: customerShippingCubit),
        BlocProvider(
          lazy: false,
          create: (_) => CustomerCoordinatorCubit(
            cartCubit: cartCubit,
            customerProductsCubit: customerProductsCubit,
            branchCubit: branchCubit,
            customerShippingCubit: customerShippingCubit,
            addressCubit: addressCubit,
            getSelectedAddressUseCase: sl(),
            saveSelectedAddressUseCase: sl(),
            calculateShippingQuoteUseCase: sl()
          ),
        ),
      ],
      child: BlocListener<BranchCubit, BranchState>(
        listener: (context, state) {
          if (state.branches.isNotEmpty) {
            context.read<CustomerShippingCubit>().loadBranchConfigurations(state.branches);
          }
        },
        child: child, 
      ),
    );
  }
}