import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final bool isSelected; 
  final VoidCallback? onTap;

  const AddressCard({
    super.key,
    required this.address,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // 👈 Extraemos el tema
    
    final branchState = context.watch<BranchCubit>().state;
    final shippingState = context.watch<CustomerShippingCubit>().state; 
    final branches = branchState.branches;
    final configurations = shippingState.configs;
    
    bool inactiveBranchCoversAddress = false;
    bool hasCoverage = false;
    String noCoverageReason = '';
    
    if (branches.isNotEmpty && configurations.isNotEmpty) {
      double minDistanceFound = double.infinity;
      double nearestBranchRadius = 0.0;
      bool wasRejectedByZipCode = false;

      for (var branch in branches) {
        final configIndex = configurations.indexWhere(
          (c) => c.branchId == branch.id,
        );
        
        if (configIndex == -1) {
          continue;
        }

        final branchConfig = configurations[configIndex];
        
        if (branchConfig.requireZipCodeValidation &&
            !branchConfig.allowedZipCodes.contains(address.zipCode)) {
          wasRejectedByZipCode = true;
          continue;
        }

        if (branch.latitude != null && branch.longitude != null) {
          final distanceKm = GetIt.I<LocationService>().calculateDistance( 
            lat1: branch.latitude!,
            lon1: branch.longitude!,
            lat2: address.latitude,
            lon2: address.longitude,
          );

          if (distanceKm <= branchConfig.maxRadiusKm) {
            if (!branch.active) {
              inactiveBranchCoversAddress = true;
              continue;
            }

            hasCoverage = true;
            noCoverageReason = '';
            break;
          }

          if (distanceKm < minDistanceFound) {
            minDistanceFound = distanceKm;
            nearestBranchRadius = branchConfig.maxRadiusKm;
          }
        }
      }

      if (!hasCoverage) {
        if (inactiveBranchCoversAddress) {
          noCoverageReason = 'Servicio no disponible por el momento';
        } else if (minDistanceFound != double.infinity) {
          noCoverageReason =
              'A ${minDistanceFound.toStringAsFixed(1)} km '
              '(Máx: $nearestBranchRadius km)';
        } else if (wasRejectedByZipCode) {
          noCoverageReason = 'C.P. fuera de área';
        } else {
          noCoverageReason = 'Sin cobertura';
        }
      }
    } else {
      hasCoverage = false;
      noCoverageReason = 'Calculando zona...';
    }

    return InkWell(
      onTap: hasCoverage ? onTap : null, 
      borderRadius: BorderRadius.circular(16),
      child: Opacity(
        opacity: hasCoverage ? 1.0 : 0.55,
        child: Card(
          elevation: isSelected ? 4 : (hasCoverage ? 2 : 0),
          color: isSelected ? colorScheme.surfaceContainer : colorScheme.surface, // 👈 Fondo dinámico
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: !hasCoverage
                  ? (inactiveBranchCoversAddress
                        ? colorScheme.tertiary // 👈 Usado como advertencia en M3
                        : colorScheme.error) // 👈 Usado para errores de cobertura
                  : (isSelected
                        ? colorScheme.secondaryContainer
                        : Colors.transparent),
              width: isSelected ? 2.0 : 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SECCIÓN DEL ALIAS ---
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            address.alias.toLowerCase().contains('casa')
                                ? Icons.home
                                : Icons.location_on,
                            color: hasCoverage
                                ? colorScheme.primary // 👈 Ícono activo
                                : colorScheme.outline, // 👈 Ícono inactivo
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              address.alias,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 8), 
                    
                    // --- SECCIÓN DE LA ETIQUETA DE ERROR ---
                    if (!hasCoverage)
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: inactiveBranchCoversAddress
                                ? colorScheme.tertiaryContainer // 👈 Fondo de advertencia
                                : colorScheme.errorContainer, // 👈 Fondo de error
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min, 
                            children: [
                              Icon(
                                inactiveBranchCoversAddress
                                    ? Icons.warning_amber_rounded
                                    : Icons.block,
                                size: 14,
                                color: inactiveBranchCoversAddress
                                    ? colorScheme.onTertiaryContainer // 👈 Ícono de advertencia
                                    : colorScheme.onErrorContainer, // 👈 Ícono de error
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  noCoverageReason,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: inactiveBranchCoversAddress
                                        ? colorScheme.onTertiaryContainer // 👈 Texto de advertencia
                                        : colorScheme.onErrorContainer, // 👈 Texto de error
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const Divider(height: 24),
                Text(
                  '${address.street} #${address.exteriorNumber}'
                  '${address.interiorNumber != null ? ' Int. ${address.interiorNumber}' : ''}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Col. ${address.neighborhood}, C.P. ${address.zipCode}',
                  style: TextStyle(color: colorScheme.onSurfaceVariant), // 👈 Reemplaza gris fijo
                ),
                Text(
                  '${address.municipality}, ${address.state}',
                  style: TextStyle(color: colorScheme.onSurfaceVariant), // 👈 Reemplaza gris fijo
                ),
                if (address.references != null &&
                    address.references!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Ref: ${address.references}',
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: colorScheme.outline, // 👈 Reemplaza gris fijo
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}