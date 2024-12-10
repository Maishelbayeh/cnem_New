import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> writeSecureStorage(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readSecureStorage(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteSecureStorage(String key) async {
    await _storage.delete(key: key);
  }
}

// Future<void> addMember() async {
//   final url = Uri.parse('https://cnem.online/BE/api/Members/AddMember');
//   final token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtYXlzaGVsYmF5ZWg1QGdtYWlsLmNvbSIsImp0aSI6IjJkYzY1MDkwLTI5YjAtNDIwMi1iM2Y5LWVkYzcyOTYzNTUxZCIsInJvbGUiOiJCYXNpYyIsIk1lbWJlcnMiOlsiTWVtYmVyRXhpc3RzQnlVc2VySWQiLCJNZW1iZXJFeGlzdHNUb2tlbiIsIkFkZE1lbWJlciIsIkdldE1lbWJlckJ5VXNlcklkIl0sIlBheW1lbnQiOlsiQ3JlYXRlUGF5bWVudE9uZVRpbWUiLCJDcmVhdGVQYXltZW50UmVjdXJyaW5nIl0sIm5iZiI6MTcyMTc1NTQyNiwiZXhwIjoxNzIxNzU2MzI2LCJpYXQiOjE3MjE3NTU0MjYsImlzcyI6IkNuZW1TZWN1cmVBcGkiLCJhdWQiOiJDbmVtU2VjdXJlQXBpVXNlciJ9.p8o70BEOBVHrZywyVc2JYSCe4DKLwhjlhW5LIR3YHMo';
//   final headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//     "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
//   };

//   final body = {
//     'memberName': 'مي ش يي',
//     'idNumber': '444444444',
//     'gender': 1,
//     'birthday': '2024-01-01T00:00:00.000',
//     'parentsToken': '2222222',
//     'nationality': 'فلسطينية',
//     'userId': '5ec95555-eea4-4431-a1ce-c743813cec8d',
//     'memberToken': null,
//     'companyPolicyApproval': true,
//     'memberNameEnglish': 'dddddd',
//   };

//   final response = await http.post(
//     url,
//     headers: headers,
//     body: jsonEncode(body),
//   );

//   if (response.statusCode == 200) {
//     //print('Member added successfully');
//   } else {
//     //print('Failed to add member: ${response.statusCode}');
//     //print('Response body: ${response.body}');
//   }
// }

// void main() async {
//   await addMember();
// }
