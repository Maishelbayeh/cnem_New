import 'dart:convert';
import 'package:cenem/res/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<bool> sendMail({
  required String subject,
  required String body,
  required List<String> attachments,
}) async {
  final url = Uri.parse('https://cnem.online/BE/api/Mailling/SendMail');
  final headers = {
    'accept': '*/*',
    'Authorization': 'Bearer $authtoken',
    "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d",
    'Content-Type': 'application/json',
  };
  final bodyData = jsonEncode({
    'toEmail': "cnem.technichal@gmail.com",
    'subject': subject,
    'body': body,
    'attachments': [],
  });

  try {
    final response = await http.post(url, headers: headers, body: bodyData);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
    } else {
      return false;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return false;
}

void main() async {
  const subject = 'Test Email';
  const body = 'This is a test email.';
  final attachments = ['attachment1', 'attachment2'];

  await sendMail(
    subject: subject,
    body: body,
    attachments: attachments,
  );
}
