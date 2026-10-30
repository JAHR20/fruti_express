import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/app_search_bar.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_grid.dart';

class SearchPage extends StatefulWidget {
  final String branchId;

  const SearchPage({super.key, required this.branchId});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {});

    if (value.trim().isNotEmpty) {
      context.read<CustomerProductsCubit>().search(
        value.trim(),
        widget.branchId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: AppSearchBar(
          hintText: 'Buscar frutas, chiles...',
          controller: _controller,
          focusNode: _focusNode,
          autofocus: true,
          padding: const EdgeInsets.only(right: 16.0, top: 4.0, bottom: 4.0),
          onChanged: _onSearchChanged,
        ),
      ),
      body: _controller.text.isEmpty
          ? _buildInitialSearchState(colorScheme)
          : _buildSearchResults(colorScheme),
    );
  }

  // Estado inicial scrolleable con RefreshIndicator
  Widget _buildInitialSearchState(ColorScheme colorScheme) {
    return RefreshIndicator(
      color: colorScheme.primary,
      onRefresh: () async {
        // Al estar vacío, solo aseguramos el comportamiento del refresh
        await Future.delayed(const Duration(milliseconds: 300));
      },
      child: const CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: AnimatedEmptyState(
              icon: Icon(Icons.search),
              title: 'Busca tus favoritos',
              subtitle: 'Escribe el nombre de la fruta o verdura\nque deseas encontrar.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(ColorScheme colorScheme) {
    // Helper seguro para reintentar la búsqueda actual
    Future<void> handleRefresh() async {
      if (_controller.text.trim().isNotEmpty) {
        await context.read<CustomerProductsCubit>().search(
          _controller.text.trim(),
          widget.branchId,
        );
      }
    }

    return BlocBuilder<CustomerProductsCubit, CustomerProductsState>(
      builder: (context, state) {
        if (state.isLoading && state.products.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: colorScheme.primary),
          );
        }

        // Estado de error ahora scrolleable
        if (state.errorMessage != null && state.products.isEmpty) {
          return RefreshIndicator(
            color: colorScheme.primary,
            onRefresh: handleRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(color: colorScheme.error),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Estado sin resultados con soporte de pull-to-refresh
        if (state.products.isEmpty) {
          return RefreshIndicator(
            color: colorScheme.primary,
            onRefresh: handleRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AnimatedEmptyState(
                    icon: const Icon(Icons.search_off_outlined),
                    title: 'Sin resultados',
                    subtitle: 'No encontramos nada para "${_controller.text}".\nIntenta con otro término.',
                  ),
                ),
              ],
            ),
          );
        }
        
        // Resultados con datos (asumiendo que ProductGrid maneja su propio scroll/refresh)
        return const ProductGrid();
      },
    );
  }
}