import 'package:fruti_express_jahr_admin/features/dashboard/domain/use_cases/get_dashboard_summary_use_case.dart';

abstract class DashboardRemoteDatasource {
  Future<GetDashboardSummaryUseCase> obtenerResumen();
}
