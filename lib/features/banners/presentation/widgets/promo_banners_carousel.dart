// lib/features/banners/presentation/widgets/promo_banners_carousel.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_button_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_action_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_renderer.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_offers_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PromoBannersCarousel extends StatelessWidget {
  const PromoBannersCarousel({super.key});

  static final _uuidPattern = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );

  /// Destinos permitidos para un botón. El administrador solo elige entre
  /// ellos: nunca se navega a una ruta o URL escrita por él.
  void _onButtonTap(BuildContext context, BannerButtonConfig button) {
    switch (button.actionType) {
      case BannerActionType.promotions:
        final branchId = context.read<CartCubit>().state.branchId;
        if (branchId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Elige una dirección para ver las ofertas'),
            ),
          );
          return;
        }

        // Categoría opcional: si no es un id válido, se muestran todas las ofertas.
        final value = (button.actionValue ?? '').trim();
        final categoryId = _uuidPattern.hasMatch(value) ? value : null;

        context.pushNamed(
          ProductOffersRoutes.name,
          extra: {
            'branchId': branchId,
            if (categoryId != null) 'categoryId': categoryId,
          },
        );
      default:
        // Las demás acciones todavía no tienen destino: no hacen nada.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBannerCubit, PromoBannerState>(
      builder: (context, state) {
        final activeBanners = state.banners.where((b) => b.isActive).toList();

        if (activeBanners.isEmpty) return const SizedBox.shrink();

        return Container(
          height: 140,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: activeBanners.length,
            itemBuilder: (context, index) {
              final banner = activeBanners[index];

              // 280 de ancho en formato 2:1 = 140 de alto, igual que el contenedor.
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: 280,
                  child: PromoBannerRenderer(
                    banner: banner,
                    format: BannerFormat.carouselCard,
                    resolveImageUrl: (path) => sl<SupabaseClient>().storage
                        .from('imagenes_banners')
                        .getPublicUrl(path),
                    onButtonTap: (button) => _onButtonTap(context, button),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
