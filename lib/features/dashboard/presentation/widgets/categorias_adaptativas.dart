import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'categoria_card.dart';
import 'categoria_list_tile.dart';

class CategoriasAdaptativas extends StatelessWidget {
  final List<Categoria> categorias;
  final void Function(Categoria) onTap;

  const CategoriasAdaptativas({
    super.key,
    required this.categorias,
    required this.onTap,
  });

  // 🌟 Umbral: 4 o menos -> lista alargada. Más de 4 -> grid 2 columnas
  static const int _umbralLista = 4;

  @override
  Widget build(BuildContext context) {
    if (categorias.length <= _umbralLista) {
      return _buildLista();
    }
    return _buildGrid();
  }

  Widget _buildLista() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: categorias.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final categoria = categorias[index];
        return CategoriaListTile(
          categoria: categoria,
          onTap: () => onTap(categoria),
        );
      },
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.9,
      ),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        final categoria = categorias[index];
        return CategoriaCard(
          categoria: categoria,
          onTap: () => onTap(categoria),
        );
      },
    );
  }
}