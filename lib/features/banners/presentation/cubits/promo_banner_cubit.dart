import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';

import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/update_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/change_promo_banner_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/create_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/delete_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/get_active_promo_banners_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/get_all_promo_banners_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

import 'promo_banner_state.dart';

class PromoBannerCubit extends Cubit<PromoBannerState> {
  final GetActivePromoBannersUseCase _getActivePromoBannersUseCase;
  final GetAllPromoBannersUseCase _getAllPromoBannersUseCase;
  final CreatePromoBannerUseCase _createPromoBannerUseCase;
  final UpdatePromoBannerUseCase _updatePromoBannerUseCase;
  final ChangePromoBannerStatusUseCase _changePromoBannerStatusUseCase;
  final DeletePromoBannerUseCase _deletePromoBannerUseCase;

  PromoBannerCubit({
    required GetActivePromoBannersUseCase getActivePromoBannersUseCase,
    required GetAllPromoBannersUseCase getAllPromoBannersUseCase,
    required CreatePromoBannerUseCase createPromoBannerUseCase,
    required UpdatePromoBannerUseCase updatePromoBannerUseCase,
    required ChangePromoBannerStatusUseCase changePromoBannerStatusUseCase,
    required DeletePromoBannerUseCase deleteBanner,
  }) : _getActivePromoBannersUseCase = getActivePromoBannersUseCase,
       _getAllPromoBannersUseCase = getAllPromoBannersUseCase,
       _createPromoBannerUseCase = createPromoBannerUseCase,
       _updatePromoBannerUseCase = updatePromoBannerUseCase,
       _changePromoBannerStatusUseCase = changePromoBannerStatusUseCase,
       _deletePromoBannerUseCase = deleteBanner,
       super(const PromoBannerState());

  Future<void> loadActiveBanners() async { 
    emit(
      state.copyWith(isLoading: true, errorMessage: null, operationError: null),
    );

    final result = await _getActivePromoBannersUseCase.execute().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: translateFailure(failure)),
        );
      },
      (banners) {
        emit(
          state.copyWith(
            isLoading: false,
            banners: banners,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> loadAllBanners({required AppUser currentUser}) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, operationError: null),
    );

    final result = await _getAllPromoBannersUseCase
        .execute(currentUser: currentUser)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: translateFailure(failure)),
        );
      },
      (banners) {
        emit(
          state.copyWith(
            isLoading: false,
            banners: banners,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> createBanner({ 
    required AppUser currentUser,
    required PromoBanner banner,
    File? imageFile, 
  }) async {
    emit(state.copyWith(operationError: null, isOperationSuccessful: false));

    final result = await _createPromoBannerUseCase
        .execute(
          currentUser: currentUser,
          banner: banner,
          imageFile: imageFile,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            operationError: translateFailure(failure),
            isOperationSuccessful: false,
          ),
        );
      },
      (_) {
        emit(state.copyWith(operationError: null, isOperationSuccessful: true));
        loadAllBanners(currentUser: currentUser); 
      },
    );
  }

  Future<void> updateBanner({ 
    required AppUser currentUser,
    required PromoBanner banner,
    File? imageFile,
  }) async {
    emit(
      state.copyWith(
        processingBannerId: banner.id,
        operationError: null,
        isOperationSuccessful: false,
      ),
    );

    final result = await _updatePromoBannerUseCase
        .execute(
          currentUser: currentUser,
          banner: banner,
          imageFile: imageFile,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingBannerId: null,
            operationError: translateFailure(failure),
            isOperationSuccessful: false,
          ),
        );
      },
      (updatedBanner) { 
        final newBanners = state.banners.map((currentBanner) {
          if (currentBanner.id == updatedBanner.id) {
            return updatedBanner;
          }
          return currentBanner;
        }).toList();

        emit(
          state.copyWith(
            banners: newBanners,
            processingBannerId: null,
            operationError: null,
            isOperationSuccessful: true,
          ),
        );
      },
    );
  }

  Future<void> changeBannerStatus({ 
    required AppUser currentUser,
    required String id,
    required bool isActive, 
  }) async {
    emit(
      state.copyWith(
        processingBannerId: id,
        operationError: null,
        isOperationSuccessful: false,
      ),
    );

    final result = await _changePromoBannerStatusUseCase
        .execute(currentUser: currentUser, id: id, isActive: isActive)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingBannerId: null,
            operationError: translateFailure(failure),
            isOperationSuccessful: false,
          ),
        );
      },
      (_) {
        final newBanners = state.banners.map((banner) {
          if (banner.id == id) {
            return banner.copyWith(isActive: isActive); 
          }
          return banner;
        }).toList();

        emit(
          state.copyWith(
            banners: newBanners,
            processingBannerId: null,
            operationError: null,
            isOperationSuccessful: true,
          ),
        );
      },
    );
  }

  Future<void> deleteBanner({ 
    required AppUser currentUser,
    required String id,
  }) async {
    emit(
      state.copyWith(
        processingBannerId: id,
        operationError: null,
        isOperationSuccessful: false,
      ),
    );

    final result = await _deletePromoBannerUseCase
        .execute(currentUser: currentUser, id: id)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingBannerId: null,
            operationError: translateFailure(failure),
            isOperationSuccessful: false,
          ),
        );
      },
      (_) {
        final newBanners = state.banners
            .where((banner) => banner.id != id)
            .toList();

        emit(
          state.copyWith(
            banners: newBanners,
            processingBannerId: null,
            operationError: null,
            isOperationSuccessful: true,
          ),
        );
      },
    );
  }

  void clearOperationResult() { 
    emit(state.copyWith(operationError: null, isOperationSuccessful: false));
  }
}