import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/repositories/carrito_repository.dart';
import 'package:fruti_express_jahr_admin/features/carrito/data/datasources/carrito_local_datasource.dart';

class CarritoRepositoryImpl implements CarritoRepository {
  final CarritoLocalDatasource localDataSource;

  CarritoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CarritoItem>> obtenerCarrito() async {
    try {
      return await localDataSource.obtenerCarrito();
    } catch (e) {
      // 🛡️ Escudo: Si por alguna razón el archivo JSON en el teléfono se corrompió,
      // no dejamos que la app explote, simplemente le damos un carrito limpio.
      return [];
    }
  }

  @override
  Future<void> guardarCarrito(List<CarritoItem> carrito) async {
    await localDataSource.guardarCarrito(carrito);
  }

  @override
  Future<void> vaciarCarrito() async {
    await localDataSource.vaciarCarrito();
  }
}