import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/widgets/customer_category_list_tile.dart';
import 'category_card.dart'; 

class AdaptiveCategories extends StatelessWidget { 
  final List<Category> categories; 
  final void Function(Category) onTap;

  const AdaptiveCategories({
    super.key,
    required this.categories,
    required this.onTap,
  });

  static const int _listThreshold = 4; 

  @override
  Widget build(BuildContext context) {
    if (categories.length <= _listThreshold) {
      return _buildList(); 
    }
    return _buildGrid();
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CustomerCategoryListTile( 
          category: category,
          onTap: () => onTap(category),
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
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard( 
          category: category,
          onTap: () => onTap(category),
        );
      },
    );
  }
}