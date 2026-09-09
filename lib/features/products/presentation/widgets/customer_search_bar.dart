import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart'; 
import 'package:go_router/go_router.dart';

class CustomerSearchBar extends StatelessWidget { 
  final VoidCallback? onTap;

  const CustomerSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        readOnly: true,
        onTap: () {
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

          context.pushNamed(ProductRoutes.searchName, extra: branchId); 
        },
        decoration: InputDecoration(
          hintText: 'Buscar manzanas, chiles secos...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.mic_none, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          // Sombra sutil
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}