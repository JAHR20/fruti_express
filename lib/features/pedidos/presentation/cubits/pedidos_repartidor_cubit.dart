import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/confirmar_entrega.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/confirmar_entrega_params.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_repartidor.dart';
import 'package:image_picker/image_picker.dart';
import 'pedidos_repartidor_state.dart';

class PedidosRepartidorCubit extends Cubit<PedidosRepartidorState> {
  final ObtenerPedidosRepartidor _obtenerPedidos;
  final PedidoRepository _repository;
  final ConfirmarEntrega _confirmarEntrega;
  final StorageService _storageService;
  StreamSubscription<Either<Failure, List<Pedido>>>? _subscription;

  PedidosRepartidorCubit({
    required ObtenerPedidosRepartidor obtenerPedidos,
    required PedidoRepository repository,
    required ConfirmarEntrega confirmarEntrega,
    required StorageService storageService,
  }) : _obtenerPedidos = obtenerPedidos,
       _repository = repository,
       _confirmarEntrega = confirmarEntrega,
       _storageService = storageService,
       super(const PedidosRepartidorState.inicial());

  void iniciarWatch(String repartidorId) {
    emit(const PedidosRepartidorState.cargando());
    _subscription?.cancel();

    _subscription = _obtenerPedidos(repartidorId).listen(
      (either) => either.fold(
        (failure) => emit(PedidosRepartidorState.error(failure.errorMessage)),
        (pedidos) => emit(PedidosRepartidorState.cargado(pedidos)),
      ),
    );
  }

  void detenerWatch() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> salirAEntregar(String pedidoId) async {
    final actuales = _pedidosActuales();
    if (actuales == null) return;

    emit(
      PedidosRepartidorState.accionando(pedidos: actuales, pedidoId: pedidoId),
    );

    final result = await _repository
        .actualizarEstado(
          pedidoId: pedidoId,
          nuevoEstado: EstadoPedido.enCamino,
        )
        .run();

    result.fold(
      (failure) => emit(
        PedidosRepartidorState.errorConPedidos(
          // ← cambia
          pedidos: actuales,
          mensaje: failure.errorMessage,
        ),
      ),
      (_) => emit(PedidosRepartidorState.cargado(actuales)),
    );
  }

  Future<void> confirmarEntrega({
    required String pedidoId,
    String? codigoConfirmacion,
    String? rutaFoto,
  }) async {
    final actuales = _pedidosActuales();
    if (actuales == null) return;

    emit(
      PedidosRepartidorState.accionando(pedidos: actuales, pedidoId: pedidoId),
    );

    String? urlEvidencia;
    if (rutaFoto != null) {
      try {
        urlEvidencia = await _storageService.uploadImage(
          file: XFile(rutaFoto),
          bucketName: 'evidencias-entrega',
          pathName: 'evidencias/$pedidoId',
        );
      } catch (e) {
        emit(
          PedidosRepartidorState.errorConPedidos(
            pedidos: actuales,
            mensaje: 'No se pudo subir la foto. Intenta de nuevo.',
          ),
        );
        return;
      }
    }

    final result = await _confirmarEntrega(
      ConfirmarEntregaParams(
        pedidoId: pedidoId,
        codigoConfirmacion: codigoConfirmacion,
        urlEvidencia: urlEvidencia,
      ),
    ).run();

    result.fold(
      (failure) => emit(
        PedidosRepartidorState.errorConPedidos(
          pedidos: actuales,
          mensaje: failure.errorMessage,
        ),
      ),
      (_) => emit(PedidosRepartidorState.cargado(actuales)),
    );
  }

  List<Pedido>? _pedidosActuales() {
    return state.maybeWhen(
      cargado: (pedidos) => pedidos,
      accionando: (pedidos, _) => pedidos,
      errorConPedidos: (pedidos, _) => pedidos,
      orElse: () => null,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
