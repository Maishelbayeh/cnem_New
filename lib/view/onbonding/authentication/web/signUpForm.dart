import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/controllers/signupController.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cenem/view/onbonding/authentication/componants/customTextField.dart';
import 'package:cenem/controllers/auth_controller.dart';

import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';

class SignUpForm extends StatefulWidget {
  final double width;
  final double height;

  SignUpForm(this.width, this.height, {Key? key}) : super(key: key);
  @override
  _SignUpForm createState() => _SignUpForm();
  final AuthController authController = Get.put(AuthController());
  final SignUpFormController signUpFormController =
      Get.put(SignUpFormController());
}

class _SignUpForm extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: widget.authController.emailController,
                      hintText: 'البريد الإلكتروني',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        widget.signUpFormController.validateEmail(value ?? '');
                        return null;
                      },
                    ),
                    Obx(() => Text(
                          widget.signUpFormController.emailError.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
                SizedBox(height: widget.height * 0.015),

                // Phone Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntlPhoneField(
                      disableAutoFillHints: true,
                      disableLengthCheck: true,
                      controller: widget.authController.phoneController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: first),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: second),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                      initialCountryCode: 'PS',
                      onChanged: (phone) {
                        String number = phone.number;

                        // Remove leading '0' if the number has 10 digits
                        if (number.length == 10 && number.startsWith('0')) {
                          number = number.substring(1);
                        }

                        // Combine with country dialing code
                        String completeNumber = phone.countryCode + number;

                        widget.signUpFormController
                            .validatePhone(completeNumber);
                        widget.authController.completeNumber = completeNumber;
                      },
                    ),
                    Obx(() => Text(
                          widget.signUpFormController.phoneError.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
                SizedBox(height: widget.height * 0.015),

                // Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: widget.authController.passController,
                      hintText: 'كلمة المرور',
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock),
                      validator: (value) {
                        widget.signUpFormController
                            .validatePassword(value ?? '');
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    Obx(() => Text(
                          widget.signUpFormController.passwordError.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
                SizedBox(height: widget.height * 0.015),

                // Confirm Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      obscureText: true,
                      validator: (value) {
                        widget.signUpFormController.validateConfirmPassword(
                          value ?? '',
                          widget.authController.passController.text,
                        );
                        return null;
                      },
                      controller:
                          widget.authController.confirmPasswordController,
                      hintText: 'تأكيد كلمة المرور',
                      prefixIcon: const Icon(Icons.lock),
                      keyboardType: TextInputType.text,
                    ),
                    Obx(() => Text(
                          widget
                              .signUpFormController.confirmPasswordError.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
              ],
            ),
          ),

          // Loading Indicator
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
