import 'package:supabase_flutter/supabase_flutter.dart';
import 'pedido_remote_datasource.dart';
import '../../domain/entities/pedido.dart';

class PedidoRemoteDatasourceImpl implements PedidoRemoteDatasource {
  final SupabaseClient supabase;

  PedidoRemoteDatasourceImpl(this.supabase);

  @override
  @override
  Future<Pedido> crear(Pedido pedido) async {
    // 1. Preparamos el mapa del pedido (sin los detalles todavía)
    final pedidoMap = pedido.toJson();
    pedidoMap.remove(
      'detalles_pedido',
    ); // Quitamos la lista para evitar error de columna

    // 2. Insertamos la cabecera en la tabla 'pedidos'
    final pedidoResponse = await supabase
        .from('pedidos')
        .insert(pedidoMap)
        .select()
        .single();

    final String nuevoPedidoId = pedidoResponse['id'];

    // 3. Si hay detalles, los insertamos vinculándolos al ID recién creado
    if (pedido.items.isNotEmpty) {
      final detallesParaInsertar = pedido.items.map((detalle) {
        final map = detalle.toJson();
        map['pedido_id'] = nuevoPedidoId; // Forzamos la relación
        return map;
      }).toList();

      await supabase.from('detalles_pedido').insert(detallesParaInsertar);
    }

    // 4. Retornamos el pedido completo (con sus detalles) volviéndolo a consultar
    // Así nos aseguramos de traer los datos calculados por la DB (fechas, etc.)
    final resultado = await obtenerPorId(nuevoPedidoId);
    return resultado!;
  }

  @override
  Future<List<Pedido>> obtenerPorUsuario(String usuarioId) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq(
          'usuario_id',
          usuarioId,
        ) // Filtro de seguridad por el ID del cliente
        .order('fecha_creacion', ascending: false);

    return (response as List).map((json) => Pedido.fromJson(json)).toList();
  }

  @override
  Future<List<Pedido>> obtenerTodos() async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)') // Traemos la relación completa
        .order('fecha_creacion', ascending: false);

    return (response as List).map((json) => Pedido.fromJson(json)).toList();
  }

  @override
  Future<List<Pedido>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('sucursal_id', sucursalId)
        .order('fecha_creacion', ascending: false);

    return (response as List).map((json) => Pedido.fromJson(json)).toList();
  }

  @override
  Future<List<Pedido>> obtenerPorEstado(
    String sucursalId,
    String estado,
  ) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('sucursal_id', sucursalId)
        .eq('estado', estado)
        .order('fecha_creacion', ascending: false);

    return (response as List).map((json) => Pedido.fromJson(json)).toList();
  }

  @override
  Future<Pedido?> obtenerPorId(String id) async {
    final response = await supabase
        .from('pedidos')
        .select('*, detalles_pedido(*)')
        .eq('id', id)
        .maybeSingle();

    return response != null ? Pedido.fromJson(response) : null;
  }

  @override
  Future<Pedido> actualizarEstado(String id, String nuevoEstado) async {
    final response = await supabase
        .from('pedidos')
        .update({'estado': nuevoEstado})
        .eq('id', id)
        .select('*, detalles_pedido(*)')
        .single();

    return Pedido.fromJson(response);
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
  Future<Pedido> asignarRepartidor(String pedidoId, String repartidorId) async {
    final response = await supabase
        .from('pedidos')
        .update({'repartidor_id': repartidorId})
        .eq('id', pedidoId)
        .select('*, detalles_pedido(*)')
        .single();
    return Pedido.fromJson(response);
  }

  @override
  Stream<List<Pedido>> watchPorSucursal(String sucursalId) {
    return supabase
        .from('pedidos')
        .stream(primaryKey: ['id'])
        .eq('sucursal_id', sucursalId)
        .order('fecha_creacion')
        .map((data) => data.map((json) => Pedido.fromJson(json)).toList());
  }

  @override
  Future<int> obtenerVentasDelDia(String sucursalId) async {
    final hoy = DateTime.now().toIso8601String().split('T')[0];

    // Traemos solo la columna 'total' de los pedidos de hoy
    final response = await supabase
        .from('pedidos')
        .select('total')
        .eq('sucursal_id', sucursalId)
        .gte('fecha_creacion', hoy);

    final data = response as List;

    // Sumamos todos los totales.
    // Usamos fold para iterar y acumular el valor.
    final totalVendido = data.fold<double>(
      0,
      (sum, item) => sum + (item['total'] ?? 0),
    );

    // Lo convertimos a int para cumplir con tu contrato de Dominio
    return totalVendido.toInt();
  }
}
