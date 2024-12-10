// subscription_model.dart
import 'dart:convert';

class Subscription {
  final double currentPaymentNow;
  final DateTime recurringStartDate;
  final double recurringMonthlyPayment;
  final String? email;

  Subscription({
    this.email,
    required this.currentPaymentNow,
    required this.recurringStartDate,
    required this.recurringMonthlyPayment,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      currentPaymentNow: json['currentPaymentNow'].toDouble(),
      recurringStartDate: DateTime.parse(json['recurringStartDate']),
      email: json['email'],
      recurringMonthlyPayment: json['recurringMonthlyPayment'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPaymentNow': currentPaymentNow,
      'recurringStartDate': recurringStartDate.toIso8601String(),
      'recurringMonthlyPayment': recurringMonthlyPayment,
    };
  }
}

Subscription subscriptionFromJson(String str) =>
    Subscription.fromJson(json.decode(str));
String subscriptionToJson(Subscription data) => json.encode(data.toJson());
