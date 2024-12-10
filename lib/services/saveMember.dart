import 'package:cenem/model/member_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MemberService {
  static const String _memberKey = 'member_key';

  // Save the Member object in SharedPreferences
  Future<void> saveMember(Member member) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String memberJson = jsonEncode(member.toJson());
    await prefs.setString(_memberKey, memberJson);
  }

  // Load the Member object from SharedPreferences
  Future<Member?> loadMember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? memberJson = prefs.getString(_memberKey);
    if (memberJson != null) {
      Map<String, dynamic> memberMap = jsonDecode(memberJson);
      return Member.fromJson(memberMap);
    }
    return null;
  }

  // Clear the Member data from SharedPreferences
  Future<void> clearMember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_memberKey);
  }
}
