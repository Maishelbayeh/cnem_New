import 'dart:convert';
import 'package:cenem/main.dart';
import 'package:cenem/model/member_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cenem/res/variables.dart';

Future<bool> addMemberAPI(Member member) async {
  final String proxyUrl = 'https://cnem.online/BE/api/Members/AddMember';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${user.authToken}',
    "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
  };

  final Map<String, dynamic> body = member.toJson();

  try {
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    //print(member.toJson());

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      isfreemember = responseData['isFreeAccount'];

      await storageService.saveBool(
          "isFreeAccount", responseData['isFreeAccount']);
      // Assuming the API returns a boolean field indicating success
      return responseData['isSuccess'] ??
          true; // Default to true if 'isSuccess' is not present
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
      return false;
    }

    // Optionally handle other status codes if needed
  } catch (e) {
    //print('Error occurred: $e');
    return false;
  }

  return false; // Return false by default if statusCode is not 200 or 201
}
