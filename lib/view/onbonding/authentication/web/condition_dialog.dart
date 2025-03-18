import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/view/onbonding/authentication/term_condition_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view model/getx_controllers/courses_controller.dart';

final controller = Get.put(CourseController());

// ignore: unused_element
Widget _buildDialog(
    BuildContext context, double widthFactor, double heightFactor) {
  SecondSignFormController controller = Get.find<SecondSignFormController>();
  controller.clearForm();
  return Obx(() => const Stack(children: [
        Center(
          child: TermsAndConditionsPage(),
        )
      ]));
}
