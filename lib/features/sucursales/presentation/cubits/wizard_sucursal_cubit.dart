import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/estrategia_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/guardar_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/actualizar_cobertura_sucursal.dart'; // Tu nuevo caso de uso
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/crear_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/editar_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_cobertura.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_ubicacion_por_codigo_postal.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

import 'wizard_sucursal_state.dart';

class WizardSucursalCubit extends Cubit<WizardSucursalState> {
  final CrearSucursal _crearSucursalUseCase;
  final EditarSucursal _editarSucursalUseCase;
  final ObtenerUbicacionPorCodigoPostal _obtenerUbicacionPorCodigoPostalUseCase;
  final ObtenerCobertura _obtenerCoberturaUseCase;
  final ActualizarCoberturaSucursal _actualizarCoberturaSucursalUseCase;
  final ObtenerConfiguracionEnvioUseCase _obtenerConfiguracionEnvioUseCase;
  final GuardarConfiguracionEnvioUseCase _guardarConfiguracionEnvioUseCase;

  WizardSucursalCubit({
    required CrearSucursal crearSucursalUseCase,
    required EditarSucursal editarSucursalUseCase,
    required ObtenerUbicacionPorCodigoPostal
    obtenerUbicacionPorCodigoPostalUseCase,
    required ObtenerCobertura obtenerCoberturaUseCase,
    required ActualizarCoberturaSucursal actualizarCoberturaSucursalUseCase,
    required ObtenerConfiguracionEnvioUseCase obtenerConfiguracionEnvioUseCase,
    required GuardarConfiguracionEnvioUseCase guardarConfiguracionEnvioUseCase,
  }) : _crearSucursalUseCase = crearSucursalUseCase,
       _editarSucursalUseCase = editarSucursalUseCase,
       _obtenerUbicacionPorCodigoPostalUseCase =
           obtenerUbicacionPorCodigoPostalUseCase,
       _obtenerCoberturaUseCase = obtenerCoberturaUseCase,
       _actualizarCoberturaSucursalUseCase = actualizarCoberturaSucursalUseCase,
       _obtenerConfiguracionEnvioUseCase = obtenerConfiguracionEnvioUseCase,
       _guardarConfiguracionEnvioUseCase = guardarConfiguracionEnvioUseCase,
       super(const WizardSucursalState());

  void cambiarPaso(int nuevoPaso) {
    emit(state.copyWith(pasoActual: nuevoPaso, errorMessage: null));
  }

  void actualizarCampo({
    String? nombre,
    String? calle,
    String? numeroExterior,
    String? colonia,
    double? latitud,
    double? longitud,
  }) {
    emit(
      state.copyWith(
        nombre: nombre ?? state.nombre,
        calle: calle ?? state.calle,
        numeroExterior: numeroExterior ?? state.numeroExterior,
        colonia: colonia ?? state.colonia,
        latitud: latitud ?? state.latitud,
        longitud: longitud ?? state.longitud,
        errorMessage: null,
      ),
    );
  }

  void actualizarConfiguracionEnvio({
    double? radioMaximoKm,
    bool? requerirValidacionCP,
    double? montoMinimoEnvioGratis,
    EstrategiaEnvio? estrategia,
  }) {
    final configActual =
        state.configuracionEnvio ??
        ConfiguracionEnvio(
          id: '',
          sucursalId: state.sucursalIdCreada ?? '',
          estrategia: EstrategiaEnvio.haversine,
          radioMaximoKm: 10.0,
          fechaCreacion: DateTime.now(),
        );

    emit(
      state.copyWith(
        configuracionEnvio: configActual.copyWith(
          radioMaximoKm: radioMaximoKm ?? configActual.radioMaximoKm,
          requerirValidacionCP:
              requerirValidacionCP ?? configActual.requerirValidacionCP,
          montoMinimoEnvioGratis:
              montoMinimoEnvioGratis ?? configActual.montoMinimoEnvioGratis,
          estrategia: estrategia ?? configActual.estrategia,
        ),
      ),
    );
  }

