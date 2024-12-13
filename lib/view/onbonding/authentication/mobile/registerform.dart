import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/controllers/signupController.dart';
import 'package:cenem/view/onbonding/authentication/mobile/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cenem/view/onbonding/authentication/componants/customTextField.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';

// ignore: must_be_immutable
class SignUpFormMobile extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final SignUpFormController signUpFormController =
      Get.put(SignUpFormController());
  PhoneNumber? phoneNumber;

  SignUpFormMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * .9),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: authController.emailController,
                          hintText: 'البريد الإلكتروني',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email),
                          validator: (value) {
                            signUpFormController.validateEmail(value ?? '');
                            return null;
                          },
                        ),
                        Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                signUpFormController.emailError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.9),
                    child: Column(
                      children: [
                        IntlPhoneField(
                          disableAutoFillHints: true,
                          disableLengthCheck: true,
                          controller: authController.phoneController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                10), // Allows entering up to 10 digits
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
                            String completeNumber = phone.completeNumber;
                            // Check if the number has 10 digits and starts with '0'
                            if (completeNumber.length == 10 &&
                                completeNumber.startsWith('0')) {
                              completeNumber = completeNumber
                                  .substring(1); // Remove the leading '0'
                            }
                            signUpFormController.validatePhone(completeNumber);
                            authController.completeNumber = completeNumber;
                          },
                          onCountryChanged: (country) {
                            //print('Country changed to: ' + country.name);
                          },
                        ),
                        Obx(() => Text(
                              signUpFormController.phoneError.value,
                              style: const TextStyle(color: Colors.red),
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.9),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: authController.passController,
                          hintText: 'كلمة المرور',
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock),
                          validator: (value) {
                            signUpFormController.validatePassword(value ?? '');
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                        Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                signUpFormController.passwordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.9),
                    child: Column(
                      children: [
                        CustomTextField(
                          obscureText: true,
                          validator: (value) {
                            signUpFormController.validateConfirmPassword(
                                value ?? '',
                                authController.passController.text);
                            return null;
                          },
                          controller: authController.confirmPasswordController,
                          hintText: 'تأكيد كلمة المرور',
                          prefixIcon: const Icon(Icons.lock),
                          keyboardType: TextInputType.text,
                        ),
                        Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                signUpFormController.confirmPasswordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPaddingsign),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: CustomButton(
                    width: MediaQuery.of(context).size.width,
                    onTap: () async {
                      signUpFormController
                          .validateEmail(authController.emailController.text);
                      signUpFormController
                          .validatePhone(authController.phoneController.text);
                      signUpFormController
                          .validatePassword(authController.passController.text);
                      signUpFormController.validateConfirmPassword(
                        authController.confirmPasswordController.text,
                        authController.passController.text,
                      );

                      // If all fields are valid, proceed with the sign-in
                      if (signUpFormController.emailError.value.isEmpty &&
                          signUpFormController.phoneError.value.isEmpty &&
                          signUpFormController.passwordError.value.isEmpty &&
                          signUpFormController
                              .confirmPasswordError.value.isEmpty) {
                        auth.isShowLoading.value = true;
                        if (await authController.AddUser(context)) {
                          Future.delayed(const Duration(seconds: 1), () {});
                          auth.isShowLoading.value = false;

                          authController.phoneController.clear();
                          Get.toNamed('/Home/confirmEmail');
                          //print('ok');
                        } else {
                          auth.isShowLoading.value = false;
                          Future.delayed(const Duration(seconds: 2), () {});
                          authController.emailController.clear();
                          auth.isShowLoading.value = false;
                        }
                      }
                    },
                    buttonText: "تاكيد البريد الالكتروني",
                  ),
                ),
                const SizedBox(height: defaultPaddingsign * .7),
              ],
            ),
          ),
          // Loading and confetti animations
          if (authController.isShowLoading.value)
            CustomPositioned(
              child: LoadingAnimationWidget.discreteCircle(
                color: second,
                size: 100,
              ),
            )
        ],
      ),
    );
  }
}
