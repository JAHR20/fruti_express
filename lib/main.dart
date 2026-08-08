import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart'
    as di;
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  await di.init();
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
          create: (_) => di.sl<CarritoCubit>()..cargarCarrito(), 
          lazy: false,
        ),
        BlocProvider(
          create: (_) => di.sl<SucursalCubit>()..cargarSucursales(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => di.sl<DireccionesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<EnvioClienteCubit>(),
        ),
        BlocProvider(
         create: (_) => di.sl<ProductosCubit>(),
        ),
        
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FrutiExpress Admin',
        routerConfig: AppRouter.router,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}