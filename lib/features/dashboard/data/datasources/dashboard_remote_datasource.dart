import 'package:fruti_express_jahr_admin/features/dashboard/domain/use_cases/obtener_resumen_dashboard.dart';

abstract class DashboardRemoteDatasource {
  Future<ObtenerResumenDashboard> obtenerResumen();
}
