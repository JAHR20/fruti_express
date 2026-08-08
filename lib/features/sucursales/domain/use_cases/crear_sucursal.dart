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
    required String calle,
    required String numeroExterior,
    required String codigoPostal,
    required String colonia,
    required String municipio,
    required String estado,
    required double? latitud,
    required double? longitud,
  }) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Seguridad y validaciones previas...
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "Solo un administrador puede crear sucursales",
            ),
          ),
        );
      }

      if (nombreTrim.isEmpty ||
          calle.trim().isEmpty ||
          numeroExterior.trim().isEmpty ||
          codigoPostal.trim().isEmpty ||
          colonia.trim().isEmpty ||
          municipio.trim().isEmpty ||
          estado.trim().isEmpty
          ) {
        return await $(
          TaskEither.left(
            const Failure.validation("Faltan datos obligatorios"),
          ),
        );
      }

      if (latitud == null || longitud == null) {
        return await $(
          TaskEither.left(
            const Failure.validation("Las coordenadas de ubicación son obligatorias para los envíos."),
          ),
        );
      }

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

      // 2️⃣ Construimos la entidad (pura, sin los códigos)
      final nuevaSucursal = Sucursal(
        id: '',
        nombre: nombreTrim,
        calle: calle.trim(),
        numExterior: numeroExterior.trim(),
        codigoPostal: codigoPostal.trim(),
        colonia: colonia.trim(),
        municipio: municipio.trim(),
        estado: estado.trim(),
        activa: true,
        fechaCreacion: DateTime.now(),
        latitud: latitud,
        longitud: longitud,
      );

      // 3️⃣ Guardamos la Sucursal (Paso 1 en DB)
      final sucursalCreada = await $(repository.crear(nuevaSucursal));

      // Devolvemos la entidad ya lista al Cubit
      return sucursalCreada;
    });
  }
}
