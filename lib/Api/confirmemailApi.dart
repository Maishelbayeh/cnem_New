// ignore_for_file: file_names

import 'dart:convert'; // For json.decode
import 'package:cenem/main.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<bool?> confirmEmailApi(String code, String email) async {
  final url = Uri.parse(
      'https://cnem.online/BE/api/Account/confirm-email?code=$code&email=$email');
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
  };

  try {
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Deserialize the response body into a ConfirmEmailResponse object
      final Map<String, dynamic> responseData = json.decode(response.body);
      user = User.fromJson(responseData);
      authtoken = user.authToken!;
      phone = user.phone;
      email = user.email;

      await storageService.saveString("phone", user.phone);
      await storageService.saveString("auth", user.authToken!);

      return true;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
      return false;
    }
  } catch (e) {
    return false;
  }
  return null;
}
