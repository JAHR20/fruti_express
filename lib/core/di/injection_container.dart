import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/supabase_storage_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/location/open_street_map_impl.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/features/auth/di/auth_di.dart';
import 'package:fruti_express_jahr_admin/features/banners/di/banners_di.dart';
import 'package:fruti_express_jahr_admin/features/cart/di/cart_di.dart';
import 'package:fruti_express_jahr_admin/features/categories/di/categories_di.dart';
import 'package:fruti_express_jahr_admin/features/coupons/di/coupons_di.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/di/delivery_preferences_di.dart';
import 'package:fruti_express_jahr_admin/features/addresses/di/address_di.dart';
import 'package:fruti_express_jahr_admin/features/shipping/di/shipping_di.dart';
import 'package:fruti_express_jahr_admin/features/inventory/di/inventory_di.dart';
import 'package:fruti_express_jahr_admin/features/orders/di/orders_di.dart';
import 'package:fruti_express_jahr_admin/features/products/di/products_di.dart';
import 'package:fruti_express_jahr_admin/features/branches/di/branches_di.dart';
import 'package:fruti_express_jahr_admin/features/users/di/users_di.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --- DEPENDENCIAS EXTERNAS ---
  final supabaseClient = Supabase.instance.client;
  sl.registerLazySingleton(() => supabaseClient);

  sl.registerLazySingleton<LocationService>(() => OpenStreetMapServiceImpl());

  sl.registerLazySingleton<StorageService>(() => SupabaseStorageImpl(sl()));

  sl.registerLazySingleton<PostaliService>(() => PostaliServiceImpl());

  // --- REGISTRO DE FEATURES ---
  initAuth(sl);
  initOrders(sl);
  initAddress(sl);
  initUsers(sl);
  initCategories(sl);
  initProducts(sl);
  initInventory(sl);
  initBranches(sl);
  initCart(sl);
  initBanners(sl);
  initShipping(sl);
  initDeliveryPreferences(sl);
  initCoupons(sl);

}
