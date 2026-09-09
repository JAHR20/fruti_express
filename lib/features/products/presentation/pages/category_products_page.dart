import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart'; 
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/customer_product_card.dart'; 
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart'; 
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_state.dart';

class CategoryProductsPage extends StatelessWidget { 
  final Category category; 

  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          category.name, // nombre -> name
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (state.products.isEmpty) { 
            return Center(
              child: Text(
                'Aún no hay productos en\n${category.name}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CustomerProductCard(product: state.products[index]);
            },
          );
        },
      ),
    );
  }
}