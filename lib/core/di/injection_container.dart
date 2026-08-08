import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/supabase_storage_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/open_street_map_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/features/auth/di/auth_di.dart';
import 'package:fruti_express_jahr_admin/features/banners/di/banners_di.dart';
import 'package:fruti_express_jahr_admin/features/carrito/di/carrito_di.dart';
import 'package:fruti_express_jahr_admin/features/categorias/di/categorias_di.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/di/direcciones_di.dart';
import 'package:fruti_express_jahr_admin/features/envios/di/envios_di.dart';
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

  sl.registerLazySingleton<UbicacionService>(() => OpenStreetMapServiceImpl());

  sl.registerLazySingleton<StorageService>(() => SupabaseStorageImpl(sl()));

  sl.registerLazySingleton<PostaliService>(() => PostaliServiceImpl());

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
  initCarrito(sl);
  initBanners(sl);
  initEnvios(sl);

  // Nota: Conforme crees más features (Inventario, Sucursales),
  // solo tendrás que añadir una línea aquí.
}
