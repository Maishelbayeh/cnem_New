import 'dart:convert';
import 'package:cenem/model/paymentTable.dart';
import 'package:get_storage/get_storage.dart';

class SubscriptionPaymentService {
  final GetStorage _storage = GetStorage();
  final String _key = 'subscriptionPayments'; // Updated key to indicate a list

  // Save the list of SubscriptionPayment objects to storage
  Future<void> saveSubscriptionPayments(
      List<SubscriptionPayment> subscriptionPayments) async {
    // Convert the list of SubscriptionPayment objects to a list of maps (JSON format)
    List<Map<String, dynamic>> jsonList =
        subscriptionPayments.map((payment) => payment.toJson()).toList();
    String subscriptionPaymentsJson = jsonEncode(jsonList);
    await _storage.write(_key, subscriptionPaymentsJson);
  }

  // Load the list of SubscriptionPayment objects from storage
  List<SubscriptionPayment>? loadSubscriptionPayments() {
    String? subscriptionPaymentsJson = _storage.read<String>(_key);
    if (subscriptionPaymentsJson != null) {
      // Parse the JSON string and map each element to a SubscriptionPayment object
      List<dynamic> jsonList = jsonDecode(subscriptionPaymentsJson);
      return jsonList
          .map((json) => SubscriptionPayment.fromJson(json))
          .toList();
    }
    return null;
  }

  // Clear the SubscriptionPayment objects from storage
  Future<void> clearSubscriptionPayments() async {
    await _storage.remove(_key);
  }
}

extension SubscriptionPaymentToJson on SubscriptionPayment {
  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'monthlyPaymentAmount': monthlyPaymentAmount,
      'amountPaid': amountPaid,
      'paymentDate': paymentDate.toIso8601String(),
      'reqCardNumber': reqCardNumber,
      'accountActivationStatus': accountActivationStatus,
      'referenceNumber': referenceNumber,
      'transactionUuid': transactionUuid,
    };
  }
}
