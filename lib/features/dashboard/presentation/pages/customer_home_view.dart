import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart'; // BannerCubit -> PromoBannerCubit
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; // CarritoCubit -> CartCubit
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_selector_bottom_sheet.dart'; // SelectorDirectionsBottomSheet -> AddressSelectorBottomSheet
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/branch_picker_pickup_bottom_sheet.dart'; // SelectorBranchesPickupBottomSheet -> BranchPickerPickupBottomSheet
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart'; // Direccion -> Address
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart'; // DireccionesCubit -> AddressCubit
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart'; // CoordinadorClienteCubit -> CustomerCoordinatorCubit
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/customer_search_bar.dart'; // BarraBusqueda -> CustomerSearchBar
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banners_carousel.dart'; // CarruselOfertas -> PromoBannersCarousel
import 'package:fruti_express_jahr_admin/features/categories/presentation/widgets/quick_categories.dart'; // CategoriasRapidas -> QuickCategories
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/product_grid.dart'; // CuadriculaProductos -> ProductGrid
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart'; // ProductosCubit -> ProductCubit
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart'; // Perfil -> Profile

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
        context.read<AddressCubit>().loadAddresses(authState.profile.id); 
      }

      context.read<PromoBannerCubit>().loadActiveBanners(); 

      final coordinatorState = context.read<CustomerCoordinatorCubit>().state;
      coordinatorState.maybeWhen(
        changeSuccessful: (branch, _) { 
          context.read<ProductCubit>().loadProductsByBranch(branch.id); 
        },
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.select<AuthCubit, Profile?>( 
      (cubit) => cubit.state is AuthAuthenticated
          ? (cubit.state as AuthAuthenticated).profile
          : null,
    );
    final cartState = context.watch<CartCubit>().state; 

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
                context.read<ProductCubit>().loadProductsByBranch(branch.id);
                if (!wasAutomatic) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ubicación actualizada'),
                      backgroundColor: Colors.green,
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
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (userProfile != null) {
                            context.read<AddressCubit>().loadAddresses(userProfile.id);
                          }
                          AddressSelectorBottomSheet.show(context); 
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF4DB6AC),
                              child: Icon(locationIcon, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Entregar a',
                                    style: TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          locationText,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF1E3A8A),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                        color: Color(0xFF1E3A8A),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red[50],
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const CustomerSearchBar(), 
              const PromoBannersCarousel(),
              const QuickCategories(), 
              const SizedBox(height: 16),
              const ProductGrid(), 
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  void _showPickUpModal(BuildContext context, Address address) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.storefront, size: 60, color: Colors.orange.shade400),
              const SizedBox(height: 16),
              const Text(
                '¡Estás un poco lejos! 🛵',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Por el momento nuestros repartidores no llegan a esta dirección. ¿Qué te gustaría hacer?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9A826),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(modalContext);
                    BranchPickerPickupBottomSheet.show(context);
                  },
                  child: const Text(
                    'Pasar a recoger a sucursal',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                  child: const Text(
                    'Elegir otra dirección',
                    style: TextStyle(color: Color(0xFF1E3A8A), fontSize: 16, fontWeight: FontWeight.bold),
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