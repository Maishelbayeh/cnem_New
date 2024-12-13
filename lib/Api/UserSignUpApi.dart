import 'dart:convert';
import 'package:cenem/main.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<String?> signUpUser(User userInfo) async {
  final String proxyUrl = 'https://cnem.online/BE/api/Account/register';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
  };

  final Map<String, dynamic> body = userInfo.toJson();

  try {
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      user = userInfo;

      email = user.email;
      userService.saveUser(User.fromJson(responseData));

      return 'success';
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
    } else {
      if (response.body.contains('The ُmail already exists.')) {
        return 'email-already-exists';
      } else {
        return response.body;
      }
    }
  } catch (e) {
    return 'error';
  }
  return null;
}
