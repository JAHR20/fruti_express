import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:fruti_express_jahr_admin/core/di/injection_container.dart' as di;

import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';

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
      final productosCubit = di.sl<ProductCubit>();
      expect(productosCubit, isA<ProductCubit>());

      // 3. Probamos Categorías
      final categoriasCubit = di.sl<CategoryCubit>();
      expect(categoriasCubit, isA<CategoryCubit>());

      final sucursalesCubit = di.sl<BranchCubit>();
      expect(sucursalesCubit, isA<BranchCubit>());

      final usuariosCubit = di.sl<UsersCubit>();
      expect(usuariosCubit, isA<UsersCubit>());
      
      // Puedes agregar el resto de tus Cubits aquí...
    });
  });
}