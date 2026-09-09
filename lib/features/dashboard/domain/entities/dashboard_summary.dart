class DashboardSummary {
  final int pendingOrders;
  final int preparingOrders;
  final int onTheWayOrders; 
  final int todaysSales; 
  final int todaysTotalOrders;

  DashboardSummary({
    required this.pendingOrders,
    required this.preparingOrders,
    required this.onTheWayOrders,
    required this.todaysSales,
    required this.todaysTotalOrders,
  });
}