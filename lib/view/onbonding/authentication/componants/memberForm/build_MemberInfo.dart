// ignore_for_file: unused_import

import 'package:cenem/controllers/Membercontroller.dart';

import 'package:cenem/view/onbonding/build_error_lable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Textfield.dart';

Widget buildMemberIdField() {
  final SecondSignFormController controller =
      Get.put(SecondSignFormController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTextField(
        controller: controller.memberIdController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        hintText: 'رقم الهوية',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9),
        ],
        validator: controller.validateMemberId,
      ),
    ],
  );
}
