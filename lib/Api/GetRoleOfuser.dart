import 'dart:convert';
import 'package:cenem/main.dart';
import 'package:cenem/res/variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> isSuperAdminRoleSelected() async {
  final url =
      'https://cnem.online/BE/api/Administration/GetRolesInUser/${user.userId}/roles';
  final headers = {
    'accept': 'text/plain',
    'Authorization': 'Bearer ${user.authToken}',
    'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d'
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    final List<dynamic> roles = json.decode(response.body);
    final bool isSuperAdminSelected = roles.any((role) =>
        role['isSelected'] == true && role['roleName'] == 'SuperAdmin');
    isSuperAdmin = isSuperAdminSelected;
    await storageService.saveBool("isSuperAdmin", isSuperAdmin);
  } else if (response.statusCode == 401) {
    Get.offAllNamed('/Home');
  } else {
    //print('Failed to load roles: ${response.statusCode}');
  }
}

void main() async {
  await isSuperAdminRoleSelected();
}
