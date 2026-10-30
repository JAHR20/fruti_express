import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/app_search_bar.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_selector_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/branch_picker_pickup_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/router/cart_routes.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banners_carousel.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/widgets/quick_categories.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_grid.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:go_router/go_router.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({super.key});

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        context.read<AddressCubit>().loadAddresses(authState.user.id);
      }

      context.read<PromoBannerCubit>().loadActiveBanners();

      final coordinatorState = context.read<CustomerCoordinatorCubit>().state;
      coordinatorState.maybeWhen(
        changeSuccessful: (branch, _) {
          context.read<CustomerProductsCubit>().loadProductsByBranch(branch.id);
        },
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final userProfile = context.select<AuthCubit, AppUser?>(
      (cubit) => cubit.state is AuthAuthenticated
          ? (cubit.state as AuthAuthenticated).user
          : null,
    );
    final cartState = context.watch<CartCubit>().state;
    final cartItemCount = cartState.items.length;

    final currentAddress = cartState.selectedAddress;
    final deliveryMethod = cartState.deliveryMethod;

    String locationText = deliveryMethod == DeliveryMethod.pickUp
        ? 'Recoger en Sucursal'
        : (currentAddress?.alias ?? 'Seleccionar dirección');

    IconData locationIcon = deliveryMethod == DeliveryMethod.pickUp
        ? Icons.storefront
        : Icons.location_on;

    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerCoordinatorCubit, CustomerCoordinatorState>(
          listener: (context, state) {
            state.maybeWhen(
              processing: () {},
              changeSuccessful: (branch, wasAutomatic) {
                context.read<CustomerProductsCubit>().loadProductsByBranch(
                  branch.id,
                );
                if (!wasAutomatic) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Ubicación actualizada'),
                      backgroundColor: colorScheme.primary,
                    ),
                  );
                }
              },
              outOfCoverage: (address) {
                _showPickUpModal(context, address);
              },
              orElse: () {},
            );
          },
        ),
      ],
      // Reemplazamos SingleChildScrollView por CustomScrollView para usar Slivers
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // SliverAppBar es la magia que ancla los elementos arriba
          SliverAppBar(
            pinned: true, // Esto lo mantiene anclado
            floating: false,
            backgroundColor: colorScheme.surface,
            surfaceTintColor: colorScheme
                .surface, // Evita cambios de color raros al hacer scroll
            elevation: 0,
            toolbarHeight: 65,
            titleSpacing: 16, // Padding izquierdo
            title: InkWell(
              onTap: () {
                context.read<AddressCubit>().loadAddresses(userProfile.id);
                AddressSelectorBottomSheet.show(context);
              },
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.primary,
                    child: Icon(
                      locationIcon,
                      color: colorScheme.onPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Entregar a ',
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              userProfile!.profile.alias ??
                                  userProfile.profile.firstName,
                              style: TextStyle(
                                color: colorScheme.tertiary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                locationText,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: colorScheme.onSurface,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: colorScheme.onSurface,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // Botón del Carrito (NUEVO)
              InkWell(
                onTap: () {
                  context.pushNamed(CartRoutes.name);
                },
                borderRadius: BorderRadius.circular(18),
                child: Badge.count(
                  count: cartItemCount,
                  isLabelVisible: cartItemCount > 0,
                  backgroundColor: colorScheme.primary,
                  textColor: colorScheme.onPrimary,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.secondaryContainer,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: colorScheme.onSecondaryContainer,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Botón de Notificaciones
              InkWell(
                onTap: () {
                  // Acción de notificaciones
                },
                borderRadius: BorderRadius.circular(18),
                child: Badge.count(
                  count: cartItemCount,
                  isLabelVisible: cartItemCount > 0,
                  backgroundColor: colorScheme.error,
                  textColor: colorScheme.onPrimary,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.errorContainer,
                    child: Icon(
                      Icons.notifications_none,
                      color: colorScheme.error,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AppSearchBar(
                  hintText: 'Buscar manzanas, chiles secos...',
                  readOnly: true,
                  onTap: () {
                    final branchId = context.read<CartCubit>().state.branchId;
                    if (branchId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Selecciona primero una dirección de entrega.',
                          ),
                          backgroundColor: colorScheme.error,
                        ),
                      );
                      return;
                    }

                    // Navegamos a la ruta de búsqueda
                    context.pushNamed(
                      ProductRoutes.searchName,
                      extra: branchId,
                    );
                  },
                ),
              ),
            ),
          ),

          // El resto del contenido que sí hace scroll va en un SliverToBoxAdapter
          SliverToBoxAdapter(
            child: Padding(
              // Mantenemos el padding inferior (110) para no tapar contenido con la NavBar de abajo
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PromoBannersCarousel(),
                  QuickCategories(),
                  SizedBox(height: 16),
                  ProductGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPickUpModal(BuildContext context, Address address) {
    final colorScheme = Theme.of(context).colorScheme;

    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return Padding(
          padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, bottomSafeArea),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.storefront, size: 60, color: colorScheme.tertiary),
              const SizedBox(height: 16),
              Text(
                '¡Estás un poco lejos! 🛵',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Por el momento nuestros repartidores no llegan a esta dirección. ¿Qué te gustaría hacer?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(modalContext);
                    BranchPickerPickupBottomSheet.show(context);
                  },
                  child: Text(
                    'Pasar a recoger a sucursal',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(modalContext);
                    AddressSelectorBottomSheet.show(context);
                  },
                  child: Text(
                    'Elegir otra dirección',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
