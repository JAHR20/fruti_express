class ConfirmDeliveryParams {
  final String orderId;
  final String? confirmationCode;
  final String? evidenceUrl;

  const ConfirmDeliveryParams({
    required this.orderId,
    this.confirmationCode,
    this.evidenceUrl,
  });
}