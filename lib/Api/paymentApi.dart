// api_service.dart
import 'package:cenem/main.dart';
import 'package:cenem/model/paymentModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String apiUrl =
    'https://cnem.online/BE/api/Payment/CalculateSubscription?Recurring=true';
String? apiKey = apiKey;
String bearerToken = 'Bearer ${user.authToken}';

Future<Subscription?> fetchSubscription() async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'accept': '*/*',
      'Authorization': bearerToken,
      'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
    },
  );

  if (response.statusCode == 200) {
    sub = subscriptionFromJson(response.body);
    subscriptionService.saveSubscription(sub!);

    return subscriptionFromJson(response.body);
  } else if (response.statusCode == 401) {
    Get.offAllNamed('/Home');
  } else {
    return null;
  }
  return null;
}
