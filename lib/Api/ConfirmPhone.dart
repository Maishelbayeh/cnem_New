import 'package:cenem/res/variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:cenem/main.dart';

Future<bool> confirmPhoneApi(String code, String email) async {
  final url = Uri.parse(
      'https://cnem.online/BE/api/Account/ConfirmPhone?code=$code&email=${email}');
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
    'Authorization':
        'Bearer ${user.authToken ?? storageService.loadString('auth')}',
  };

  try {
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Deserialize the response body into a ConfirmEmailResponse object
      //   final Map<String, dynamic> responseData = json.decode(response.body);

      return true;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
      return false;
    }
    return false;
  } catch (e) {
    return false;
  }
}
