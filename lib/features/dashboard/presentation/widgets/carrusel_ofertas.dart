import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_state.dart';

class CarruselOfertas extends StatelessWidget {
  const CarruselOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        final bannersActivos = state.banners.where((b) => b.activo).toList();

        if (bannersActivos.isEmpty) return const SizedBox.shrink();

        return Container(
          height: 140,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: bannersActivos.length,
            itemBuilder: (context, index) {
              final banner = bannersActivos[index];
              final colorInicio = _hexToColor(banner.colorInicio);
              final colorFin = _hexToColor(banner.colorFin);

              return Container(
                width: 280,
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [colorInicio, colorFin],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: banner.imagenUrl != null
                      ? DecorationImage(
                          image: NetworkImage(banner.imagenUrl!),
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
                      banner.titulo,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      banner.descuento,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      banner.subtitulo,
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
