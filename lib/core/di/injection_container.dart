import 'package:fruti_express_jahr_admin/features/auth/di/auth_di.dart';
import 'package:fruti_express_jahr_admin/features/categorias/di/categorias_di.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/di/direcciones_di.dart';
import 'package:fruti_express_jahr_admin/features/inventario/di/inventario_di.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/di/pedidos_di.dart';
import 'package:fruti_express_jahr_admin/features/productos/di/productos_di.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/di/sucursales_di.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/di/usuarios_di.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// sl = Service Locator (Localizador de Servicios)
final sl = GetIt.instance;

Future<void> init() async {
  // --- 🛰️ 1. DEPENDENCIAS EXTERNAS ---
  // Registramos el cliente de Supabase para que todos los DataSources puedan usarlo.
  final supabaseClient = Supabase.instance.client;
  sl.registerLazySingleton(() => supabaseClient);

  // --- 📦 2. REGISTRO DE FEATURES ---
  // Aquí llamamos a los "sub-jefes" de cada carpeta.
  initAuth(sl);
  initPedidos(sl);
  initDirecciones(sl);
  initUsuarios(sl);
  initCategorias(sl);
  initProductos(sl);
  initInventario(sl);
  initSucursales(sl);

  // Nota: Conforme crees más features (Inventario, Sucursales),
  // solo tendrás que añadir una línea aquí.
}
