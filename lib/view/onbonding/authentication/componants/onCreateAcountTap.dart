import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onCreateAccountTap extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                authController.isSignUp.value = true;
                Get.find<DialogNavigationController>().currentPage('/signup');
              },
              child: const Text(
                " لا املك حساب ",
                style: TextStyle(
                  fontSize: 15,
                  color: second, // Replace 'second' with a specific color
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
