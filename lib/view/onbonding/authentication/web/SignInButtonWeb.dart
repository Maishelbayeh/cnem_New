import 'package:cenem/Api/getchildren.dart';
import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/authentication/componants/SignInbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInButtonWeb extends StatelessWidget {
  final double height;
  final double width;

  SignInButtonWeb(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    final sauthController = Get.find<SignInController>();
    final authController = Get.find<AuthController>();

    return CustomRowWidget(
      onForgotPasswordTap: () async {
        try {
          sauthController
              .validateEmailsign(authController.emailsignController.text);
          if (sauthController.emailsignError.isEmpty) {
            authController.isShowLoading.value = true; // Show loading indicator

            bool resetSuccess = await ApiService.resetPassword(
                authController.emailsignController.text);

            authController.isShowLoading.value = false;

            if (resetSuccess) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("email", authController.emailsignController.text);
              Get.find<DialogNavigationController>()
                  .currentPage('/newpasscode');
              showDialogBox(context);
            } else {
              sauthController.emailsignError.value =
                  'البريد الالكتروني غير موجود';
              Get.snackbar('', 'البريد الالكتروني غير موجود',
                  snackPosition: SnackPosition.BOTTOM);
            }
          }
        } catch (e) {
          authController.isShowLoading.value = false;
        }
      },
      onRememberMeTap: () async {
        try {
          final rememberMe = !authController.rememberMe.value;
          authController.toggleRememberMe(rememberMe);

          SharedPreferences prefs = await SharedPreferences.getInstance();

          if (rememberMe) {
            if (authController.emailsignController.text.isNotEmpty) {
              await prefs.setString(
                  'saved_email', authController.emailsignController.text);
            }
          } else {
            await prefs.remove('saved_email');
          }
        } catch (e) {
          print('Error in onRememberMeTap: $e');
        }
      },
      onSignInTap: () async {
        try {
          sauthController
              .validateEmailsign(authController.emailsignController.text);
          sauthController
              .validatePasswordsign(authController.passsignController.text);
          authController.isLoading.value = true;

          if (sauthController.emailsignError.isEmpty &&
              sauthController.passwordsignError.isEmpty) {
            bool signInSuccess = await authController.signIn(context);

            authController.isLoading.value = false;
            if (signInSuccess) {
              if (Responsive.isLargeMobile(context)) {
                Get.toNamed('/Home/SiteCondition');
              } else {
                Get.find<DialogNavigationController>()
                    .currentPage('/Confirm condition');
                showDialogBox(context);
              }
            }
          }
        } catch (e) {
          authController.isLoading.value = false;
        }
      },
      height: height,
      width: width,
    );
  }

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("تم إعادة تعيين كلمة المرور"),
          content: Text("يرجى التحقق من بريدك الإلكتروني لإكمال العملية."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("إغلاق"),
            ),
          ],
        );
      },
    );
  }
}

// Load saved email when the app starts
void loadSavedEmail(AuthController authController) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedEmail = prefs.getString('saved_email');
  if (savedEmail != null) {
    authController.emailsignController.text = savedEmail;
    authController.toggleRememberMe(true);
  }
}
