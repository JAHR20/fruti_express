import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/use_cases/get_coupons_use_case.dart';
import '../../domain/use_cases/create_coupon_use_case.dart';
import '../../domain/use_cases/update_coupon_use_case.dart';
import '../../domain/use_cases/change_coupon_status_use_case.dart';
import 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final GetCouponsUseCase _getCouponsUseCase;
  final CreateCouponUseCase _createCouponUseCase;
  final UpdateCouponUseCase _updateCouponUseCase;
  final ChangeCouponStatusUseCase _changeCouponStatusUseCase;

  CouponCubit({
    required GetCouponsUseCase getCouponsUseCase,
    required CreateCouponUseCase createCouponUseCase,
    required UpdateCouponUseCase updateCouponUseCase,
    required ChangeCouponStatusUseCase changeCouponStatusUseCase,
  }) : _getCouponsUseCase = getCouponsUseCase,
       _createCouponUseCase = createCouponUseCase,
       _updateCouponUseCase = updateCouponUseCase,
       _changeCouponStatusUseCase = changeCouponStatusUseCase,
       super(const CouponState());

  /// Carga inicial de cupones
  Future<void> loadCoupons(Profile currentUser) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getCouponsUseCase
        .execute(requester: currentUser, includeInactive: true)
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
      (list) {
        emit(
          state.copyWith(isLoading: false, coupons: list, errorMessage: null),
        );
      },
    );
  }

  /// Crea un nuevo cupón
  Future<void> createCoupon({
    required Profile currentUser,
    required Coupon coupon,
  }) async {
    emit(
      state.copyWith(
        isSavingOperation: true,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _createCouponUseCase
        .execute(currentUser: currentUser, coupon: coupon)
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
        emit(
          state.copyWith(isSavingOperation: false, operationSuccessful: true),
        );
        // Recargamos la lista para mostrar el nuevo registro
        await loadCoupons(currentUser);
      },
    );
  }

  /// Actualiza un cupón existente
  Future<void> updateCoupon({
    required Profile currentUser,
    required Coupon coupon,
  }) async {
    emit(
      state.copyWith(
        processingCouponId: coupon.id,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _updateCouponUseCase
        .execute(currentUser: currentUser, couponToEdit: coupon)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingCouponId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingCouponId: null, operationSuccessful: true),
        );
        // Recargamos la lista
        await loadCoupons(currentUser);
      },
    );
  }

  /// Desactiva o borra un cupón
  Future<void> changeCouponStatus({
    required Profile currentUser,
    required String couponId,
    required bool newState,
  }) async {
    emit(
      state.copyWith(
        processingCouponId: couponId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _changeCouponStatusUseCase
        .execute(
          currentUser: currentUser,
          couponId: couponId,
          newState: newState,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingCouponId: null,
            operationError: translateFailure(failure),
          ),
        );
      },
      (_) async {
        emit(
          state.copyWith(processingCouponId: null, operationSuccessful: true),
        );
        await loadCoupons(currentUser);
      },
    );
  }

  /// Búsqueda local en memoria
  void search(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  /// Cambia la pestaña de filtros (Todos, Activos, Inactivos)
  void changeTab(CouponsTab tab) {
    emit(state.copyWith(tab: tab));
  }
}
