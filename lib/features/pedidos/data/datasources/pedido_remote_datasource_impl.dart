import 'package:fruti_express_jahr_admin/features/pedidos/data/models/pedido_model.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pedido_remote_datasource.dart';

class PedidoRemoteDatasourceImpl implements PedidoRemoteDatasource {
  final SupabaseClient supabase;

  PedidoRemoteDatasourceImpl(this.supabase);

  @override
  Future<PedidoModel> crear(PedidoModel model) async {
    final pedidoMap = model.toJson();
    pedidoMap.remove('items');
    final itemsList = model.items.map((item) => item.toJson()).toList();

    final response = await supabase.rpc(
      'crear_pedido_completo',
      params: {'pedido_data': pedidoMap, 'items_data': itemsList},
    );

    final String nuevoPedidoId = response.toString();

    final resultado = await obtenerPorId(nuevoPedidoId);

    if (resultado == null) {
      throw const PostgrestException(
        message: 'Error al recuperar el pedido creado',
      );
    }

    return resultado;
  }

  @override
  Future<List<PedidoModel>> obtenerPorUsuario(String usuarioId) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('cliente_id', usuarioId)
        .order('fecha_creacion', ascending: false);

    final pedidos = (response as List)
        .map((json) => PedidoModel.fromJson(json))
        .toList();

    final pedidosActivosIds = pedidos
        .where(
          (p) =>
              p.estado != EstadoPedido.entregado &&
              p.estado != EstadoPedido.cancelado,
        )
        .map((p) => p.id)
        .toList();

    if (pedidosActivosIds.isEmpty) return pedidos;

    final codigos = await supabase
        .from('pedido_confirmacion')
        .select('pedido_id, codigo')
        .inFilter('pedido_id', pedidosActivosIds);


    final codigosPorPedido = {
      for (final c in codigos as List)
        c['pedido_id'] as String: c['codigo'] as String,
    };

    return pedidos.map((p) {
      final codigo = codigosPorPedido[p.id];
      return codigo != null ? p.copyWith(codigoConfirmacion: codigo) : p;
    }).toList();
  }

  @override
  Future<String?> obtenerCodigoConfirmacion(String pedidoId) async {
    final response = await supabase
        .from('pedido_confirmacion')
        .select('codigo')
        .eq('pedido_id', pedidoId)
        .maybeSingle();

    return response?['codigo'] as String?;
  }

  @override
  Future<List<PedidoModel>> obtenerTodos() async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .order('fecha_creacion', ascending: false);

    return (response as List)
        .map((json) => PedidoModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<PedidoModel>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('sucursal_id', sucursalId)
        .order('fecha_creacion', ascending: false);

    return (response as List)
        .map((json) => PedidoModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<PedidoModel>> obtenerPorEstado(
    String sucursalId,
    String estado,
  ) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('sucursal_id', sucursalId)
        .eq('estado', estado)
        .order('fecha_creacion', ascending: false);

    return (response as List)
        .map((json) => PedidoModel.fromJson(json))
        .toList();
  }

  @override
  Future<PedidoModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('id', id)
        .maybeSingle();

    return response != null ? PedidoModel.fromJson(response) : null;
  }

  @override
  Future<PedidoModel> actualizarEstado(String id, String nuevoEstado) async {
    final response = await supabase
        .from('pedidos')
        .update({'estado': nuevoEstado})
        .eq('id', id)
        .select('*, detalles_pedido(*)')
        .single();

    return PedidoModel.fromJson(response);
  }

  @override
  Future<int> contarPorEstado(String sucursalId, String estado) async {
    final response = await supabase
        .from('pedidos')
        .select('id')
        .eq('sucursal_id', sucursalId)
        .eq('estado', estado)
        .count(CountOption.exact);
    return response.count;
  }

  @override
  Future<int> contarPedidosHoy(String sucursalId) async {
    final hoy = DateTime.now().toIso8601String().split(
      'T',
    )[0]; // Formato YYYY-MM-DD
    final response = await supabase
        .from('pedidos')
        .select('id')
        .eq('sucursal_id', sucursalId)
        .gte('fecha_creacion', hoy)
        .count(CountOption.exact);
    return response.count;
  }

  @override
  Future<PedidoModel> asignarRepartidor(
    String pedidoId,
    String repartidorId,
  ) async {
    final response = await supabase
        .from('pedidos')
        .update({'repartidor_id': repartidorId})
        .eq('id', pedidoId)
        .select('*, detalles_pedido(*)')
        .single();
    return PedidoModel.fromJson(response);
  }

  @override
  Stream<List<PedidoModel>> watchPorSucursal(String sucursalId) {
    return supabase
        .from('pedidos')
        .stream(primaryKey: ['id'])
        .eq('sucursal_id', sucursalId)
        .order('fecha_creacion')
        .map((data) => data.map((json) => PedidoModel.fromJson(json)).toList());
  }

  @override
  Future<int> obtenerVentasDelDia(String sucursalId) async {
    final hoy = DateTime.now().toIso8601String().split('T')[0];
    final response = await supabase
        .from('pedidos')
        .select('total')
        .eq('sucursal_id', sucursalId)
        .gte('fecha_creacion', hoy);

    final data = response as List;
    final totalVendido = data.fold<double>(
      0,
      (sum, item) => sum + (item['total'] ?? 0),
    );
    return totalVendido.toInt();
  }

  @override
  Stream<List<PedidoModel>> watchPorRepartidor(String repartidorId) {
    return supabase
        .from('pedidos')
        .stream(primaryKey: ['id'])
        .eq('repartidor_id', repartidorId)
        .order('fecha_creacion', ascending: false)
        .map((data) => data.map((json) => PedidoModel.fromJson(json)).toList());
  }

  @override
  Future<void> confirmarEntrega({
    required String pedidoId,
    String? codigoConfirmacion,
    String? urlEvidencia,
  }) async {
    await supabase.rpc(
      'confirmar_entrega',
      params: {
        'p_pedido_id': pedidoId,
        'p_codigo': codigoConfirmacion,
        'p_url_evidencia': urlEvidencia,
      },
    );
  }
}
