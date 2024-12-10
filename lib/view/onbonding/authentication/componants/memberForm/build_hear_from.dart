import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/view/onbonding/authentication/componants/switchTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeardFromPersonSwitch() {
  final SecondSignFormController controller =
      Get.put(SecondSignFormController());
  return Obx(() {
    return CustomSwitchListTile(
      title: 'هل سمعت عن الشبكة من شخص فيها ؟',
      value: controller.heardFromPerson.value,
      onChanged: (bool value) {
        controller.heardFromPerson.value = value;
        if (!value) {
          controller.parentTokenController.text = '00000';
        } else {
          controller.parentTokenController.clear();
        }
      },
      validator: (String? value) {},
    );
  });
}
