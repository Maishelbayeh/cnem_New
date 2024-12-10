// ignore_for_file: unused_import

import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/view/onbonding/authentication/mobile/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cenem/view/onbonding/authentication/componants/customTextField.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/onbonding/authentication/componants/animationRive.dart';
import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';

class SignInForm extends StatefulWidget {
  final double width;
  final double height;

  SignInForm(this.width, this.height);

  final SignInController sauthController = Get.put(SignInController());
  final AuthController authController = Get.put(AuthController());

  @override
  StateSignInForm createState() => StateSignInForm();
}

class StateSignInForm extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                CustomTextField(
                  controller: widget.authController.emailsignController,
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    widget.sauthController.validateEmailsign(value ?? '');
                    return widget
                            .sauthController.emailsignError.value.isNotEmpty
                        ? widget.sauthController.emailsignError.value
                        : null;
                  },
                  autofillHints: [AutofillHints.email],
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.sauthController.emailsignError.value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: widget.height * 0.006),
                CustomTextField(
                  controller: widget.authController.passsignController,
                  hintText: 'كلمة المرور',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    widget.sauthController.validatePasswordsign(value ?? '');
                    return widget
                            .sauthController.passwordsignError.value.isNotEmpty
                        ? widget.sauthController.passwordsignError.value
                        : null;
                  },
                  keyboardType: TextInputType.text,
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.sauthController.passwordsignError.value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Loading animation
          widget.authController.isShowLoading.value
              ? CustomPositioned(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: second,
                    size: 100,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
