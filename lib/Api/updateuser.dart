import 'dart:convert';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/res/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> updateMember(Member member) async {
  final url =
      'https://cnem.online/BE/api/Members/UpdateMemberViewModel/${mem.Id}';

  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $authtoken',
    "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d",
  };
  final Map<String, dynamic> body = {
    'id': mem.Id,
    'memberName': member.memberName,
    'birthday':
        member.birthday?.toIso8601String() ?? mem.birthday?.toIso8601String(),
    'memberNameEnglish': member.memberNameEnglish,
  };

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body), // Encode the body as a JSON string
    );

    if (response.statusCode == 200) {
      Get.snackbar(
        "نجاح",
        "تم تعديل العضو بنجاح",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
    } else {}
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
