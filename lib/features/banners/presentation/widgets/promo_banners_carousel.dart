import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_state.dart';

class PromoBannersCarousel extends StatelessWidget { 
  const PromoBannersCarousel({super.key});

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
              final startColor = _hexToColor(banner.startColor); 
              final endColor = _hexToColor(banner.endColor); 

              return Container(
                width: 280,
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [startColor, endColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: banner.imageUrl != null 
                      ? DecorationImage(
                          image: NetworkImage(banner.imageUrl!),
                          fit: BoxFit.cover,
                          opacity: 0.15,
                        )
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.title, // titulo -> title
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      banner.discount,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      banner.subtitle, 
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}