import 'package:cenem/view/onbonding/authentication/componants/popdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ensure SecondSignFormController is initialized correctly at a parent level
// Import necessary packages and files

// Define SecondSignFormController
class SecondSignFormController extends GetxController {
  var gender = ''.obs;
  var nationality = ''.obs;
}

// Widget function to build gender and nationality row
Widget buildGenderAndNationalityRow(BuildContext context) {
  // Access the controller using Get.find
  // ignore: unused_local_variable
  final controller = Get.find<SecondSignFormController>();

  double screenWidth = MediaQuery.of(context).size.width;
  double paddingBetweenItems = screenWidth * 0.01;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: screenWidth * 0.28,
        child: Obx(() {
          return CustomDropdownFormField(
            hint: 'الجنس',
            items: const ['ذكر', 'انثى'],
            value: "",
            onChanged: (value) {},
          );
        }),
      ),
      SizedBox(width: paddingBetweenItems),
      SizedBox(
        width: screenWidth * 0.28,
        child: Obx(() {
          return CustomDropdownFormField(
            hint: 'الجنسية',
            items: const ['اردنية', 'فلسطينية'],
            value: "",
            onChanged: (value) {},
          );
        }),
      ),
    ],
  );
}
