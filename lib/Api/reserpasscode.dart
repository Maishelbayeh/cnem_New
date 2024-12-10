import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cenem/main.dart';

class PasswordResetApiService {
  Future<bool> resetPassword(String email) async {
    final String apiUrl = 'https://cnem.online/BE/api/Account/forget-password';

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
        },
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['message'] == "Password reset successful") {
          return true;
        } else if (responseBody['message'] ==
            "Password reset link has been sent to your email") {
          return true;
        } else if (responseBody['message'] == "User registered successfully") {
          return true;
        } else {
          return false;
        }
      } else if (response.statusCode == 401) {
        Get.offAllNamed('/Home');
      } else if (response.statusCode == 400) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['message'] ==
            "The email address could not be found. Please ensure you have entered the correct email address.") {
          return false;
        }
      } else {
        return false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
