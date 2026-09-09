import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/addresses/data/models/address_model.dart';
import '../datasources/address_remote_datasource.dart';
import '../../domain/entities/address.dart';
import '../../domain/repositories/address_repository.dart';

class AddressRepositoryImpl
    with SupabaseHandleException
    implements AddressRepository {
  final AddressRemoteDataSource remoteDataSource;
  
  AddressRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<List<Address>> getByUser(String userId) =>
      TaskEither.tryCatch(
        () async {
          final models = await remoteDataSource.getByUser(userId);
          return models.map((m) => m.toDomain()).toList();
        },
        handleException,
      );

  @override
  ResultTask<Address> create(Address address) => TaskEither.tryCatch(
    () async {
      final model = AddressModelX.fromDomain(address);
      final created = await remoteDataSource.create(model);
      return created.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Address> update(Address address) => TaskEither.tryCatch(
    () async {
      final model = AddressModelX.fromDomain(address);
      final updated = await remoteDataSource.update(model);
      return updated.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Unit> delete(String id) => TaskEither.tryCatch(() async {
    await remoteDataSource.delete(id);
    return unit;
  }, handleException);

  @override
  ResultTask<Unit> setAsMain({
    required String userId,
    required String addressId,
  }) =>
      TaskEither.tryCatch(() async {
        await remoteDataSource.setAsMain(userId, addressId);
        return unit;
      }, handleException);
}