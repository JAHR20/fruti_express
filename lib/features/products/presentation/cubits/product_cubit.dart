import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/search_products_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/change_product_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_product_by_name_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_all_products_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/upload_product_image_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final UpdateProductUseCase _updateProductUseCase;
  final ChangeProductStatusUseCase _changeProductStatusUseCase;
  final CreateProductUseCase _createProductUseCase;
  final GetProductByIdUseCase _getProductByIdUseCase;
  final GetProductByNameUseCase _getProductByNameUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final UploadProductImageUseCase _uploadProductImageUseCase;
  final SearchProductsUseCase _searchProductsUseCase;
  final GetProductsByBranchUseCase _getProductsByBranchUseCase;

  ProductCubit({
    required UpdateProductUseCase updateProductUseCase,
    required ChangeProductStatusUseCase changeProductStatusUseCase,
    required CreateProductUseCase createProductUseCase,
    required GetProductByIdUseCase getProductByIdUseCase,
    required GetProductByNameUseCase getProductByNameUseCase,
    required GetProductsByCategoryUseCase getProductsByCategoryUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
    required UploadProductImageUseCase uploadProductImageUseCase,
    required SearchProductsUseCase searchProductsUseCase,
    required GetProductsByBranchUseCase getProductsByBranchUseCase,
  }) : _updateProductUseCase = updateProductUseCase,
       _changeProductStatusUseCase = changeProductStatusUseCase,
       _createProductUseCase = createProductUseCase,
       _getProductByIdUseCase = getProductByIdUseCase,
       _getProductByNameUseCase = getProductByNameUseCase,
       _getProductsByCategoryUseCase = getProductsByCategoryUseCase,
       _getAllProductsUseCase = getAllProductsUseCase,
       _uploadProductImageUseCase = uploadProductImageUseCase,
       _searchProductsUseCase = searchProductsUseCase,
       _getProductsByBranchUseCase = getProductsByBranchUseCase,
       super(const ProductState());

  int _currentSearchId = 0;

  Future<void> loadAllProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getAllProductsUseCase.execute().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            isLoading: false,
            products: products,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> loadProductsByBranch(String branchId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getProductsByBranchUseCase.execute(branchId).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            isLoading: false,
            products: products,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> search(String query, String branchId) async {
    final text = query.trim();
    final mySearchId = ++_currentSearchId;

    if (text.isEmpty) {
      emit(
        state.copyWith(
          products: const [],
          errorMessage: null,
          isLoading: false,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _searchProductsUseCase.execute(text, branchId).run();

    if (mySearchId != _currentSearchId) return;

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            isLoading: false,
            products: products,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> loadProductsByCategory(
    String categoryId,
    String branchId,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        currentCategoryId: categoryId,
        errorMessage: null,
      ),
    );

    final result = await _getProductsByCategoryUseCase
        .execute(categoryId, branchId)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            isLoading: false,
            products: products,
            currentCategoryId: categoryId,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> loadProductById(String id) async {
    emit(
      state.copyWith(isLoading: true, productDetail: null, errorMessage: null),
    );

    final result = await _getProductByIdUseCase.execute(id).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (product) {
        emit(
          state.copyWith(
            isLoading: false,
            productDetail: product,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> searchProductByName(String name) async {
    final text = name.trim();

    if (text.isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getProductByNameUseCase.execute(text).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (product) {
        emit(
          state.copyWith(
            isLoading: false,
            products: [product],
            productDetail: product,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> createProduct({
    required Profile currentUser,
    required String categoryId,
    required String name,
    String? description,
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    File? imageFile,
  }) async {
    emit(
      state.copyWith(
        isSavingOperation: true,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    String? finalImageUrl;

    if (imageFile != null) {
      final realExtension = imageFile.path.split('.').last.toLowerCase();
      final uniqueName =
          '${DateTime.now().millisecondsSinceEpoch}_'
          '${name.replaceAll(' ', '_')}.$realExtension';

      final uploadResult = await _uploadProductImageUseCase
          .execute(imageFile, uniqueName)
          .run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              isSavingOperation: false,
              operationError:
                  'Error al subir imagen: ${translateFailure(failure)}',
            ),
          );
          return true;
        },
        (url) {
          finalImageUrl = url;
          return false;
        },
      );

      if (imageFailed) return;
    }

    final result = await _createProductUseCase
        .execute(
          currentUser: currentUser,
          categoryId: categoryId,
          name: name,
          description: description,
          currentPrice: currentPrice,
          comparisonPrice: comparisonPrice,
          measurementUnit: measurementUnit,
          imageUrl: finalImageUrl,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isSavingOperation: false,
            operationError: translateFailure(failure),
          ),
        );
      },
      (product) {
        emit(
          state.copyWith(
            isSavingOperation: false,
            operationSuccessful: true,
            products: [...state.products, product],
          ),
        );
      },
    );
  }

  Future<void> updateProduct({
    required Profile currentUser,
    required String productId,
    required String categoryId,
    required String name,
    String? description,
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    String? imageUrl,
    required bool isActive,
    File? imageFile,
  }) async {
    emit(
      state.copyWith(
        processingProductId: productId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    String? finalUrl = imageUrl;

    if (imageFile != null) {
      final realExtension = imageFile.path.split('.').last.toLowerCase();
      final uniqueName =
          '${DateTime.now().millisecondsSinceEpoch}_'
          '${name.replaceAll(' ', '_')}.$realExtension';

      final uploadResult = await _uploadProductImageUseCase
          .execute(imageFile, uniqueName)
          .run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              processingProductId: null,
              operationError:
                  'Error al subir imagen: ${translateFailure(failure)}',
            ),
          );
          return true;
        },
        (url) {
          finalUrl = url;
          return false;
        },
      );

      if (imageFailed) return;
    }

    final result = await _updateProductUseCase
        .execute(
          currentUser: currentUser,
          productId: productId,
          categoryId: categoryId,
          name: name,
          description: description,
          currentPrice: currentPrice,
          comparisonPrice: comparisonPrice,
          measurementUnit: measurementUnit,
          imageUrl: finalUrl,
          isActive: isActive,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingProductId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingProductId: null, operationSuccessful: true),
        );

        await loadAllProducts();
      },
    );
  }

  Future<void> changeProductStatus({
    required Profile currentUser,
    required String productId,
    required bool newState,
  }) async {
    emit(
      state.copyWith(
        processingProductId: productId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _changeProductStatusUseCase
        .execute(
          currentUser: currentUser,
          productId: productId,
          newState: newState,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingProductId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingProductId: null, operationSuccessful: true),
        );

        await loadAllProducts();
      },
    );
  }
}
