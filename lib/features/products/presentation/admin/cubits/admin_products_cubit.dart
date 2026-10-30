import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/change_product_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_all_products_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/upload_product_image_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'admin_products_state.dart';

class AdminProductsCubit extends Cubit<AdminProductsState> {
  final UpdateProductUseCase _updateProductUseCase;
  final ChangeProductStatusUseCase _changeProductStatusUseCase;
  final CreateProductUseCase _createProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final UploadProductImageUseCase _uploadProductImageUseCase;

  AdminProductsCubit({
    required UpdateProductUseCase updateProductUseCase,
    required ChangeProductStatusUseCase changeProductStatusUseCase,
    required CreateProductUseCase createProductUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
    required UploadProductImageUseCase uploadProductImageUseCase,
  }) : _updateProductUseCase = updateProductUseCase,
       _changeProductStatusUseCase = changeProductStatusUseCase,
       _createProductUseCase = createProductUseCase,
       _getAllProductsUseCase = getAllProductsUseCase,
       _uploadProductImageUseCase = uploadProductImageUseCase,
       super(const AdminProductsState());

  List<Product> _allProductsCache = [];
  Future<void> loadAllProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getAllProductsUseCase.execute().run();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: translateFailure(failure))),
      (products) {
      _allProductsCache = products;
      emit(state.copyWith(isLoading: false, products: products, errorMessage: null));
    },
    );
  }

  void filterProductsByName(String query) {
  final text = query.trim().toLowerCase();

  if (text.isEmpty) {
    emit(state.copyWith(products: _allProductsCache));
    return;
  }

  final filtered = _allProductsCache.where((product) {
    return product.name.toLowerCase().contains(text) ||
           (product.id!.toLowerCase().contains(text));
  }).toList();

  emit(state.copyWith(products: filtered));
}

  Future<void> createProduct({
    required AppUser currentUser,
    required String categoryId,
    required String name,
    String? description,
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    File? imageFile,
  }) async {
    emit(state.copyWith(isSavingOperation: true, operationError: null, operationSuccessful: false));

    String? finalImageUrl;

    if (imageFile != null) {
      final realExtension = imageFile.path.split('.').last.toLowerCase();
      final uniqueName = '${DateTime.now().millisecondsSinceEpoch}_${name.replaceAll(' ', '_')}.$realExtension';

      final uploadResult = await _uploadProductImageUseCase.execute(imageFile, uniqueName).run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(state.copyWith(isSavingOperation: false, operationError: translateFailure(failure)));
          return true;
        },
        (url) {
          finalImageUrl = url;
          return false;
        },
      );

      if (imageFailed) return;
    }

    final result = await _createProductUseCase.execute(
      currentUser: currentUser,
      categoryId: categoryId,
      name: name,
      description: description,
      currentPrice: currentPrice,
      comparisonPrice: comparisonPrice,
      measurementUnit: measurementUnit,
      imageUrl: finalImageUrl,
    ).run();

    result.fold(
      (failure) => emit(state.copyWith(isSavingOperation: false, operationError: translateFailure(failure))),
      (product) => emit(state.copyWith(isSavingOperation: false, operationSuccessful: true, products: [...state.products, product])),
    );
  }

  Future<void> updateProduct({
    required AppUser currentUser,
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
    emit(state.copyWith(processingProductId: productId, operationError: null, operationSuccessful: false));

    String? finalUrl = imageUrl;

    if (imageFile != null) {
      final realExtension = imageFile.path.split('.').last.toLowerCase();
      final uniqueName = '${DateTime.now().millisecondsSinceEpoch}_${name.replaceAll(' ', '_')}.$realExtension';

      final uploadResult = await _uploadProductImageUseCase.execute(imageFile, uniqueName).run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(state.copyWith(processingProductId: null, operationError: translateFailure(failure)));
          return true;
        },
        (url) {
          finalUrl = url;
          return false;
        },
      );

      if (imageFailed) return;
    }

    final result = await _updateProductUseCase.execute(
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
    ).run();

    result.fold(
      (failure) => emit(state.copyWith(processingProductId: null, operationError: translateFailure(failure))),
      (_) async {
        emit(state.copyWith(processingProductId: null, operationSuccessful: true));
        await loadAllProducts();
      },
    );
  }

  Future<void> changeProductStatus({
    required AppUser currentUser,
    required String productId,
    required bool newState,
  }) async {
    emit(state.copyWith(processingProductId: productId, operationError: null, operationSuccessful: false));

    final result = await _changeProductStatusUseCase.execute(
      currentUser: currentUser,
      productId: productId,
      newState: newState,
    ).run();

    result.fold(
      (failure) => emit(state.copyWith(processingProductId: null, operationError: translateFailure(failure))),
      (_) async {
        emit(state.copyWith(processingProductId: null, operationSuccessful: true));
        await loadAllProducts();
      },
    );
  }
}