import 'package:cenem/Api/paymentApi.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<bool> sendSmsToConfirmPhone(String phone) async {
  // Replace with your actual API base URL
  const String apiBaseUrl = 'https://cnem.online/BE/api';
  const String endpoint = '/Account/SendSmsToConfirmPhone';

  // Complete URL with query parameters
  final Uri url = Uri.parse('$apiBaseUrl$endpoint?Phone=$phone');

  try {
    final response = await http.post(
      url,
      headers: {
        'accept': '*/*',
        "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.authToken ?? authtoken}',
      },
    );

    if (kDebugMode) {
      print(phone);
      print(response.body);
    }

    if (response.statusCode == 200) {
      if (confirmEmail!) {
        // Optionally handle the case if needed
      } else {
        Get.find<AuthController>().isShowLoading.value = false;
        Get.find<DialogNavigationController>().currentPage('/confirmSms');
      }

      if (kDebugMode) {
        print('SMS sent successfully to $phone.');
      }

      return true; // SMS sent successfully
    } else {
      if (kDebugMode) {
        Get.find<AuthController>().isShowLoading.value = false;
        print('Failed to send SMS. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      return false; // Failed to send SMS
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error occurred: $e');
    }

    return false; // Error occurred
  }
}
