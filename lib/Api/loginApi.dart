// ignore_for_file: file_names

import 'dart:convert';
import 'package:cenem/main.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Secure storage class to handle storing tokens
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

// Global variables to store the token and user ID

// Function to log in the user
Future<Map<String, dynamic>?> loginUser(
    String newemail, String password, bool rememberMe) async {
  final String proxyUrl = 'https://cnem.online/BE/api/Account/login';
  print(proxyUrl);

  final SecureStorage secureStorage = SecureStorage();

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d"
  };

  final Map<String, dynamic> body = {
    'email': newemail,
    'password': password,
    'rememberMe': rememberMe,
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      Loadduser = User.fromJson(responseData);
      user = User.fromJson(responseData);

      authtoken = user.authToken!;
      phone = user.phone;
      email = newemail;
      userService.saveUser(User.fromJson(responseData));
      await storageService.saveString("email", email);
      await storageService.saveString("phone", user.phone);
      await storageService.saveString("auth", user.authToken!);

      // Save the token and user ID in secure storage
      await secureStorage.writeSecureStorage('token', responseData['token']);
      await secureStorage.writeSecureStorage('userId', responseData['userId']);

      // Save the token and user ID in global variables

      //   userId = responseData['userId'];

      return {
        'status': 'success',
        'message': responseData['message'],
        'userId': responseData['userId'],
        'confirmEmail': responseData['confirmEmail'],
        'confirmPhone': responseData['confirmPhone'],
        'phoneNumber': responseData['phoneNumber'],
        'token': responseData['token'],
      };
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['confirmPhone'] == false) {
        return {
          'status': 'Phone not confirmed',
          'message': responseData['message']
        };
      } else if (responseData['message'] == 'Invalid password.') {
        return {
          'status': 'invalid-password',
          'message': responseData['message']
        };
      } else if (responseData['message'] == 'Invalid login attempt.') {
        return {
          'status': 'email-not-exist',
          'message': responseData['message']
        };
      } else if (responseData['message'].contains('Email not confirmed.')) {
        return {
          'status': 'Phone not confirmed',
          'message': responseData['message']
        };
      } else if (response.statusCode == 401) {
        Get.offAllNamed('/Home');
      } else {
        confirmEmail = false;

        return {
          'status': 'email-not-confirmed',
          'message': responseData['message'],
          'login': responseData['login'],
          'confirmEmail': responseData['confirmEmail'],
        };
      }
    } else {
      return {'status': 'login-failed'};
    }
  } catch (e) {
    return {'status': 'error'};
  }
  return null;
}
