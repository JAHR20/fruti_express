import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/create_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/change_category_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/update_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/get_active_categories_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/upload_category_image_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:image_picker/image_picker.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CreateCategoryUseCase _createCategoryUseCase;
  final ChangeCategoryStatusUseCase _changeCategoryStatusUseCase;
  final UpdateCategoryUseCase _updateCategoryUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetActiveCategoriesUseCase _getActiveCategoriesUseCase;
  final UploadCategoryImageUseCase _uploadCategoryImageUseCase;

  CategoryCubit({
    required CreateCategoryUseCase createCategoryUseCase,
    required ChangeCategoryStatusUseCase changeCategoryStatusUseCase,
    required UpdateCategoryUseCase updateCategoryUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetActiveCategoriesUseCase getActiveCategoriesUseCase,
    required UploadCategoryImageUseCase uploadCategoryImageUseCase,
  })  : _uploadCategoryImageUseCase = uploadCategoryImageUseCase,
        _getCategoriesUseCase = getCategoriesUseCase,
        _updateCategoryUseCase = updateCategoryUseCase,
        _changeCategoryStatusUseCase = changeCategoryStatusUseCase,
        _createCategoryUseCase = createCategoryUseCase,
        _getActiveCategoriesUseCase = getActiveCategoriesUseCase,
        super(const CategoryState());

  Future<void> loadCategories(Profile currentUser) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getCategoriesUseCase.execute().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: translateFailure(failure)),
        );
      },
      (list) {
        emit(
          state.copyWith(
            isLoading: false,
            categories: list,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> loadActiveCategories() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getActiveCategoriesUseCase.execute().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: translateFailure(failure)),
        );
      },
      (categories) {
        emit(
          state.copyWith(
            isLoading: false,
            categories: categories,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> changeCategoryStatus({
    required Profile currentUser,
    required String categoryId,
    required bool newState,
  }) async {
    emit(
      state.copyWith(
        processingCategoryId: categoryId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _changeCategoryStatusUseCase
        .execute(
          currentUser: currentUser,
          categoryId: categoryId,
          newState: newState,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingCategoryId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingCategoryId: null, operationSuccessful: true),
        );

        await loadCategories(currentUser);
      },
    );
  }

  Future<void> createCategory({
    required Profile currentUser,
    required String name,
    String? description,
    XFile? selectedImage,
    String? parentCategoryId,
  }) async {
    emit(
      state.copyWith(
        isSavingOperation: true,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    String? finalImageUrl;

    if (selectedImage != null) {
      final uploadResult = await _uploadCategoryImageUseCase
          .execute(file: selectedImage, uniqueIdentifier: name)
          .run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              isSavingOperation: false,
              operationError: 'Error al subir imagen: ${translateFailure(failure)}',
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

    final result = await _createCategoryUseCase
        .execute(
          currentUser: currentUser,
          name: name,
          description: description,
          imageUrl: finalImageUrl,
          parentCategoryId: parentCategoryId,
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
      (_) async {
        emit(state.copyWith(isSavingOperation: false, operationSuccessful: true));
        await loadCategories(currentUser);
      },
    );
  }

  Future<void> updateCategory({
    required Profile currentUser,
    required String categoryId,
    String? name,
    String? description,
    XFile? selectedImage,
    String? parentCategoryId,
    bool? isActive,
  }) async {
    emit(
      state.copyWith(
        processingCategoryId: categoryId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    String? finalImageUrl;

    if (selectedImage != null) {
      final identifier = name ?? categoryId;

      final uploadResult = await _uploadCategoryImageUseCase
          .execute(
            file: selectedImage,
            uniqueIdentifier: identifier,
          )
          .run();

      final imageFailed = uploadResult.fold(
        (failure) {
          emit(
            state.copyWith(
              processingCategoryId: null,
              operationError:
                  'Error al actualizar la imagen: ${translateFailure(failure)}',
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

    final result = await _updateCategoryUseCase
        .execute(
          currentUser: currentUser,
          categoryId: categoryId,
          name: name,
          description: description,
          imageUrl: finalImageUrl,
          parentCategoryId: parentCategoryId,
          isActive: isActive,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingCategoryId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingCategoryId: null, operationSuccessful: true),
        );
        await loadCategories(currentUser);
      },
    );
  }
}