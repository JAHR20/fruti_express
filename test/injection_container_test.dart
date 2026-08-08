import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:fruti_express_jahr_admin/core/di/injection_container.dart' as di;

import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';

void main() {
  // Antes de cada prueba, inicializamos tu DI global
  setUp(() async {
    // Limpiamos GetIt por si hay basura de otras pruebas
    await GetIt.instance.reset(); 
    // Llamamos a tu función init() que registra todo
    await di.init(); 
  });

  group('Dependency Injection (GetIt)', () {
    test('Debe resolver todas las dependencias de los Cubits sin lanzar excepciones', () {
      
      // 1. Probamos Auth
      final authCubit = di.sl<AuthCubit>();
      expect(authCubit, isA<AuthCubit>());

      // 2. Probamos Productos
      // 🌟 Si olvidaste registrar un UseCase, la prueba "explotará" exactamente en esta línea
      final productosCubit = di.sl<ProductosCubit>();
      expect(productosCubit, isA<ProductosCubit>());

      // 3. Probamos Categorías
      final categoriasCubit = di.sl<CategoriaCubit>();
      expect(categoriasCubit, isA<CategoriaCubit>());

      final sucursalesCubit = di.sl<SucursalCubit>();
      expect(sucursalesCubit, isA<SucursalCubit>());

      final usuariosCubit = di.sl<UsuariosCubit>();
      expect(usuariosCubit, isA<UsuariosCubit>());
      
      // Puedes agregar el resto de tus Cubits aquí...
    });
  });
}