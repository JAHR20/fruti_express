import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/cuadricula_productos.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';

class BusquedaPage extends StatefulWidget {
  // 🌟 1. Pedimos la sucursal activa en el constructor
  final String sucursalId; 

  const BusquedaPage({super.key, required this.sucursalId});

  @override
  State<BusquedaPage> createState() => _BusquedaPageState();
}

class _BusquedaPageState extends State<BusquedaPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); 
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String valor) {
    setState(() {}); 

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted && valor.trim().isNotEmpty) {
        // 🚀 2. ¡La magia! Pasamos el texto Y el ID de la sucursal que guardamos arriba
        context.read<ProductosCubit>().buscar(valor.trim(), widget.sucursalId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Buscar frutas, chiles...',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: InputBorder.none,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                      setState(() {});
                    },
                  )
                : null,
          ),
          onChanged: _onSearchChanged, 
        ),
      ),
      body: _controller.text.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Busca tus productos favoritos',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
            child: BlocBuilder<ProductosCubit, ProductosState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: CircularProgressIndicator(color: Color(0xFFF9A826)),
                    ),
                  ),
                  error: (message) => Center(
                    child: Text(
                      message, 
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  loaded: (productos, _, __) {
                    if (productos.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            'No encontramos productos con ese nombre 😥',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    }
                    
                    return const CuadriculaProductos(); 
                  },
                );
              },
            ),
          ),
    );
  }
}