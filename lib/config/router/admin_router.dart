import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/bienvenida_page.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/login_page.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/pages/register_page.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/pages/admin_banners_page.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/pages/carrito_cliente_page.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/pages/admin_categories_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/admin_dashboard_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/admin_shell_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/busqueda_page.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/categorias_cliente_view.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/cliente_principal_shell.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/inicio_cliente_view.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/pedidos_cliente_view.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/perfil_cliente_view.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/productos_categoria_view.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/pages/mis_direcciones_page.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/coordinador_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/cubits/inventario_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/pages/admin_inventario_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedido_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/repartidores_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/checkout_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/dashboard_pedidos_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/pedido_exitoso_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/repartidor_dashboard_page.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/pages/admin_productos_page.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/pages/admin_sucursales_page.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/pages/crear_sucursal_wizard_screen.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/pages/gestion_tarifas_screen.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/pages/editar_perfil_page.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/pages/usuarios_page.dart';
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
        builder: (context, state) => const BienvenidaPage(),
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
          final sucursalActivaId = state.extra as String;
          return BlocProvider(
            create: (context) => sl<ProductosCubit>(),
            child: BusquedaPage(sucursalId: sucursalActivaId),
          );
        },
      ),
      // En tu app_router.dart
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
                create: (_) => sl<SucursalCubit>()..cargarSucursales(),
              ),
              BlocProvider(create: (_) => sl<EnvioAdminCubit>()),
            ],
            child: BlocListener<SucursalCubit, SucursalState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (sucursales) {
                    if (sucursales.isNotEmpty) {
                      final sucursalActivaId = sucursales.first.id;
                      context.read<EnvioAdminCubit>().cargarDatos(
                        sucursalActivaId,
                      );
                    }
                  },
                  orElse: () {},
                );
              },
              child: const CheckoutPage(),
            ),
          );
        },
      ),

      GoRoute(
        path: pedidoExitoso, // 🌟 Usamos la constante aquí
        builder: (context, state) {
          // Extraemos el pedido que viene en la propiedad "extra"
          final pedido = state.extra as Pedido;
          return PedidoExitosoPage(pedido: pedido);
        },
      ),

      GoRoute(
        path:
            clienteEditarPerfil, // ⚠️ Cámbialo por tu variable si tienes una (ej. AppRouter.editarPerfil)
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<UsuariosCubit>(),
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
                create: (_) => sl<SucursalCubit>()..cargarSucursales(),
              ),
              BlocProvider(create: (_) => sl<EnvioAdminCubit>()),
            ],
            child: BlocListener<SucursalCubit, SucursalState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (sucursales) {
                    if (sucursales.isNotEmpty) {
                      final sucursalActivaId = sucursales.first.id;
                      context.read<EnvioAdminCubit>().cargarDatos(
                        sucursalActivaId,
                      );
                    }
                  },
                  orElse: () {},
                );
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
                      // 🌟 INYECCIÓN LOCAL: Nace aquí, muere al salir de la pantalla
                      BlocProvider(
                        create: (_) => sl<CoordinadorClienteCubit>(),
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
              // ✅ Corregido
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
                create: (_) => sl<SucursalCubit>(),
                child: const AdminSucursalesPage(),
              );
            },
            routes: [
              GoRoute(
                name: adminSucursalesNueva,
                path: adminSucursalesNueva,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;

                  // 🌟 2. Sacamos los valores de forma segura
                  final sucursal =
                      extra?['sucursal']
                          as Sucursal?; // Nota: Asegúrate de importar tu entidad Sucursal
                  final pasoInicial = extra?['pasoInicial'] as int? ?? 0;

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => sl<FormularioSucursalCubit>(),
                      ),
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
                  BlocProvider(create: (_) => sl<SucursalCubit>()),
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
                  BlocProvider(create: (context) => sl<SucursalCubit>()),
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
                      final cubit = sl<SucursalCubit>();
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
