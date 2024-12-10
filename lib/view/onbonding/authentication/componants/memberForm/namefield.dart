import 'package:cenem/view/onbonding/authentication/componants/memberForm/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveNameFields extends StatelessWidget {
  final controller;

  ResponsiveNameFields({required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Display in a row for larger screens
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildFirstNameField(),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _buildMiddleNameField(),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _buildLastNameField(),
              ),
            ],
          );
        } else {
          // Display in a column for smaller screens
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFirstNameField(),
              SizedBox(height: 20),
              _buildMiddleNameField(),
              SizedBox(height: 20),
              _buildLastNameField(),
            ],
          );
        }
      },
    );
  }

  Widget _buildFirstNameField() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.firstNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: 'الاسم الأول',
            validator: controller.validateFirstName,
          ),
          if (controller.firstNameError.value.isNotEmpty)
            Text(
              controller.firstNameError.value,
              style: TextStyle(color: Colors.red),
            ),
        ],
      );
    });
  }

  Widget _buildMiddleNameField() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.middleNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: "الاسم الثاني",
            validator: controller.validateMiddleName,
          ),
          if (controller.middleNameError.value.isNotEmpty)
            Text(
              controller.middleNameError.value,
              style: TextStyle(color: Colors.red),
            ),
        ],
      );
    });
  }

  Widget _buildLastNameField() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.lastNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: "اسم العائلة",
            validator: controller.validateLastName,
          ),
          if (controller.lastNameError.value.isNotEmpty)
            Text(
              controller.lastNameError.value,
              style: TextStyle(color: Colors.red),
            ),
        ],
      );
    });
  }
}
