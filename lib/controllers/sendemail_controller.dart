import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailController extends GetxController {
  final emailController = TextEditingController();
  var subjectController = ''.obs;
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var subjectError = ''.obs;
  void sendEmail() {
    if (formKey.currentState!.validate()) {
      // Handle sending email logic here
      //print('البريد الإلكتروني: ${emailController.text}');
      //print('الموضوع: ${subjectController.value}');
      //print('الرسالة: ${messageController.text}');
    }
  }

  String? validatesubject(String? value) {
    if (value == null || value.isEmpty) {
      subjectError.value = "يرجى اختيار جنس المستخدم";
      return subjectError.value;
    }
    subjectError.value = '';
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();

    messageController.dispose();
    super.onClose();
  }
}
