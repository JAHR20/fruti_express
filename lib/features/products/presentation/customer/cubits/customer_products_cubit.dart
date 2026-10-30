import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/search_products_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_product_by_name_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/watch_inventory_changes_use_case.dart';
import 'customer_products_state.dart';

class CustomerProductsCubit extends Cubit<CustomerProductsState> {
  final GetProductByIdUseCase _getProductByIdUseCase;
  final GetProductByNameUseCase _getProductByNameUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final SearchProductsUseCase _searchProductsUseCase;
  final GetProductsByBranchUseCase _getProductsByBranchUseCase;
  final WatchInventoryChangesUseCase _watchInventoryChangesUseCase;

  CustomerProductsCubit({
    required GetProductByIdUseCase getProductByIdUseCase,
    required GetProductByNameUseCase getProductByNameUseCase,
    required GetProductsByCategoryUseCase getProductsByCategoryUseCase,
    required SearchProductsUseCase searchProductsUseCase,
    required GetProductsByBranchUseCase getProductsByBranchUseCase,
    required WatchInventoryChangesUseCase watchInventoryChangesUseCase,
  }) : _getProductByIdUseCase = getProductByIdUseCase,
       _getProductByNameUseCase = getProductByNameUseCase,
       _getProductsByCategoryUseCase = getProductsByCategoryUseCase,
       _searchProductsUseCase = searchProductsUseCase,
       _getProductsByBranchUseCase = getProductsByBranchUseCase,
       _watchInventoryChangesUseCase = watchInventoryChangesUseCase,
       super(const CustomerProductsState());

  int _currentSearchId = 0;
  StreamSubscription<void>? _inventorySubscription;
  String? _listeningBranchId;

  Future<void> loadProductsByBranch(String branchId) async {
    _listenToInventoryRealtime(branchId);
    emit(state.copyWith(isLoading: true, errorMessage: null, branchId: branchId,));

    final result = await _getProductsByBranchUseCase.execute(branchId).run();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (products) => emit(state.copyWith(isLoading: false, products: products, errorMessage: null)),
    );
  }

  Future<void> search(String query, String branchId) async {
    final text = query.trim();
    final mySearchId = ++_currentSearchId;

    if (text.isEmpty) {
      emit(state.copyWith(products: const [], errorMessage: null, isLoading: false));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _searchProductsUseCase.execute(text, branchId).run();

    if (mySearchId != _currentSearchId) return;

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (products) => emit(state.copyWith(isLoading: false, products: products, errorMessage: null)),
    );
  }

  Future<void> loadProductsByCategory(String categoryId, String branchId) async {
    _listenToInventoryRealtime(branchId);
    emit(state.copyWith(isLoading: true, currentCategoryId: categoryId, errorMessage: null));

    final result = await _getProductsByCategoryUseCase.execute(categoryId, branchId).run();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (products) => emit(state.copyWith(isLoading: false, products: products, currentCategoryId: categoryId, errorMessage: null)),
    );
  }

  Future<void> loadProductById(String id) async {
    emit(state.copyWith(isLoading: true, productDetail: null, errorMessage: null));

    final result = await _getProductByIdUseCase.execute(id).run();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (product) => emit(state.copyWith(isLoading: false, productDetail: product, errorMessage: null)),
    );
  }

  Future<void> searchProductByName(String name) async {
    final text = name.trim();
    if (text.isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getProductByNameUseCase.execute(text).run();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (product) => emit(state.copyWith(isLoading: false, products: [product], productDetail: product, errorMessage: null)),
    );
  }

  void _listenToInventoryRealtime(String branchId) {
    if (_listeningBranchId == branchId) return;
    _listeningBranchId = branchId;

    _inventorySubscription?.cancel();
    _inventorySubscription = _watchInventoryChangesUseCase.execute(branchId).listen((_) {
      if (state.currentCategoryId != null) {
        loadProductsByCategory(state.currentCategoryId!, branchId);
      } else {
        loadProductsByBranch(branchId);
      }
    });
  }

  @override
  Future<void> close() {
    _inventorySubscription?.cancel();
    return super.close();
  }
}