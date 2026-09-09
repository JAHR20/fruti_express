
import 'package:fruti_express_jahr_admin/features/cart/presentation/pages/customer_cart_page.dart';
import 'package:go_router/go_router.dart';

abstract class CartRoutes {
  static const String path = '/customer/cart';
  static const String name = 'customer-cart';


  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: path,
        name: name,
        builder: (context, state) => const CustomerCartPage(),
      ),
    ];
  }
}