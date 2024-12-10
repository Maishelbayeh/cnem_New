import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:cenem/view/custom%20componant/subtitle_text.dart';

import 'package:cenem/view/onbonding/authentication/componants/onCreateAcountTap.dart';
import 'package:cenem/view/onbonding/authentication/componants/signUpButton.dart';
import 'package:cenem/view/onbonding/authentication/web/SignInButtonWeb.dart';
import 'package:cenem/view/onbonding/authentication/web/signupWebButton.dart';
import 'package:cenem/view/onbonding/authentication/web/signUpForm.dart';
import 'package:cenem/view/onbonding/authentication/web/sign_in_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Signin extends StatefulWidget {
  final bool signUp;
  final double width;
  final double height;
  const Signin(this.signUp, this.width, this.height, {Key? key})
      : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final DialogNavigationController backcontroller = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final dialogWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Obx(
            () => ToggleButtons(
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
              isSelected: [
                !authController.isSignUp.value,
                authController.isSignUp.value,
              ],
              color: second,
              onPressed: (int index) {
                authController.toggleForm();
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: dialogWidth * 0.13,
                    vertical: 5,
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: dialogWidth * 0.13,
                    vertical: 5,
                  ),
                  child: const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: widget.height * .06,
                  ),
                  TextWithGradient(
                    start: 20,
                    end: 25,
                    text: authController.isSignUp.value
                        ? 'انشاء حساب'
                        : 'تسجيل الدخول',
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: widget.height * .04),
                        authController.isSignUp.value
                            ? SignUpForm(widget.width, widget.height)
                            : SignInForm(widget.width, widget.height),
                        authController.isSignUp.value
                            ? SignupWebButton()
                            : SignInButtonWeb(widget.width, widget.height),
                        authController.isSignUp.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        authController.isSignUp.value = false;
                                        Get.find<DialogNavigationController>()
                                            .currentPage('/SignIn');
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
                                  SizedBox(height: widget.height * 0.009),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        authController.isSignUp.value = true;
                                        Get.find<DialogNavigationController>()
                                            .currentPage('/signup');
                                      },
                                      child: const Text(
                                        " لا املك حساب ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              second, // Replace 'second' with a specific color
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: widget.height * 0.009),
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
