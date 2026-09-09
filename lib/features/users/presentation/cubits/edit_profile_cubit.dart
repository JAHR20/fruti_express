
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/use_cases/update_profile_use_case.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateProfileUseCase _updateProfileUseCase;

  EditProfileCubit({
    required UpdateProfileUseCase updateProfileUseCase,
  })  : _updateProfileUseCase = updateProfileUseCase,
        super(const EditProfileState.initial());

  Future<void> updateProfile({
    required Profile currentUser, 
    required Profile profileToEdit,
  }) async {
    emit(const EditProfileState.saving());

    final result = await _updateProfileUseCase
        .execute(
          requester: currentUser,
          profileToEdit: profileToEdit, 
        )
        .run();

    result.fold(
      (failure) {
        emit(EditProfileState.error(translateFailure(failure)));
      },
      (_) {
        emit(const EditProfileState.success());
      },
    );
  }
}