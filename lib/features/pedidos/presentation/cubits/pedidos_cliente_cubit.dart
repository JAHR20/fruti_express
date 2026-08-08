// features/pedidos/presentation/cubits/pedidos_cliente_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_usuario_use_case.dart';
import 'pedidos_cliente_state.dart';

class PedidosClienteCubit extends Cubit<PedidosClienteState> {
  final ObtenerPedidosUsuarioUseCase _obtenerPedidos;

  PedidosClienteCubit({
    required ObtenerPedidosUsuarioUseCase obtenerPedidos,
  })  : _obtenerPedidos = obtenerPedidos,
        super(const PedidosClienteState.inicial());

  Future<void> cargar(String usuarioId) async {
    emit(const PedidosClienteState.cargando());

    final result = await _obtenerPedidos(usuarioId).run();

    result.fold(
      (failure) => emit(PedidosClienteState.error(failure.errorMessage)),
      (pedidos) {
        // Ordenar del más reciente al más antiguo
        final ordenados = [...pedidos]
          ..sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));
        emit(PedidosClienteState.cargado(ordenados));
      },
    );
  }
}