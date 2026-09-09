import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/profile.dart';
import '../extensions/profile_permissions_extension.dart';
import '../repositories/user_repository.dart';

class CountActiveAdminsUseCase { 
  final UserRepository repository;
  
  CountActiveAdminsUseCase(this.repository);

  ResultTask<int> execute(Profile requester) {
    return TaskEither.Do(($) async {
      if (!requester.isStaff) {
        return await $(
          TaskEither<Failure, int>.left(
            const Failure.unauthorized(FailureCode.accessDeniedToStaffMetrics),
          ),
        );
      }

      return await $(repository.countActiveAdmins()); 
    });
  }
}