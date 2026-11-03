enum FailureCode {
  // --- Validation ---
  emptySearchId,
  mustHaveOneActiveAdmin,
  branchMustBeSpecified,
  branchMissingForDeliveryPerson,
  managerProfileHasNoBranch,

  // --- Unauthorized (Permisos) ---
  onlyAdminCanAssignRole,
  onlyAdminCanAssignManagers,
  noPermissionInBranch,
  noPermissionToAssignRole,
  noPermissionToPerformAction,
  accessDeniedToStaffMetrics,
  accessDeniedAdminOnlyGlobalList,
  noPermissionToViewCustomers,
  noPermissionToViewDeliveryPersons,
  noPermissionToViewOtherProfiles,
  accessDenied,
  permissionDenied,
  adminRoleRequired,

  // --- Already Exists / Conflictos de Estado ---
  branchAlreadyHasManager,
  userAlreadyActive,
  userAlreadyDeactivated,

  // --- Otros (Ej. Pedidos/Inventario) ---
  insufficientStock,
  genericError,
  invalidArgument,
  localCartLoadError,
  branchNotSelected,

  invalidLoginCredentials,
  userAlreadyRegistered,
  weakPassword,
  authError,

  // --- Supabase Database ---
  databaseRecordExists,
  databaseRecordNotFound,
  databaseError,
  serverError,

  // --- Network ---
  networkConnectionFailed,

  // --- RPC / Orders ---
  incorrectDeliveryCode,
  orderNotInTransit,
  orderNotFound,

  // --- Branches ----
  missingRequiredFields,
  branchNotFound,
  locationCoordinatesRequired,
  branchAlreadyInRequestedState,
  branchNameAlreadyExists,

  // --- Postali / Ubicaciones ---
  invalidPostalCodeLength,
  postalCodeNotFound,
  municipalityInfoNotFound,

  // Códigos de Productos
  invalidPrices,
  productNameAlreadyExists,
  productAlreadyInRequestedState,
  invalidSearchParameters,

  // Errores de validación de Productos
  invalidProductId,
  invalidProductName,
  invalidCategoryOrBranchId,
  invalidBranchId,
  productNameRequiredForImage,

  // Códigos de categorias
  invalidCategoryName,
  categoryNameAlreadyExists,
  parentCategoryNotFound,
  categoryNotFound,
  categoryAlreadyInRequestedState,
  categoryHasActiveSubcategories,
  categoryCannotBeItsOwnParent,

  // inventario
  invalidQuantity,
  inventoryRecordNotFound,
  insufficientReservedStock,
  branchIdRequired,
  invalidProductIdOrBranchId,
  insufficientAvailableStock,

  // direcciones
  invalidAddressData,
  invalidCoordinates,
  invalidAddressId,
  invalidUserId,

  // Pedidos
  invalidOrderId,
  invalidStatusTransition,
  invalidDriverRole,
  branchMismatch,
  missingDeliveryEvidence,
  emptyOrderItems,
  invalidOrderTotal,
  orderPreviewUnavailable,
  outsideCoverage,
  outsideDeliveryZone,
  invalidDeliveryAddress,

  orderNotAssigned,
  orderNotInYourBranch,
  invalidFailureReason,
  cardOrderNeedsRefund,
  cardOrderNotConfirmable,
  orderNotPending,
  orderNotConfirmed,
  invalidDriverForBranch,

  invalidCancellationReason,
  orderNotCancellable,
  orderNotReadyToDepart,

  // Módulo de Envíos (Shipping)
  shippingConfigNotFound,
  shippingCalculationError,
  unauthorizedAccess,
  invalidShippingRadius,
  ratesMustCoverFullRadius, // no empieza en 0 o no llega al radio
  ratesHaveGap, // hueco entre dos tarifas
  ratesBranchMismatch, // tarifa de otra sucursal
  invalidDistanceRange,
  invalidShippingCost,
  invalidAmount,

  // services
  branchWithoutCoordinates,
  noActiveRatesFound,
  noRateForDistance,

  // coupons
  invalidDiscountValue,
  invalidDateRange,
  couponNotFound,
  couponExpiredOrInactive,
  couponMinAmountNotMet,
  emptyCouponCode,
  invalidMinPurchaseAmount,
  invalidUsageLimit,
}
