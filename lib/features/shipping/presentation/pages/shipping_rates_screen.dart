import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/widgets/coverage_progress_bar.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/widgets/rate_form_bottom_sheet.dart';

class ShippingRatesScreen extends StatefulWidget {
  final String branchId;

  const ShippingRatesScreen({super.key, required this.branchId});

  @override
  State<ShippingRatesScreen> createState() => _ShippingRatesScreenState();
}

class _ShippingRatesScreenState extends State<ShippingRatesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ShippingAdminCubit>().loadData(widget.branchId);
  }

  void _openRateForm([ShippingRate? rateToEdit, ShippingRate? rateToSplit]) {
    final shippingCubit = context.read<ShippingAdminCubit>();
    final authCubit = context.read<AuthCubit>();

    final maxRadiusKm =
        shippingCubit.state.config?.maxRadiusKm ??
        shippingCubit.state.tempRadiusKm;

    final isSplitting = rateToSplit != null;

    final minAllowedKm = isSplitting
        ? rateToSplit.minDistanceKm
        : rateToEdit?.minDistanceKm ?? 0.0;

    final maxAllowedKm = isSplitting
        ? rateToSplit.maxDistanceKm
        : rateToEdit?.maxDistanceKm ?? maxRadiusKm;

    double defaultMin = 0.0;

    if (rateToEdit == null && shippingCubit.state.rates.isNotEmpty) {
      final maxExisting = shippingCubit.state.rates
          .map((rate) => rate.maxDistanceKm)
          .reduce((a, b) => a > b ? a : b);

      defaultMin = maxExisting;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (dialogContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: shippingCubit),
          BlocProvider.value(value: authCubit),
        ],
        child: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
          listenWhen: (prev, curr) =>
              prev.successMessage != curr.successMessage ||
              prev.error != curr.error,
          listener: (ctx, state) {
            if (state.successMessage != null &&
                state.successMessage!.contains('Tarifa')) {
              Navigator.of(ctx).pop();
            }
          },
          builder: (ctx, state) {
            return RateFormBottomSheet(
              rateToEdit: rateToEdit,
              defaultMinDistance: defaultMin,
              maxRadiusKm: maxRadiusKm,
              minAllowedKm: minAllowedKm,
              maxAllowedKm: maxAllowedKm,
              isSaving: state.isLoading,
              errorMessage: state.error,

              onSave: (name, minKm, maxKm, costInCents) async {
                final authState = ctx.read<AuthCubit>().state;
                if (authState is! AuthAuthenticated) return;

                final cubit = ctx.read<ShippingAdminCubit>();
                final currentState = cubit.state;

                final rates = List<ShippingRate>.of(currentState.rates)
                  ..sort((a, b) => a.minDistanceKm.compareTo(b.minDistanceKm));

                // 1. Crear la primera tarifa para cubrir todo el radio.
                if (rateToEdit == null && rateToSplit == null) {
                  if (rates.isNotEmpty) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Selecciona el rango que deseas dividir.',
                        ),
                      ),
                    );
                    return;
                  }

                  final newRate = ShippingRate(
                    id: '',
                    branchId: widget.branchId,
                    name: name,
                    minDistanceKm: 0,
                    maxDistanceKm: maxRadiusKm,
                    cost: costInCents,
                    isActive: true,
                    createdAt: DateTime.now(),
                  );

                  cubit.saveRates(
                    currentUser: authState.user,
                    branchId: widget.branchId,
                    rates: [newRate],
                  );
                  return;
                }

                // 2. Dividir manualmente el rango seleccionado.

                if (rateToSplit != null) {
                  await cubit.splitRate(
                    currentUser: authState.user,
                    branchId: widget.branchId,
                    rateId: rateToSplit.id,
                    name: name,
                    minKm: minKm,
                    maxKm: maxKm,
                    costInCents: costInCents,
                  );

                  return;
                }

                // 3. Editar una tarifa existente.
                if (rateToEdit == null) return;

                await cubit.editRate(
                  currentUser: authState.user,
                  branchId: widget.branchId,
                  rateId: rateToEdit.id,
                  name: name,
                  minKm: minKm,
                  maxKm: maxKm,
                  maxRadiusKm: maxRadiusKm,
                  costInCents: costInCents,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _deleteRateAndMerge(ShippingRate rateToDelete) async {
    final shippingCubit = context.read<ShippingAdminCubit>();
    final authCubit = context.read<AuthCubit>();

    if (shippingCubit.state.isLoading) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Eliminar tarifa'),
        content: Text(
          'Se eliminará "${rateToDelete.name}" y su rango se unirá '
          'a la tarifa siguiente. ¿Deseas continuar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final authState = authCubit.state;

    if (authState is! AuthAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Necesitas iniciar sesión para eliminar tarifas.'),
        ),
      );
      return;
    }

    // Recuperamos el estado más reciente después de confirmar.
    await shippingCubit.deleteAndMergeRate(
      currentUser: authState.user,
      branchId: widget.branchId,
      rateId: rateToDelete.id,
    );
  }

  Future<ShippingRate?> _selectRateToSplit() async {
    final rates = List<ShippingRate>.of(
      context.read<ShippingAdminCubit>().state.rates,
    )..sort((a, b) => a.minDistanceKm.compareTo(b.minDistanceKm));

    if (rates.isEmpty) return null;

    return showModalBottomSheet<ShippingRate>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Selecciona el rango que deseas dividir',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              for (final rate in rates)
                ListTile(
                  leading: const Icon(Icons.local_shipping_outlined),
                  title: Text(rate.name),
                  subtitle: Text(
                    '${rate.minDistanceKm.toStringAsFixed(1)}–'
                    '${rate.maxDistanceKm.toStringAsFixed(1)} km',
                  ),
                  onTap: () => Navigator.of(sheetContext).pop(rate),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tarifas de Envío')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Añadir Tarifa'),
        backgroundColor: colorScheme.primary,
        onPressed: () async {
          final shippingCubit = context.read<ShippingAdminCubit>();

          if (shippingCubit.state.isLoading) return;

          final rates = shippingCubit.state.rates;

          if (rates.isEmpty) {
            _openRateForm();
            return;
          }

          final selectedRate = await _selectRateToSplit();

          if (!mounted || selectedRate == null) return;

          _openRateForm(null, selectedRate);
        },
      ),
      body: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
        listenWhen: (prev, curr) =>
            prev.successMessage != curr.successMessage ||
            prev.error != curr.error,
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: colorScheme.error,
              ),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: colorScheme.primary,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.rates.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final maxRadius =
              state.config?.maxRadiusKm ??
              state.tempRadiusKm; // este es el radio max de confi btanches

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoverageProgressBar(rates: state.rates, maxLimitKm: maxRadius),
                const SizedBox(height: 24),
                const Text(
                  'Tarifas configuradas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(),

                if (state.rates.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: Text(
                        'No has configurado costos de envío. Usa el botón flotante para añadir tarifas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.rates.length,
                    itemBuilder: (context, index) {
                      final rate = state.rates[index];
                      final rateColor = CoverageProgressBar.getColor(
                        context,
                        index,
                      );
                      final textColor = CoverageProgressBar.getTextColor(
                        context,
                        rateColor,
                      );
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          onTap: () => _openRateForm(rate),
                          leading: CircleAvatar(
                            backgroundColor: rateColor,
                            child: Icon(Icons.local_shipping, color: textColor),
                          ),
                          title: Text(
                            rate.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'De ${rate.minDistanceKm} a ${rate.maxDistanceKm} km • \$${(rate.cost / 100).toStringAsFixed(2)}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: colorScheme.primary,
                                ),
                                tooltip: 'Editar tarifa',
                                onPressed: () => _openRateForm(rate),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: colorScheme.error,
                                ),
                                tooltip: 'Eliminar tarifa',
                                onPressed: state.isLoading
                                    ? null
                                    : () => _deleteRateAndMerge(rate),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
