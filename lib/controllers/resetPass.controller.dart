import 'package:get/get.dart'; // Import GetX for state management
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PasswordResetController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs; // Reactive variable to track loading state

  @override
  void onClose() {
    // Dispose of controllers when the controller is closed
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<bool> resetPassword(String code, String email) async {
    isLoading.value = true; // Set loading state

    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Basic validation
    if (password.isEmpty || confirmPassword.isEmpty) {
      // Handle empty fields
      Get.snackbar('Error', 'Please fill in all fields');
      isLoading.value = false; // Reset loading state
      return false;
    }

    if (password != confirmPassword) {
      // Handle password mismatch
      Get.snackbar('Error', 'Passwords do not match');
      isLoading.value = false; // Reset loading state
      return false;
    }

    // API call for password reset
    final url = Uri.parse('https://cnem.online/BE/api/Account/reset-password');
    final headers = {
      "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d",
      'Content-Type': 'application/json'
    };

    final body = jsonEncode({
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'code': null,
    });
    //print(body);
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      //print(response.body);
      if (response.statusCode == 200) {
        // Handle success response
        // Navigate to the login screen or next step
        return true; // Example navigation
      } else {
        // Handle error response
        final errorResponse = jsonDecode(response.body);
        Get.snackbar(
            'Error', errorResponse['message'] ?? 'Failed to reset password');
        return false;
      }
    } catch (e) {
      // Handle network errors
      Get.snackbar('Error', 'Failed to reset password $e');
      return false;
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }
}
