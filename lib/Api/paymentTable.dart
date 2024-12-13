import 'dart:convert';
import 'package:cenem/main.dart';
import 'package:http/http.dart' as http;
import 'package:cenem/model/paymentTable.dart';
import 'package:cenem/res/variables.dart';

class ApiServicee {
  final String apiUrl =
      'https://cnem.online/BE/api/MonthlySubscriptionPayments/GetMonthlySubscriptionPaymentsList';

  Future<List<SubscriptionPayment>> fetchSubscriptionPayments() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'accept': 'text/plain',
        'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      subscriptionPayment =
          body.map((json) => SubscriptionPayment.fromJson(json)).toList();

      await subscriptionPaymentService
          .saveSubscriptionPayments(subscriptionPayment!);
      return body.map((json) => SubscriptionPayment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subscription payments');
    }
  }
}
