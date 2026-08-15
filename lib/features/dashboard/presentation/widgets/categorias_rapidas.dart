import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';

class CategoriasRapidas extends StatelessWidget {
  const CategoriasRapidas({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = [
      const Color(0xFF4DB6AC),
      const Color(0xFF5C6BC0),
      const Color(0xFFEF5350),
      const Color(0xFFFFCA28),
      const Color(0xFF8D6E63),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categorías',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: BlocBuilder<CategoriaCubit, CategoriaState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.errorMessage != null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                );
              }

              if (state.categorias.isEmpty) {
                return const Center(child: Text('No hay categorías'));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: state.categorias.length,
                itemBuilder: (context, index) {
                  final categoria = state.categorias[index];
                  final color = colores[index % colores.length];

                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child:
                              categoria.imagenUrl != null &&
                                  categoria.imagenUrl!.isNotEmpty
                              ? Image.network(
                                  categoria.imagenUrl!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.category,
                                  color: Colors.white,
                                  size: 32,
                                ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categoria.nombre,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}