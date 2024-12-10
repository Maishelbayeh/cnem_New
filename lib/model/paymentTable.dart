class SubscriptionPayment {
  final int paymentId;
  final double monthlyPaymentAmount;
  final double amountPaid;
  final DateTime paymentDate;
  final String? reqCardNumber;
  final bool accountActivationStatus;
  final String referenceNumber;
  final String transactionUuid;

  SubscriptionPayment({
    required this.paymentId,
    required this.monthlyPaymentAmount,
    required this.amountPaid,
    required this.paymentDate,
    this.reqCardNumber,
    required this.accountActivationStatus,
    required this.referenceNumber,
    required this.transactionUuid,
  });

  factory SubscriptionPayment.fromJson(Map<String, dynamic> json) {
    return SubscriptionPayment(
      paymentId: json['paymentId'],
      monthlyPaymentAmount: json['monthlyPaymentAmount'].toDouble(),
      amountPaid: json['amountPaid'].toDouble(),
      paymentDate: DateTime.parse(json['paymentDate']),
      reqCardNumber: json['reqCardNumber'],
      accountActivationStatus: json['accountActivationStatus'],
      referenceNumber: json['reference_number'],
      transactionUuid: json['transactionUuid'],
    );
  }
}