  Future<void> inicializarEdicion(Sucursal sucursal, int pasoInicial) async {
    emit(
      state.copyWith(
        buscandoUbicacion: true,
        pasoActual: pasoInicial,
        sucursalIdCreada: sucursal.id,
        // Paso 1
        nombre: sucursal.nombre,
        calle: sucursal.calle,
        numeroExterior: sucursal.numExterior,
        codigoPostal: sucursal.codigoPostal,
        colonia: sucursal.colonia,
        estado: sucursal.estado,
        municipio: sucursal.municipio,
        latitud: sucursal.latitud,
        longitud: sucursal.longitud,

        // Limpiamos datos anteriores del wizard
        codigosDisponibles: [],
        codigosSeleccionados: [],
        coloniasPorCp: {},
        configuracionEnvio: null,

        errorMessage: null,
      ),
    );

    List<String> codigosGuardados = [];

    final resultadoCobertura = await _obtenerCoberturaUseCase
        .ejecutar(sucursal.id)
        .run();

    resultadoCobertura.fold(
      (failure) {
        codigosGuardados = [];
      },
      (codigos) {
        codigosGuardados = codigos;
      },
    );

    ConfiguracionEnvio? configuracion;

    final resultadoConfiguracion = await _obtenerConfiguracionEnvioUseCase
        .call(sucursal.id)
        .run();

    resultadoConfiguracion.fold(
      (failure) {
        configuracion = null;
      },
      (resultado) {
        configuracion = resultado;
      },
    );

    if (sucursal.codigoPostal.isNotEmpty) {
      final resultadoUbicacion = await _obtenerUbicacionPorCodigoPostalUseCase
          .ejecutar(sucursal.codigoPostal)
          .run();

      resultadoUbicacion.fold(
        (failure) {
          emit(
            state.copyWith(
              buscandoUbicacion: false,
              codigosSeleccionados: codigosGuardados,
              configuracionEnvio: configuracion,
            ),
          );
        },
        (ubicacion) {
          emit(
            state.copyWith(
              buscandoUbicacion: false,
              estado: ubicacion.estado,
              municipio: ubicacion.municipio,
              codigosDisponibles: ubicacion.codigosPostalesDisponibles,
              codigosSeleccionados: codigosGuardados,
              coloniasPorCp: ubicacion.coloniasPorCodigoPostal,
              configuracionEnvio: configuracion,
              errorMessage: null,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          buscandoUbicacion: false,
          codigosSeleccionados: codigosGuardados,
          configuracionEnvio: configuracion,
        ),
      );
    }
  }

  Future<void> guardarPaso1({
    required Perfil usuarioActual,
    Sucursal? sucursalAEditar,
  }) async {
    if (state.municipio == null || state.estado == null) {
      emit(
        state.copyWith(
          errorMessage:
              'Debe ingresar o cargar un C.P. válido antes de guardar.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        guardando: true,
        errorMessage: null,
        paso1Completado: false,
      ),
    );

    final resultado = sucursalAEditar == null
        ? await _crearSucursalUseCase
              .ejecutar(
                usuarioActual: usuarioActual,
                nombre: state.nombre.trim(),
                calle: state.calle.trim(),
                numeroExterior: state.numeroExterior.trim(),
                codigoPostal: state.codigoPostal,
                colonia: state.colonia ?? "",
                municipio: state.municipio!,
                estado: state.estado!,
                latitud: state.latitud,
                longitud: state.longitud,
              )
              .run()
        : await _editarSucursalUseCase
              .ejecutar(
                usuarioActual: usuarioActual,
                sucursalModificada: sucursalAEditar.copyWith(
                  nombre: state.nombre.trim(),
                  calle: state.calle.trim(),
                  numExterior: state.numeroExterior.trim(),
                  codigoPostal: state.codigoPostal,
                  colonia: state.colonia ?? "",
                  municipio: state.municipio!,
                  estado: state.estado!,
                  latitud: state.latitud,
                  longitud: state.longitud,
                ),
              )
              .run();

    resultado.fold(
      (failure) => emit(
        state.copyWith(guardando: false, errorMessage: failure.errorMessage),
      ),
      (sucursalGuardada) => emit(
        state.copyWith(
          guardando: false,
          paso1Completado: true,
          sucursalIdCreada: sucursalGuardada.id,
        ),
      ),
    );
  }

  Future<void> finalizarWizard(Perfil usuarioActual) async {
    final sucursalId = state.sucursalIdCreada;
    if (sucursalId == null) {
      emit(
        state.copyWith(
          errorMessage: 'Error crítico: No se encontró la sucursal base.',
        ),
      );
      return;
    }

    emit(state.copyWith(guardando: true, errorMessage: null));

    final resultadoCobertura = await _actualizarCoberturaSucursalUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          sucursalId: sucursalId,
          codigosPostales: state.codigosSeleccionados,
        )
        .run();

    if (resultadoCobertura.isLeft()) {
      final error = resultadoCobertura.match((l) => l.errorMessage, (_) => '');
      emit(state.copyWith(guardando: false, errorMessage: error));
      return;
    }
    final configAguardar =
        (state.configuracionEnvio ??
                ConfiguracionEnvio(
                  id: '',
                  sucursalId: sucursalId,
                  estrategia: EstrategiaEnvio.haversine,
                  radioMaximoKm: 10.0,
                  fechaCreacion: DateTime.now(),
                ))
            .copyWith(
              sucursalId: sucursalId,
              codigosPostalesPermitidos: state.codigosSeleccionados,
            );

    final resultadoEnvio = await _guardarConfiguracionEnvioUseCase(
      usuarioActual: usuarioActual,
      configuracion: configAguardar,
    ).run();

    resultadoEnvio.fold(
      (failure) => emit(
        state.copyWith(guardando: false, errorMessage: failure.errorMessage),
      ),
      (_) => emit(state.copyWith(guardando: false, guardadoExitoso: true)),
    );
  }

  Future<void> buscarPorCodigoPostal(String codigoPostal) async {
    emit(state.copyWith(codigoPostal: codigoPostal));
    if (codigoPostal.length != 5) return;

    emit(state.copyWith(buscandoUbicacion: true, errorMessage: null));
    final resultado = await _obtenerUbicacionPorCodigoPostalUseCase
        .ejecutar(codigoPostal)
        .run();

    resultado.fold(
      (failure) => emit(
        state.copyWith(
          buscandoUbicacion: false,
          errorMessage: failure.errorMessage,
        ),
      ),
      (ubicacion) => emit(
        state.copyWith(
          buscandoUbicacion: false,
          estado: ubicacion.estado,
          municipio: ubicacion.municipio,
          codigosDisponibles: ubicacion.codigosPostalesDisponibles,
          codigosSeleccionados: ubicacion.codigosPostalesDisponibles,
          coloniasPorCp: ubicacion.coloniasPorCodigoPostal,
        ),
      ),
    );
  }

  void alternarCodigoPostal(String codigo, bool estaSeleccionado) {
    final nuevaLista = List<String>.from(state.codigosSeleccionados);
    if (estaSeleccionado) {
      if (!nuevaLista.contains(codigo)) nuevaLista.add(codigo);
    } else {
      nuevaLista.remove(codigo);
    }
    emit(state.copyWith(codigosSeleccionados: nuevaLista));
  }
}
