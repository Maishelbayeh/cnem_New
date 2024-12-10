import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  // Define your text controllers
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameEController = TextEditingController();

  final lastNameEController = TextEditingController();
  final memberIdController = TextEditingController();
  final dateEditingController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // Add your other necessary fields here, e.g.:
  List<String> name = [];
  List<String> nameE = [];

  // Define the auth controller

  @override
  void onInit() {
    super.onInit();
    // You can initialize your fields here if needed
    updateControllerFields();
  }

  void updateControllerFields() {
    // Check if name and nameE arrays have at least 3 elements
    if (name.length >= 3) {
      firstNameController.text = name[0];
      middleNameController.text = name[1];
      lastNameController.text = name[2];
    } else {
      // Handle the case where name array does not have enough elements
      firstNameController.text = '';
      middleNameController.text = '';
      lastNameController.text = '';
    }

    // Check if nameE array has at least 2 elements
    if (nameE.length >= 2) {
      firstNameEController.text = nameE[0];

      lastNameEController.text = nameE[1]; // Should this be nameE[2]?
    } else {
      // Handle the case where nameE array does not have enough elements
      firstNameEController.text = '';

      lastNameEController.text = '';
    }

    // Set other fields
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب'; // "This field is required" in Arabic
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'البريد الإلكتروني مطلوب'; // "Email is required" in Arabic
    }
    // Add more email validation if needed
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'رقم الهاتف مطلوب'; // "Phone number is required" in Arabic
    }
    // Add more phone validation if needed
    return null;
  }

  String? validateDate(String value) {
    if (value.isEmpty) {
      return 'تاريخ الميلاد مطلوب'; // "Date of birth is required" in Arabic
    }
    // Add more date validation if needed
    return null;
  }

  // Function to validate all fields
  bool validateAllFields() {
    if (validateName(firstNameController.text) != null ||
        validateName(middleNameController.text) != null ||
        validateName(lastNameController.text) != null ||
        validateName(firstNameEController.text) != null ||
        validateName(lastNameEController.text) != null ||
        validateName(memberIdController.text) != null ||
        validateEmail(emailController.text) != null ||
        validatePhone(phoneController.text) != null ||
        validateDate(dateEditingController.text) != null) {
      return false;
    }
    return true;
  }
}

// Define your AuthController similarly

// Example Member and User classes, replace with your actual implementation
