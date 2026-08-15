import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class SubirImagenProducto {
  final ProductoRepository repository;

  SubirImagenProducto({required this.repository});

  ResultTask<String> ejecutar(File archivo, String nombreArchivo) {
    final nombreLimpio = nombreArchivo.trim();

    return TaskEither.Do(($) async {
      if (nombreLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation('El nombre del archivo no puede estar vacío.'),
          ),
        );
      }
      final url = await $(repository.subirImagen(archivo, nombreLimpio));
      return url;
    });
  }
}