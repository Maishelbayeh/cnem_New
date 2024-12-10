import 'dart:convert';

import 'package:cenem/model/member_model.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/services/saveMember.dart';
import 'package:cenem/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Ensure you have the authToken available globally or pass it as a parameter
MemberService memberService = MemberService();
Future<Member?> fetchOffspringMembers(String? memberId) async {
  try {
    String url = "https://cnem.online/BE/api/Members/GetMemberByUserId";
    //////print
    (url);

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.authToken ?? authtoken}',
      "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
    };
    ////print
    (headers);
    final response = await http.get(Uri.parse(url), headers: headers);
    ////print
    // (response.body);
    // // ////print
    // (response.statusCode);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Member member = Member.fromJson(jsonResponse);

      await memberService.saveMember(member);
      mem = member;
      ismember = true;

      return member;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
  return null;
}
