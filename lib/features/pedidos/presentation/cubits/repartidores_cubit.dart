import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/obtener_repartidores.dart';
import 'repartidores_state.dart';

class RepartidoresCubit extends Cubit<RepartidoresState> {
  final ObtenerRepartidores _obtenerRepartidores;

  RepartidoresCubit({required ObtenerRepartidores obtenerRepartidores})
      : _obtenerRepartidores = obtenerRepartidores,
        super(const RepartidoresState.inicial());

  Future<void> cargar({required Perfil solicitante}) async {
    emit(const RepartidoresState.cargando());

    final result = await _obtenerRepartidores(
      solicitante: solicitante,
    ).run();

    result.fold(
      (failure) => emit(RepartidoresState.error(failure.errorMessage)),
      (repartidores) => emit(RepartidoresState.cargado(repartidores)),
    );
  }
}