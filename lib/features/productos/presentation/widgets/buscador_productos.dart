import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';

class BuscadorProductos extends StatefulWidget {
  const BuscadorProductos({super.key});

  @override
  State<BuscadorProductos> createState() => _BuscadorProductosState();
}

class _BuscadorProductosState extends State<BuscadorProductos> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    // Si el usuario sigue escribiendo, cancelamos el temporizador anterior
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Esperamos 500 milisegundos antes de disparar la búsqueda
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim().isNotEmpty) {
        context.read<ProductosCubit>().buscarProductoPorNombre(query);
      } else {
        context.read<ProductosCubit>().cargarTodosLosProductos();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Buscar producto por nombre...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}