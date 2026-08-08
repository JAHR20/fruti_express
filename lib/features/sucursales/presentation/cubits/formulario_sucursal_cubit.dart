import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/crear_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/editar_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_cobertura.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'formulario_sucursal_state.dart';

class FormularioSucursalCubit extends Cubit<FormularioSucursalState> {
  final CrearSucursal _crearSucursalUseCase;
  final EditarSucursal _editarSucursalUseCase;
  final ObtenerCobertura _obtenerCoberturaUseCase;
  final PostaliService _postaliService;

  FormularioSucursalCubit({
    required CrearSucursal crearSucursalUseCase,
    required EditarSucursal editarSucursalUseCase,
    required ObtenerCobertura obtenerCoberturaUseCase,
    required PostaliService postaliService,
  }) : _crearSucursalUseCase = crearSucursalUseCase,
       _editarSucursalUseCase = editarSucursalUseCase,
       _obtenerCoberturaUseCase = obtenerCoberturaUseCase,
       _postaliService = postaliService,
       super(const FormularioSucursalState());

  // ─── MODO EDICIÓN: CARGA PREVIA ────────────────────────────────────────

  Future<void> inicializarEdicion(Sucursal sucursal) async {
    emit(
      state.copyWith(
        buscandoUbicacion: true,
        sucursalIdCreada: sucursal.id,
        estado: sucursal.estado,
        municipio: sucursal.municipio,
        latitud: sucursal.latitud,
        longitud: sucursal.longitud,
      ),
    );

    List<String> codigosPreSeleccionados = [];

    // 1. Buscamos en la BD los C.P. asignados a esta sucursal (si es que ya existían)
    final resultadoCobertura = await _obtenerCoberturaUseCase
        .ejecutar(sucursal.id)
        .run();

    resultadoCobertura.fold(
      (failure) => print('Info: No hay cobertura previa o falló.'), // No detenemos la ejecución
      (codigos) => codigosPreSeleccionados = codigos,
    );

    // 2. 🌟 LA VERDADERA MAGIA: Usamos el C.P. principal de la sucursal para buscar en Postali
    if (sucursal.codigoPostal.isNotEmpty) {
      try {
        final infoCp = await _postaliService.consultarCp(sucursal.codigoPostal);
        if (infoCp != null) {
          final infoMunicipio = await _postaliService.obtenerMunicipio(
            estadoSlug: infoCp.estadoSlug,
            municipioSlug: infoCp.municipioSlug,
          );

          if (infoMunicipio != null) {
            emit(
              state.copyWith(
                buscandoUbicacion: false,
                codigosDisponibles: infoMunicipio.codigosPostalesUnicos, // 🌟 Llena todos los chips
                codigosSeleccionados: codigosPreSeleccionados, // 🌟 Palomea los que estaban en BD
              ),
            );
            return;
          }
        }
      } catch (e) {
        print('Error consultando Postali: $e');
      }
    }

    // 3. Si por alguna razón Postali falló o no tenía C.P., terminamos el loading
    emit(state.copyWith(
      buscandoUbicacion: false,
      codigosSeleccionados: codigosPreSeleccionados,
    ));
  }

  // ─── LÓGICA DE AUTOCOMPLETADO (POSTALI) ────────────────────────────────

