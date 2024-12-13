import 'package:cenem/res/constants.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class onSignInTap extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final double width;
  final double height;
  onSignInTap({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return authController.isSignUp.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          authController.isSignUp.value = false;
                        },
                        child: const Text(
                          " املك حساب ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                second, // Replace 'second' with a specific color
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                )
              : Container(); // You can replace this with your alternative widget
        }),
      ),
    );
  }
}
