import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; 
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart'; 
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_category_routes.dart';
import 'package:go_router/go_router.dart';

class QuickCategories extends StatelessWidget { 
  const QuickCategories({super.key});

  void _openCategory(BuildContext context, Category category) { 
    final branchId = context.read<CartCubit>().state.branchId; 

    if (branchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona primero una dirección de entrega.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    context.pushNamed(
      ProductCategoryRoutes.name,
      extra: {'category': category, 'branchId': branchId},
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = [ 
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
          child: BlocBuilder<CategoryCubit, CategoryState>(
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

              if (state.categories.isEmpty) { 
                return const Center(child: Text('No hay categorías'));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  final color = colors[index % colors.length];

                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () => _openCategory(context, category),
                      borderRadius: BorderRadius.circular(16),
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
                                category.imageUrl != null &&
                                    category.imageUrl!.isNotEmpty
                                ? Image.network(
                                    category.imageUrl!,
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
                            category.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
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