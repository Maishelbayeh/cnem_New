import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildNextButton(BuildContext context) {
  final SecondSignFormController controller =
      Get.put(SecondSignFormController());
  return CustomButton(
    buttonText: 'التالي',
    height: 40,
    width: MediaQuery.of(context).size.width * 0.7,
    onTap: () {
      if (controller.validateForm()) {
        // Proceed with form submission
      } else {
        // Handle form validation errors
      }
    },
  );
}