  Future<void> buscarPorCodigoPostal(String codigoPostal) async {
    // Solo buscamos si tiene exactamente 5 dígitos
    if (codigoPostal.length != 5) return;

    emit(state.copyWith(buscandoUbicacion: true, errorMessage: null));

    try {
      // 1. Consultamos el C.P. inicial
      final infoCp = await _postaliService.consultarCp(codigoPostal);

      if (infoCp == null) {
        emit(
          state.copyWith(
            buscandoUbicacion: false,
            errorMessage:
                'No se encontró información para el C.P. $codigoPostal',
          ),
        );
        return;
      }

      // 2. Usamos tus slugs exactos para buscar el municipio completo
      final infoMunicipio = await _postaliService.obtenerMunicipio(
        estadoSlug: infoCp.estadoSlug,
        municipioSlug: infoCp.municipioSlug,
      );

      if (infoMunicipio == null) {
        emit(
          state.copyWith(
            buscandoUbicacion: false,
            errorMessage: 'No se pudo cargar la cobertura del municipio.',
          ),
        );
        return;
      }

      // 🌟 3. NUEVO: Armamos el diccionario de C.P. -> Colonias
      // Como ya pasó el "return" de arriba, Dart sabe que infoMunicipio no es nulo.
      final Map<String, List<String>> agrupacionColonias = {};
      for (var colonia in infoMunicipio.colonias) {
        if (!agrupacionColonias.containsKey(colonia.cp)) {
          agrupacionColonias[colonia.cp] = [];
        }
        agrupacionColonias[colonia.cp]!.add(colonia.nombre);
      }

      // 4. Usamos tu excelente getter para obtener la lista limpia de C.P.
      final codigosDelMunicipio = infoMunicipio.codigosPostalesUnicos;

      // 5. Actualizamos el estado
      emit(
        state.copyWith(
          buscandoUbicacion: false,
          estado: infoCp.estado,
          municipio: infoCp.municipio,
          codigosDisponibles: codigosDelMunicipio,
          codigosSeleccionados: List.from(codigosDelMunicipio),
          coloniasPorCp:
              agrupacionColonias, // 🌟 Pasamos el diccionario al estado
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          buscandoUbicacion: false,
          errorMessage: 'Error de conexión con el servicio postal.',
        ),
      );
    }
  }

  // ─── LÓGICA DE CHECKBOXES ──────────────────────────────────────────────

  void alternarCodigoPostal(String codigo, bool estaSeleccionado) {
    // Tomamos la lista actual para modificarla
    final nuevaLista = List<String>.from(state.codigosSeleccionados);

    if (estaSeleccionado) {
      if (!nuevaLista.contains(codigo)) nuevaLista.add(codigo);
    } else {
      nuevaLista.remove(codigo);
    }

    emit(state.copyWith(codigosSeleccionados: nuevaLista));
  }

  // ─── LÓGICA DE GUARDADO ────────────────────────────────────────────────

  Future<void> guardarSucursal({
    required Perfil usuarioActual,
    Sucursal? sucursalAEditar,
    required String nombre,
    required String calle,
    required String numeroExterior,
    required String codigoPostal,
    required String colonia,
    required String municipio,
    required String estado,
    required double? latitud,
    required double? longitud,
  }) async {
    if (state.municipio == null || state.estado == null) {
      emit(
        state.copyWith(errorMessage: 'Debe ingresar o cargar un C.P. válido.'),
      );
      return;
    }

    emit(
      state.copyWith(
        guardando: true,
        errorMessage: null,
        guardadoExitoso: false,
        sucursalIdCreada: null,
      ),
    );

    final resultado = sucursalAEditar == null
        ? await _crearSucursalUseCase
              .ejecutar(
                usuarioActual: usuarioActual,
                nombre: nombre,
                calle: calle,
                numeroExterior: numeroExterior,
                codigoPostal: codigoPostal,
                colonia: colonia.isNotEmpty ? colonia : (state.colonia ?? ""),
                municipio: state.municipio ?? "",
                estado: state.estado ?? "",
                latitud: latitud,
                longitud: longitud,
              )
              .run()
        : await _editarSucursalUseCase
              .ejecutar(
                // 🌟 Llama al de edición si existe
                usuarioActual: usuarioActual,
                sucursalModificada: sucursalAEditar.copyWith(
                  nombre: nombre,
                  calle: calle,
                  numExterior: numeroExterior,
                  codigoPostal: codigoPostal,
                  colonia: colonia,
                  municipio: state.municipio!,
                  estado: state.estado!,
                  latitud: latitud,
                  longitud: longitud,
                ),
                codigosPostales: state.codigosSeleccionados,
              )
              .run();

    resultado.fold(
      (failure) => emit(
        state.copyWith(guardando: false, errorMessage: failure.errorMessage),
      ),
      (sucursal) => emit(
        state.copyWith(
          guardando: false,
          guardadoExitoso: true,
          sucursalIdCreada: sucursal.id, 
          latitud: latitud ?? sucursal.latitud, 
          longitud: longitud ?? sucursal.longitud,
        ),
      ),
    );
  }
}
