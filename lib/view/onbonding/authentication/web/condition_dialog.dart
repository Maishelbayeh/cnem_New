import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/view/onbonding/authentication/term_condition_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view model/getx_controllers/courses_controller.dart';

final controller = Get.put(CourseController());

Widget _buildDialog(
    BuildContext context, double widthFactor, double heightFactor) {
  final Size screenSize = MediaQuery.of(context).size;
  double dialogWidth = screenSize.width * widthFactor;
  double dialogHeight = screenSize.height * heightFactor;
  SecondSignFormController controller = Get.find<SecondSignFormController>();
  controller.clearForm();
  return Obx(() => Stack(children: [
        Center(
          child: TermsAndConditionsPage(),
        )
      ]));
}
