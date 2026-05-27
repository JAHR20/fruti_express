import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CrearSucursal {
  final SucursalRepository repository;

  CrearSucursal(this.repository);

  ResultTask<Sucursal> ejecutar({
    required Perfil usuarioActual,
    required String nombre,
    required String direccion,
  }) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Permisos: Solo el Super Admin crea sucursales
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "Solo un administrador puede crear sucursales",
            ),
          ),
        );
      }

      // 2️⃣ Validación de entrada
      if (nombreTrim.isEmpty || direccion.trim().isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              "El nombre y la dirección son obligatorios",
            ),
          ),
        );
      }

      // 3️⃣ Validar nombre único para evitar confusión operativa
      final existente = await $(repository.obtenerPorNombre(nombreTrim));
      if (existente != null) {
        return await $(
          TaskEither.left(
            const Failure.alreadyExists(
              "Ya existe una sucursal con ese nombre",
            ),
          ),
        );
      }

      // 4️⃣ Construcción de la entidad
      final nuevaSucursal = Sucursal(
        id: '', // Se genera en la DB
        nombre: nombreTrim,
        direccion: direccion.trim(),
        activa: true,
        fechaCreacion: DateTime.now(),
      );

      return await $(repository.crear(nuevaSucursal));
    });
  }
}
