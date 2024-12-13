import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/signupController.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignupWebButton extends StatelessWidget {
  final AuthController authController = Get.find();
  final SignUpFormController signUpFormController = Get.find();
// ignore: non_constant_identifier_names
  late DialogNavigationController DialogController =
      Get.find<DialogNavigationController>();

  SignupWebButton({super.key}); // Assuming you have a BackController

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: MediaQuery.of(context).size.width,
      onTap: () async {
        // Perform validation when the button is tapped
        signUpFormController.validateEmail(authController.emailController.text);
        signUpFormController.validatePhone(authController.phoneController.text);
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
            signUpFormController.confirmPasswordError.value.isEmpty) {
          auth.isShowLoading.value = true;
          if (await authController.AddUser(context)) {
            Future.delayed(const Duration(seconds: 1), () {});
            auth.isShowLoading.value = false;
            storageService.saveString(
                "email", authController.emailController.text);
            DialogController.currentPage('/confirmEmail');
            showDialogBox(context);
            //print('ok');
          } else {
            Future.delayed(const Duration(seconds: 1), () {});

            auth.isShowLoading.value = false;
          }

          auth.isShowLoading.value = false;
        }
        // DialogController.currentPage('/confirmEmail');
        // Get.toNamed('Home/confirmedEmail');
      },
      buttonText: "تاكيد البريد الالكتروني",
    );
  }
}
