import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/use_cases/get_selected_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/use_cases/save_selected_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/covering_branch.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/find_covering_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';

import 'customer_coordinator_state.dart';

class CustomerCoordinatorCubit extends Cubit<CustomerCoordinatorState> {
  final CartCubit _cartCubit;
  final CustomerProductsCubit _customerProductsCubit;
  final BranchCubit _branchCubit;
  final CustomerShippingCubit _customerShippingCubit;
  final AddressCubit _addressCubit;

  final GetSelectedAddressUseCase _getSelectedAddressUseCase;
  final SaveSelectedAddressUseCase _saveSelectedAddressUseCase;
  final FindCoveringBranchUseCase _findCoveringBranchUseCase;

  StreamSubscription? _branchSub;
  StreamSubscription? _shippingSub;
  StreamSubscription? _addressSub;

  bool _autoSelectionMade = false;
  bool _isRevalidatingBranch = false;

  CustomerCoordinatorCubit({
    required CartCubit cartCubit,
    required CustomerProductsCubit customerProductsCubit,
    required BranchCubit branchCubit,
    required CustomerShippingCubit customerShippingCubit,
    required AddressCubit addressCubit,
    required GetSelectedAddressUseCase getSelectedAddressUseCase,
    required SaveSelectedAddressUseCase saveSelectedAddressUseCase,
    required FindCoveringBranchUseCase findCoveringBranchUseCase,
  }) : _cartCubit = cartCubit,
       _customerProductsCubit = customerProductsCubit,
       _branchCubit = branchCubit,
       _customerShippingCubit = customerShippingCubit,
       _addressCubit = addressCubit,
       _getSelectedAddressUseCase = getSelectedAddressUseCase,
       _saveSelectedAddressUseCase = saveSelectedAddressUseCase,
       _findCoveringBranchUseCase = findCoveringBranchUseCase,
       super(const CustomerCoordinatorState.idle()) {
    _branchSub = _branchCubit.stream.listen((state) async {
      if (state.branches.isNotEmpty) {
        await _customerShippingCubit.loadBranchConfigurations(state.branches);
      }
      await _revalidateSelectedAddress();
    });

    _addressSub = _addressCubit.stream.listen((_) => _attemptAutoSelection());

    _shippingSub = _customerShippingCubit.stream.listen(
      (_) => _attemptAutoSelection(),
    );

    if (_branchCubit.state.branches.isNotEmpty) {
      _customerShippingCubit.loadBranchConfigurations(
        _branchCubit.state.branches,
      );
    }

    _attemptAutoSelection();
  }

  @override
  Future<void> close() {
    _branchSub?.cancel();
    _shippingSub?.cancel();
    _addressSub?.cancel();
    return super.close();
  }

  Future<void> _attemptAutoSelection() async {
    if (_autoSelectionMade) return;

    final addresses = _addressCubit.state.addresses;
    final branches = _branchCubit.state.branches;
    final configs = _customerShippingCubit.state.configs;

    if (addresses.isEmpty || branches.isEmpty || configs.isEmpty) {
      return;
    }

    final hasLocationAlready =
        _cartCubit.state.selectedAddress != null ||
        _cartCubit.state.deliveryMethod == DeliveryMethod.pickUp;

    if (hasLocationAlready) {
      _autoSelectionMade = true;
      return;
    }

    final savedId = await _getSelectedAddressUseCase();

    Address defaultAddress;

    if (savedId != null) {
      final savedAddress = addresses.where((d) => d.id == savedId).firstOrNull;

      defaultAddress =
          savedAddress ??
          addresses.firstWhere((d) => d.isMain, orElse: () => addresses.first);
    } else {
      defaultAddress = addresses.firstWhere(
        (d) => d.isMain,
        orElse: () => addresses.first,
      );
    }

    _executeValidation(address: defaultAddress, isAutomatic: true);
    _autoSelectionMade = true;
  }

  Future<void> _revalidateSelectedAddress() async {
    if (_isRevalidatingBranch) return;

    final selectedAddress = _cartCubit.state.selectedAddress;
    if (selectedAddress == null) return;

    final selectedBranchId = _cartCubit.state.branchId;
    if (selectedBranchId == null) return;

    final branches = _branchCubit.state.branches;
    final currentBranch = branches
        .where((branch) => branch.id == selectedBranchId)
        .firstOrNull;

    if (currentBranch != null && currentBranch.active) {
      return;
    }

    _isRevalidatingBranch = true;

    try {
      _cartCubit.clearActiveBranch();
      _executeValidation(address: selectedAddress, isAutomatic: false);
    } finally {
      _isRevalidatingBranch = false;
    }
  }

  void changeAddressManually(Address address) {
    emit(const CustomerCoordinatorState.processing());
    _executeValidation(address: address, isAutomatic: false);
  }

  void confirmPickup(Branch branch) {
    _cartCubit.setDeliveryMethod(DeliveryMethod.pickUp);

    _cartCubit.clearDeliveryAddress();

    _cartCubit.setActiveBranch(branch.id);

    _cartCubit.setShippingRules(baseRate: 0, freeThreshold: null);

    emit(CustomerCoordinatorState.changeSuccessful(branch, false));
  }

  Future<void> _executeValidation({
    required Address address,
    required bool isAutomatic,
  }) async {
    final branches = _branchCubit.state.branches;
    final configs = _customerShippingCubit.state.configs;

    debugPrint(
      'branches=${branches.length} configs=${configs.length} '
      'dir=${address.latitude},${address.longitude},${address.zipCode}',
    );

    if (branches.isEmpty) return;

    final result = await _findCoveringBranchUseCase
        .execute(address: address)
        .run();
    final List<CoveringBranch>? covering = result.fold(
      (failure) {
        return null;
      },
      (list) {
        return list;
      },
    );

    if (covering == null) {
      emit(const CustomerCoordinatorState.idle());
      return;
    }
    
    Branch? winningBranch;
    CoveringBranch? winningOffer;

    for (final offer in covering) {
      final branch = branches
          .where((b) => b.id == offer.branchId && b.active)
          .firstOrNull;
      if (branch != null) {
        winningBranch = branch;
        winningOffer = offer;
        break;
      }
    }

    final branch = winningBranch;
    final offer = winningOffer;

    if (branch != null && offer != null) {
      _cartCubit.setDeliveryMethod(DeliveryMethod.homeDelivery);
      _cartCubit.setDeliveryAddress(address);
      _cartCubit.setActiveBranch(branch.id);

      _customerProductsCubit.loadProductsByBranch(branch.id);
      _saveSelectedAddressUseCase(address.id);

      // Regla de "Envío Gratis" de la sucursal ganadora.
      final branchConfig = configs
          .where((c) => c.branchId == branch.id)
          .firstOrNull;

      // Costo base cotizado por el servidor y mínimo para envío gratis.
      _cartCubit.setShippingRules(
        baseRate: offer.shippingCost,
        freeThreshold: branchConfig?.minAmountForFreeShipping,
      );

      emit(CustomerCoordinatorState.changeSuccessful(branch, isAutomatic));
    } else {
      // Ninguna sucursal tiene cobertura para esa dirección.
      emit(CustomerCoordinatorState.outOfCoverage(address));
    }

    emit(const CustomerCoordinatorState.idle());
  }
}
