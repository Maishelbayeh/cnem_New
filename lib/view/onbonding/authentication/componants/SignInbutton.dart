import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomRowWidget extends StatelessWidget {
  final VoidCallback onForgotPasswordTap;
  final VoidCallback onRememberMeTap;
  final VoidCallback onSignInTap;
  final double width;
  final double height;

  const CustomRowWidget(
      {Key? key,
      required this.onForgotPasswordTap,
      required this.onRememberMeTap,
      required this.onSignInTap,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<
        AuthController>(); // Assuming AuthController is defined somewhere
    // Assuming SAuthController is defined somewhere

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onForgotPasswordTap,
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  'نسيت كلمة السر؟',
                  style: TextStyle(
                    color: second, // Replace 'second' with a specific color
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'تذكرني',
              style: TextStyle(fontSize: 12.0),
            ),
            Obx(
              () => Checkbox(
                value: authController.rememberMe.value,
                onChanged: (value) {
                  onRememberMeTap();
                },
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.01), // Replace with 'defaultPaddingsign'
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          child: CustomButton(
            width: MediaQuery.of(context).size.width * 0.8,
            onTap: onSignInTap,
            buttonText: 'تسجيل الدخول',
          ),
        ),
        SizedBox(height: height * 0.01),
      ],
    );
  }
}
