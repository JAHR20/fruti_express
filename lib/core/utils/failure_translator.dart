import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

import '../errors/failure_code.dart';
import '../errors/failures.dart';

String translateFailure(Failure failure) {
  final code = failure.when(
    validation: (code, _) => code,
    unauthorized: (code, _) => code,
    alreadyExists: (code, _) => code,
    server: (code, _) => code,
    notFound: (code) => code,
    insufficientStock: (code, _) => code,
    badRequest: (code, _) => code,
  );

  final params = failure.when(
    validation: (_, params) => params,
    unauthorized: (_, params) => params,
    alreadyExists: (_, params) => params,
    server: (_, params) => params,
    notFound: (_) => null,
    insufficientStock: (_, params) => params,
    badRequest: (_, params) => params,
  );

  switch (code) {
    case FailureCode.emptySearchId:
      return 'El ID de búsqueda no puede estar vacío.';
    case FailureCode.mustHaveOneActiveAdmin:
      return 'Debe existir al menos un administrador activo.';
    case FailureCode.branchMustBeSpecified:
      return 'Debe especificarse la sucursal.';
    case FailureCode.branchMissingForDeliveryPerson:
      return 'Falta la sucursal para el repartidor.';
    case FailureCode.managerProfileHasNoBranch:
      return 'Tu perfil de encargado no tiene una sucursal asignada.';

    case FailureCode.onlyAdminCanAssignRole:
      return 'Solo un admin puede asignar este rol.';
    case FailureCode.onlyAdminCanAssignManagers:
      return 'Solo un admin puede asignar encargados.';
    case FailureCode.noPermissionInBranch:
      return 'No tienes permiso en esta sucursal.';
    case FailureCode.noPermissionToAssignRole:
      return 'No tienes permisos para asignar este rol.';
    case FailureCode.noPermissionToPerformAction:
      return 'No tienes permiso para realizar esta acción.';
    case FailureCode.accessDeniedToStaffMetrics:
      return 'Acceso denegado a métricas de staff.';
    case FailureCode.accessDeniedAdminOnlyGlobalList:
      return 'Acceso denegado. Solo los administradores pueden ver la lista global.';
    case FailureCode.noPermissionToViewCustomers:
      return 'No tienes permisos para ver la lista de clientes.';
    case FailureCode.noPermissionToViewDeliveryPersons:
      return 'No tienes permisos para consultar repartidores.';
    case FailureCode.noPermissionToViewOtherProfiles:
      return 'No tienes permisos para ver el perfil de otros usuarios.';
    case FailureCode.accessDenied:
      return 'Acceso denegado.';
    case FailureCode.permissionDenied:
      return 'No tienes los permisos necesarios para realizar esta acción.';
    case FailureCode.adminRoleRequired:
      return 'Esta acción es exclusiva para administradores. No tienes los permisos suficientes.';

    case FailureCode.branchAlreadyHasManager:
      return 'La sucursal ya tiene un encargado asignado.';
    case FailureCode.userAlreadyActive:
      return 'El usuario ya está activo.';
    case FailureCode.userAlreadyDeactivated:
      return 'El usuario ya está desactivado.';

    case FailureCode.invalidLoginCredentials:
      return 'Correo o contraseña incorrectos. Por favor, verifica tus datos.';
    case FailureCode.userAlreadyRegistered:
      return 'Este correo ya está registrado en Fruti Express.';
    case FailureCode.weakPassword:
      return 'La contraseña debe tener al menos 6 caracteres.';
    case FailureCode.authError:
      final detail = params?['detail'] ?? 'Desconocido';
      return 'Error de autenticación: $detail';

    case FailureCode.databaseRecordExists:
      return 'El registro ya existe en la base de datos.';
    case FailureCode.databaseRecordNotFound:
      return 'No se encontró el registro solicitado.';
    case FailureCode.databaseError:
      final errorCode = params?['errorCode'] ?? '000';
      final errorMsg = params?['errorMsg'] ?? 'Error interno';
      return 'Error de base de datos ($errorCode): $errorMsg';

    case FailureCode.serverError:
      final errorMsg = params?['errorMsg'] ?? 'Error de conexión';
      return 'Ocurrió un error en el servidor: $errorMsg';

    case FailureCode.networkConnectionFailed:
      return 'No hay conexión a internet. Revisa tu red.';

    case FailureCode.incorrectDeliveryCode:
      return 'Código incorrecto. Verifica con el cliente e intenta de nuevo.';
    case FailureCode.orderNotInTransit:
      return 'Este pedido ya no está en camino.';
    case FailureCode.orderNotFound:
      return 'Pedido no encontrado. Contacta al encargado.';

    case FailureCode.insufficientStock:
      final productName = params?['productName'] ?? 'producto';
      final rawStock = params?['stock'] ?? 0;
      final stockInt = rawStock is int
          ? rawStock
          : int.tryParse(rawStock.toString()) ?? 0;
      final unitName = params?['unit'] as String?;
      final unit = MeasurementUnit.values.firstWhere(
        (e) => e.name == unitName,
        orElse: () => MeasurementUnit.piece,
      );
      final formattedStock = unit.format(stockInt);
      return 'El producto $productName no tiene suficiente stock. (Solo hay disponibles: $formattedStock)';

    case FailureCode.localCartLoadError:
      return 'Error al cargar el carrito local.';
    case FailureCode.branchNotSelected:
      return 'Selecciona una sucursal de entrega primero.';

    // --- Branches (Sucursales) ---
    case FailureCode.missingRequiredFields:
      return 'Faltan datos obligatorios. Por favor, completa todos los campos.';
    case FailureCode.invalidArgument:
      return 'Se requiere una sucursal para cargar el dashboard';
    case FailureCode.branchNotFound:
      return 'La sucursal no existe o no fue encontrada.';
    case FailureCode.locationCoordinatesRequired:
      return 'Las coordenadas de ubicación (latitud y longitud) son obligatorias para los envíos.';
    case FailureCode.branchAlreadyInRequestedState:
      return 'La sucursal ya se encuentra en el estado solicitado.';
    case FailureCode.branchNameAlreadyExists:
      return 'Ya existe una sucursal registrada con ese nombre.';

    // --- Postali / Ubicaciones ---
    case FailureCode.invalidPostalCodeLength:
      return 'El código postal debe tener exactamente 5 dígitos.';
    case FailureCode.postalCodeNotFound:
      return 'No se encontró información para el código postal ingresado.';
    case FailureCode.municipalityInfoNotFound:
      return 'No se pudo obtener la información del municipio para este código postal.';

    case FailureCode.genericError:
      return 'Ha ocurrido un error inesperado. Intenta de nuevo.';

    case FailureCode.invalidPrices:
      return 'Los precios ingresados no son válidos. El precio actual debe ser mayor a 0 y el precio de comparación (si existe) debe ser mayor o igual al actual.';

    case FailureCode.productNameAlreadyExists:
      return 'Ya existe otro producto registrado con este mismo nombre.';

    case FailureCode.productAlreadyInRequestedState:
      return 'El producto ya se encuentra en el estado que solicitaste.';

    case FailureCode.invalidSearchParameters:
      return 'El término de búsqueda y la sucursal son obligatorios para realizar la consulta.';

    case FailureCode.invalidProductId:
      return 'El ID del producto proporcionado no es válido.';

    case FailureCode.invalidProductName:
      return 'El nombre de búsqueda del producto no puede estar vacío.';

    case FailureCode.invalidCategoryOrBranchId:
      return 'El ID de la categoría y la sucursal son necesarios para realizar la búsqueda.';

    case FailureCode.invalidBranchId:
      return 'El ID de la sucursal proporcionado es necesario.';

    case FailureCode.productNameRequiredForImage:
      return 'El nombre del producto es obligatorio para agregar la imagen.';

    case FailureCode.invalidCategoryName:
      return 'El nombre de la categoría no puede estar vacío.';
    case FailureCode.categoryNameAlreadyExists:
      return 'Ya existe una categoría con ese nombre.';
    case FailureCode.parentCategoryNotFound:
      return 'La categoría padre seleccionada no existe.';
    case FailureCode.categoryNotFound:
      return 'Categoría no encontrada.';
    case FailureCode.categoryAlreadyInRequestedState:
      return 'La categoría ya se encuentra en el estado solicitado.';
    case FailureCode.categoryHasActiveSubcategories:
      return 'No se puede desactivar: existen subcategorías activas vinculadas.';
    case FailureCode.categoryCannotBeItsOwnParent:
      return 'Una categoría no puede ser su propio padre.';
    case FailureCode.invalidQuantity:
      return 'La cantidad a modificar debe ser mayor a cero.';
    case FailureCode.inventoryRecordNotFound:
      return 'No se encontró el registro de inventario solicitado.';
    case FailureCode.insufficientReservedStock:
      return 'Inconsistencia: La cantidad solicitada supera el stock reservado actual.';
    case FailureCode.branchIdRequired:
      return 'El ID de la sucursal es obligatorio.';
    case FailureCode.insufficientAvailableStock:
      return 'Stock insuficiente para realizar la reserva solicitada.';
    case FailureCode.invalidProductIdOrBranchId:
      return 'El ID del producto y de la sucursal son obligatorios.';
    case FailureCode.invalidAddressData:
      return 'Los datos de la dirección están incompletos. Verifica la calle, colonia y código postal.';
    case FailureCode.invalidCoordinates:
      return 'Las coordenadas geográficas proporcionadas no son válidas.';
    case FailureCode.invalidAddressId:
      return 'El identificador de la dirección no es válido.';
    case FailureCode.invalidUserId:
      return 'El identificador del usuario no es válido.';
    case FailureCode.invalidOrderId:
      return 'El identificador del pedido no es válido.';
    case FailureCode.invalidStatusTransition:
      return 'No es posible cambiar el pedido a este estado actualmente.';
    case FailureCode.invalidDriverRole:
      return 'El usuario seleccionado no cuenta con el rol de repartidor.';
    case FailureCode.branchMismatch:
      return 'El repartidor no pertenece a la misma sucursal que el pedido.';
    case FailureCode.missingDeliveryEvidence:
      return 'Debes proporcionar una foto de evidencia o el código de confirmación del cliente para entregar el pedido.';
    case FailureCode.emptyOrderItems:
      return 'El pedido debe contener al menos un producto.';
    case FailureCode.invalidOrderTotal:
      return 'El total del pedido no puede ser negativo.';

    case FailureCode.shippingConfigNotFound:
      return 'No se encontró configuración de envío para esta sucursal.';
    case FailureCode.shippingCalculationError:
      return 'No se pudo calcular la cotización del envío con los datos proporcionados.';
    case FailureCode.unauthorizedAccess:
      return 'No tienes permisos de administrador para realizar esta acción.';
    case FailureCode.invalidShippingRadius:
      return 'El radio máximo de entrega debe ser mayor a 0 km.';
    case FailureCode.invalidDistanceRange:
      return 'La distancia mínima no puede ser mayor o igual a la máxima.';
    case FailureCode.ratesMustCoverFullRadius:
      return 'Las tarifas deben cubrir el radio completo de entrega.';
    case FailureCode.ratesHaveGap:
      return 'Hay un hueco entre las tarifas de envío.';
    case FailureCode.ratesBranchMismatch:
      return 'La tarifa no corresponde a esta sucursal.';

    case FailureCode.invalidShippingCost:
      return 'El costo de envío no puede ser negativo.';
    case FailureCode.invalidAmount:
      return 'El monto ingresado no puede ser negativo.';
    case FailureCode.branchWithoutCoordinates:
      return 'Error crítico: La sucursal no tiene coordenadas GPS configuradas.';
    case FailureCode.noActiveRatesFound:
      return 'No hay tarifas de envío activas en esta sucursal.';
    case FailureCode.noRateForDistance:
      return 'No se encontró una tarifa que cubra esta distancia. El domicilio está fuera del rango de tarifas.';
    case FailureCode.outsideCoverage:
      return 'Tu código postal no tiene cobertura en esta sucursal. '
          'Elige otra dirección o pasa a recoger.';
    case FailureCode.outsideDeliveryZone:
      return 'Tu dirección está fuera de la zona de entrega. '
          'Elige otra dirección o pasa a recoger.';
    case FailureCode.invalidDeliveryAddress:
      return 'No pudimos validar tu dirección de entrega. '
          'Revisa o elige otra dirección.';

    case FailureCode.invalidDiscountValue:
      return 'El valor del descuento debe ser mayor a cero.';

    case FailureCode.invalidDateRange:
      return 'La fecha de caducidad no puede ser anterior a la fecha de inicio.';

    case FailureCode.couponNotFound:
      return 'Cupón no encontrado. Verifica que el código esté bien escrito.';

    case FailureCode.couponExpiredOrInactive:
      return 'Este cupón ha expirado o ya no se encuentra disponible.';

    case FailureCode.couponMinAmountNotMet:
      final missingAmount = params?['missingAmount'];
      if (missingAmount != null) {
        return 'Agrega \$$missingAmount más a tu carrito para poder usar este cupón.';
      }
      return 'El total de tu carrito no alcanza el monto mínimo requerido para usar este cupón.';

    case FailureCode.emptyCouponCode:
      return 'Por favor, ingresa el código del cupón que deseas aplicar.';

    case FailureCode.invalidMinPurchaseAmount:
      return 'El monto mínimo de compra no puede ser negativo.';

    case FailureCode.invalidUsageLimit:
      return 'El límite de usos debe ser mayor a cero.';
    case FailureCode.orderPreviewUnavailable:
      return 'No se pudo calcular la vista previa del pedido. Intenta de nuevo.';
  }
}
