import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruti_express_jahr_admin/config/router/app_router.dart.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart'
    as di;
import 'package:fruti_express_jahr_admin/core/theme/app_theme.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:mercadopago/mercadopago.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    publishableKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  await di.init();

  final mpPublicKey = dotenv.maybeGet('MERCADOPAGO_PUBLIC_KEY');
  if (mpPublicKey != null && mpPublicKey.isNotEmpty) {
    MercadoPagoSDK.shared.initialize(
      publicKey: mpPublicKey,
      countryCode: 'MEX',
      analyticsEnabled: false,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di.sl<AuthCubit>()..checkStatus(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => di.sl<CartCubit>()..loadCart(),
          lazy: false,
        ),
        BlocProvider(create: (_) => di.sl<AddressCubit>()),

        BlocProvider(create: (_) => di.sl<CustomerProductsCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FrutiExpress Admin',
        routerConfig: AppRouter.router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
