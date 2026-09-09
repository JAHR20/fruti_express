import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/update_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/create_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/delete_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/set_main_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/get_addresses_use_case.dart';

import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAddressesUseCase _getAddressesUseCase;
  final CreateAddressUseCase _createAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final SetMainAddressUseCase _setMainAddressUseCase;

  AddressCubit({
    required GetAddressesUseCase getAddressesUseCase,
    required CreateAddressUseCase createAddressUseCase,
    required UpdateAddressUseCase updateAddressUseCase,
    required DeleteAddressUseCase deleteAddressUseCase,
    required SetMainAddressUseCase setMainAddressUseCase,
  }) : _getAddressesUseCase = getAddressesUseCase,
       _createAddressUseCase = createAddressUseCase,
       _updateAddressUseCase = updateAddressUseCase,
       _deleteAddressUseCase = deleteAddressUseCase,
       _setMainAddressUseCase = setMainAddressUseCase,
       super(const AddressState());

  Future<void> loadAddresses(String userId) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        operationError: null,
        userId: userId,
      ),
    );

    final result = await _getAddressesUseCase.execute(userId).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (addresses) {
        emit(
          state.copyWith(
            isLoading: false,
            addresses: addresses,
            errorMessage: null,
            userId: userId,
          ),
        );
      },
    );
  }

  Future<void> createAddress(Address newAddress) async {
    emit(
      state.copyWith(
        operationError: null,
        operationSuccessful: false,
        processingAddressId: 'new', 
      ),
    );

    final result = await _createAddressUseCase.execute(newAddress).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingAddressId: null,
            operationError: translateFailure(failure),
            operationSuccessful: false,
          ),
        );
      },
      (createdAddress) {
        final newList = [...state.addresses, createdAddress];

        emit(
          state.copyWith(
            addresses: newList,
            processingAddressId: null,
            operationError: null,
            operationSuccessful: true,
          ),
        );
      },
    );
  }

  Future<void> updateAddress(Address address) async {
    emit(
      state.copyWith(
        processingAddressId: address.id,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _updateAddressUseCase.execute(address).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingAddressId: null,
            operationError: translateFailure(failure),
            operationSuccessful: false,
          ),
        );
      },
      (updatedAddress) {
        final newList = state.addresses.map((currentAddress) {
          return currentAddress.id == updatedAddress.id
              ? updatedAddress
              : currentAddress;
        }).toList();

        emit(
          state.copyWith(
            addresses: newList,
            processingAddressId: null,
            operationError: null,
            operationSuccessful: true,
          ),
        );
      },
    );
  }

  Future<void> deleteAddress(String id) async {
    emit(
      state.copyWith(
        processingAddressId: id,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _deleteAddressUseCase.execute(id).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingAddressId: null,
            operationError: translateFailure(failure),
            operationSuccessful: false,
          ),
        );
      },
      (_) {
        final newList = state.addresses
            .where((address) => address.id != id)
            .toList();

        emit(
          state.copyWith(
            addresses: newList,
            processingAddressId: null,
            operationError: null,
            operationSuccessful: true,
          ),
        );
      },
    );
  }

  Future<void> setAsMainAddress(
    String userId,
    String addressId,
  ) async {
    emit(
      state.copyWith(
        processingMainAddressId: addressId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = await _setMainAddressUseCase.execute(
      userId: userId,
      addressId: addressId,
    ).run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            processingMainAddressId: null,
            operationError: translateFailure(failure),
            operationSuccessful: false,
          ),
        );
      },
      (_) {
        final newList = state.addresses.map((address) {
          return address.copyWith(isMain: address.id == addressId);
        }).toList();

        emit(
          state.copyWith(
            addresses: newList,
            processingMainAddressId: null,
            operationError: null,
            operationSuccessful: true,
          ),
        );
      },
    );
  }

  void clearOperationResult() { 
    emit(state.copyWith(operationError: null, operationSuccessful: false));
  }
}