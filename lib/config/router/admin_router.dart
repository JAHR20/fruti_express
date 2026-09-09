
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/welcome_page.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/login_page.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/register_page.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/pages/admin_promo_banners_page.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/pages/carrito_cliente_page.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/pages/admin_categories_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/admin_dashboard_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/admin_shell_page.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/pages/search_page.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/pages/customer_categories_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/customer_shell_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/customer_home_view.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/customer_orders_page.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/pages/customer_profile_page.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/pages/category_products_page.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/pages/my_addresses_page.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/pages/admin_inventory_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/order_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/manager_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/drivers_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/checkout_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/orders_dashboard_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/order_successful_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/driver_dashboard_page.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/pages/admin_products_page.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/pages/admin_branches_page.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/pages/create_branch_wizard_screen.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/pages/gestion_tarifas_screen.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/pages/edit_profile_page.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/pages/users_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  //-- Rutas de admin
  static const String login = '/login';
  static const String bienvenida = '/bienvenida';
  static const String register = '/register';
  static const String adminDashboard = '/dashboard';
  static const String repartidorDashboard = '/repartidor';
  static const String adminCategories = '/dashboard/categorias';
  static const String adminSucursales = '/dashboard/sucursales';
  static const String adminSucursalesNueva = 'nueva';
  static const String adminSucursalesTarifasPath = ':id/tarifas';
  static const String adminSucursalesTarifasName = 'gestion_tarifas';
  static const String adminEncargadoUsuarios = '/dashboard/usuarios';
  static const String adminProductos = '/dashboard/productos';
  static const String adminInventarioProductos = '/dashboard/inventario';
  static const String adminBanners = '/dashboard/banners';
  static const String adminPedidos = '/dashboard/pedidos';

  // ------- rutas de clientes
  static const String clienteInicio = '/cliente/inicio';
  static const String clienteCategorias = '/cliente/categorias';
  static const String clienteFavoritos = '/cliente/favoritos';
  static const String clientePerfil = '/cliente/perfil';
  static const String barraBusqueda = '/cliente/busqueda';
  static const String productosCategoria = '/cliente/categorias/productos';
  static const String carrito = '/cliente/carrito';
  static const String checkoutCliente = '/cliente/checkout_cliente';
  static const String clientePedidos = '/cliente/pedidos';
  static const String clienteEditarPerfil = '/cliente/editar_perfil';
  static const String clienteMisDirecciones = '/cliente/mis_direcciones';
  static const String pedidoExitoso = '/cliente/pedido-exitoso';

  static final GoRouter router = GoRouter(
    initialLocation: bienvenida,
    refreshListenable: GoRouterRefreshStream(sl<AuthCubit>().stream),
    redirect: (context, state) {
      final authState = sl<AuthCubit>().state;
      final currentPath = state.uri.path;
      final isPublicRoute =
          currentPath == bienvenida ||
          currentPath == login ||
          currentPath == register;

      if (authState is! AuthAuthenticated) {
        return isPublicRoute ? null : AppRouter.login;
      }

      final usuario = authState.perfil;

      if (isPublicRoute) {
        if (usuario.esStaff) return adminDashboard;
        if (usuario.esRepartidor) return repartidorDashboard;
        return clienteInicio;
      }

      if (currentPath.startsWith('/dashboard') && !usuario.esStaff) {
        return usuario.esRepartidor ? repartidorDashboard : clienteInicio;
      }

      if (currentPath == adminSucursales && !usuario.puedeCrearSucursal) {
        return adminDashboard;
      }

      if (currentPath == adminEncargadoUsuarios &&
          !usuario.puedeHacerEncargadoUsuario) {
        return adminDashboard;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: bienvenida,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(path: login, builder: (context, state) => const LoginPage()),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: repartidorDashboard,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<PedidosRepartidorCubit>(),
          child: const RepartidorDashboardPage(),
        ),
      ),
      GoRoute(
        path: AppRouter.barraBusqueda,
        builder: (context, state) {
          final sucursalActivaId = state.extra as String?;
          if (sucursalActivaId == null) {
            return const Scaffold(
              body: Center(
                child: Text('Selecciona primero una dirección de entrega.'),
              ),
            );
          }
          return BlocProvider(
            create: (context) => sl<ProductosCubit>(),
            child: BusquedaPage(sucursalId: sucursalActivaId),
          );
        },
      ),
      GoRoute(
        path: carrito,
        builder: (context, state) {
          return const CarritoClientePage();
        },
      ),
      GoRoute(
        path: productosCategoria,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final categoria = extras['categoria'] as Categoria;
          final sucursalId = extras['sucursalId'] as String;
          return BlocProvider(
            create: (_) =>
                sl<ProductosCubit>()
                  ..cargarProductosPorCategoria(categoria.id, sucursalId),
            child: ProductosCategoriaView(categoria: categoria),
          );
        },
      ),
      GoRoute(
        path: checkoutCliente,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<PedidoCubit>()),
              BlocProvider(
                create: (_) => sl<BranchCubit>()..cargarSucursales(),
              ),
              BlocProvider(create: (_) => sl<EnvioAdminCubit>()),
            ],
            child: BlocListener<BranchCubit, BranchState>(
              listener: (context, state) {
                if (state.sucursales.isNotEmpty) {
                  final sucursalActivaId = state.sucursales.first.id;
                  context.read<EnvioAdminCubit>().cargarDatos(sucursalActivaId);
                }
              },
              child: const CheckoutPage(),
            ),
          );
        },
      ),

      GoRoute(
        path: pedidoExitoso,
        builder: (context, state) {
          final pedido = state.extra as Pedido;
          return PedidoExitosoPage(pedido: pedido);
        },
      ),

      GoRoute(
        path: clienteEditarPerfil,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<EditarPerfilCubit>(),
            child: const EditarPerfilPage(),
          );
        },
      ),

      GoRoute(
        path: clienteMisDirecciones,
        builder: (context, state) {
          final perfil = (sl<AuthCubit>().state as AuthAuthenticated).perfil;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    sl<DireccionesCubit>()..cargarDirecciones(perfil.id),
              ),
              BlocProvider(
                create: (_) => sl<BranchCubit>()..cargarSucursales(),
              ),
              BlocProvider(create: (_) => sl<EnvioAdminCubit>()),
            ],
            child: BlocListener<BranchCubit, BranchState>(
              listener: (context, state) {
                if (state.sucursales.isNotEmpty) {
                  final sucursalActivaId = state.sucursales.first.id;
                  context.read<EnvioAdminCubit>().cargarDatos(sucursalActivaId);
                }
              },
              child: MisDireccionesPage(usuarioId: perfil.id),
            ),
          );
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ClientePrincipalShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: clienteInicio,
                builder: (context, state) {
                  final usuarioActual =
                      (sl<AuthCubit>().state as AuthAuthenticated).perfil;
                  final sucursalCubit = sl<BranchCubit>();
                  sucursalCubit
                    ..cargarSucursales()
                    ..startRealtime();
                  final envioClienteCubit = sl<EnvioClienteCubit>();
                  final carritoCubit = context.read<CarritoCubit>();
                  final productosCubit = context.read<ProductosCubit>();
                  final direccionesCubit = context.read<DireccionesCubit>();

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) =>
                            sl<CategoriaCubit>()
                              ..cargarCategorias(usuarioActual),
                      ),
                      BlocProvider(
                        create: (_) =>
                            sl<BannerCubit>()..cargarBannersActivos(),
                      ),
                      BlocProvider.value(value: sucursalCubit),
                      BlocProvider.value(value: envioClienteCubit),
                      BlocProvider(
                        create: (_) => CoordinadorClienteCubit(
                          carritoCubit: carritoCubit,
                          productosCubit: productosCubit,
                          sucursalCubit: sucursalCubit,
                          envioClienteCubit: envioClienteCubit,
                          direccionesCubit: direccionesCubit,
                          getSelectedAddress: sl(),
                          saveSelectedAddress: sl(),
                        ),
                        lazy: false,
                      ),
                    ],
                    child: const InicioClienteView(),
                  );
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: clienteCategorias,
                builder: (context, state) {
                  return BlocProvider(
                    create: (context) =>
                        sl<CategoriaCubit>()..cargarCategoriasActivas(),
                    child: const CategoriasClienteView(),
                  );
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: clientePedidos,
                builder: (context, state) => BlocProvider(
                  create: (_) => sl<PedidosClienteCubit>(),
                  child: const PedidosClienteView(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: clientePerfil,
                builder: (context, state) => const PerfilClienteView(),
              ),
            ],
          ),
        ],
      ),

      ShellRoute(
        builder: (context, state, child) {
          return AdminShellPage(child: child);
        },
        routes: [
          GoRoute(
            path: adminDashboard,
            builder: (context, state) => const AdminDashboardPage(),
          ),
          GoRoute(
            path: adminCategories,
            builder: (context, state) {
              return BlocProvider(
                create: (context) => sl<CategoriaCubit>(),
                child: const AdminCategoriesPage(),
              );
            },
          ),
          GoRoute(
            path: adminSucursales,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<BranchCubit>(),
                child: const AdminSucursalesPage(),
              );
            },
            routes: [
              GoRoute(
                name: adminSucursalesNueva,
                path: adminSucursalesNueva,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final sucursal = extra?['sucursal'] as Sucursal?;
                  final pasoInicial = extra?['pasoInicial'] as int? ?? 0;

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (_) => sl<WizardSucursalCubit>()),
                      BlocProvider(create: (_) => sl<EnvioAdminCubit>()),
                    ],
                    child: CrearSucursalWizardScreen(
                      sucursal: sucursal,
                      pasoInicial: pasoInicial,
                    ),
                  );
                },
              ),

              GoRoute(
                path: adminSucursalesTarifasPath,
                name: adminSucursalesTarifasName,
                builder: (context, state) {
                  // Extraemos el ID de la URL
                  final sucursalId = state.pathParameters['id']!;

                  return BlocProvider(
                    create: (_) => sl<EnvioAdminCubit>(),
                    child: GestionTarifasScreen(sucursalId: sucursalId),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: adminPedidos,
            builder: (context, state) {
              final usuarioActual =
                  (sl<AuthCubit>().state as AuthAuthenticated).perfil;
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => sl<PedidosEncargadoCubit>()),
                  BlocProvider(create: (_) => sl<RepartidoresCubit>()),
                  BlocProvider(create: (_) => sl<BranchCubit>()),
                ],
                child: DashboardPedidosPage(key: ValueKey(usuarioActual.id)),
              );
            },
          ),
          GoRoute(
            path: adminEncargadoUsuarios,
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => sl<UsuariosCubit>()),
                  BlocProvider(create: (context) => sl<BranchCubit>()),
                ],
                child: UsuariosPage(
                  usuarioActual:
                      (sl<AuthCubit>().state as AuthAuthenticated).perfil,
                ),
              );
            },
          ),
          GoRoute(
            path: adminProductos,
            builder: (context, state) {
              final usuarioActual =
                  (sl<AuthCubit>().state as AuthAuthenticated).perfil;

              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        sl<ProductosCubit>()..cargarTodosLosProductos(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        sl<CategoriaCubit>()..cargarCategorias(usuarioActual),
                  ),
                ],
                child: const AdminProductosPage(),
              );
            },
          ),
          GoRoute(
            path: adminInventarioProductos,
            builder: (context, state) {
              final usuarioActual =
                  (sl<AuthCubit>().state as AuthAuthenticated).perfil;

              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) {
                      final cubit = sl<InventarioCubit>();
                      if (usuarioActual.sucursalId != null &&
                          usuarioActual.sucursalId!.isNotEmpty) {
                        cubit.cargarInventario(usuarioActual.sucursalId!);
                      }
                      return cubit;
                    },
                  ),
                  BlocProvider(
                    create: (context) =>
                        sl<ProductosCubit>()..cargarTodosLosProductos(),
                  ),
                  BlocProvider(
                    create: (context) {
                      final cubit = sl<BranchCubit>();
                      if (usuarioActual.sucursalId == null ||
                          usuarioActual.sucursalId!.isEmpty) {
                        cubit.cargarSucursales();
                      }
                      return cubit;
                    },
                  ),
                ],
                child: const AdminInventarioPage(),
              );
            },
          ),
          GoRoute(
            path: adminBanners,
            builder: (context, state) {
              return BlocProvider(
                create: (context) => sl<BannerCubit>(),
                child: const AdminBannersPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
*/