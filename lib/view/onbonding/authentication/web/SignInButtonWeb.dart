import 'package:cenem/Api/GetRoleOfuser.dart';
import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/Api/getchildren.dart';
import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/Api/paymentApi.dart';
import 'package:cenem/Api/paymentTable.dart';
import 'package:cenem/Api/reserpasscode.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/user/layout.dart';
import 'package:cenem/user/pages/users/settings.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/authentication/componants/SignInbutton.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:cenem/view/onbonding/payment/payment.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final PasswordResetApiService _apiService = PasswordResetApiService();

class SignInButtonWeb extends StatelessWidget {
  double height;
  double width;
  SignInButtonWeb(this.height, this.width);
  @override
  Widget build(BuildContext context) {
    final sauthController = Get.find<SignInController>();
    final authController = Get.find<AuthController>();
    bool resetSuccess = false;
    return CustomRowWidget(
      onForgotPasswordTap: () async {
        try {
          sauthController
              .validateEmailsign(authController.emailsignController.text);
          if (sauthController.emailsignError.isEmpty) {
            authController.isShowLoading.value = true; // Show loading indicator

            // Call the API service to reset the password
            resetSuccess = await _apiService
                .resetPassword(authController.emailsignController.text);

            // Pause for 4 seconds

            // Optionally, you can perform additional actions here after the delay
            //print("delay");

            // Hide loading indicator after the delay
            authController.isShowLoading.value = false;

            if (resetSuccess) {
              storageService.saveString(
                  "email", authController.emailsignController.text);
              authController.isShowLoading.value = false;
              Get.find<DialogNavigationController>()
                  .currentPage('/newpasscode');
              showDialogBox(context);
            } else {
              authController.isShowLoading.value = false;
              sauthController.emailsignError.value =
                  'البريد الالكتروني غير موجود';

              Get.snackbar(
                '',
                ('البريد الالكتروني غير موجود'),
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          }
        } catch (e) {
          authController.isShowLoading.value = false;
        }

        authController.isShowLoading.value = false;
      },
      onRememberMeTap: () {
        try {
          final authController = Get.find<AuthController>();
          authController.toggleRememberMe(!authController.rememberMe.value);
        } catch (e) {
          //print('Error in onRememberMeTap: $e');
        }
      },
      onSignInTap: () async {
        try {
          countOrange = 0;
          countBlack = 0;
          countBlue = 0;
          countRed = 0;
          countGreen = 0;
          responseJsonchildren = [];
          sauthController
              .validateEmailsign(authController.emailsignController.text);
          sauthController
              .validatePasswordsign(authController.passsignController.text);
          authController.isLoading.value = true;
          if (sauthController.emailsignError.isEmpty &&
              sauthController.passwordsignError.isEmpty) {
            bool signInSuccess = await authController.signIn(context);
            await Future.delayed(const Duration(seconds: 1));
            authController.isLoading.value = false;
            if (signInSuccess) {
              //   await Future.delayed(const Duration(seconds: 2)

              isSuperAdminRoleSelected();
              await fetchOffspringMembers(user.userId);
              var offspringMembers = await fetchOffspringMembers(user.userId);
              // //print("mae${mem.status}");
              if (offspringMembers == null) {
                if (Responsive.isLargeMobile(context)) {
                  Get.toNamed('/Home/SiteCondition');
                } else {
                  Get.find<DialogNavigationController>()
                      .currentPage('/Confirm condition');
                  showDialogBox(context);
                }
              } else if (mem.status!) {
                authController.isLoading.value = false;
                responseJsonchildren =
                    await ApiService.getOffspringMembers(authtoken);
                getClassificationCounts(responseJsonchildren);
                fetchSubscription();
                //   await Future.delayed(Duration(seconds: 1));

                Get.toNamed('/User');
              } else {
                responseJsonchildren =
                    await ApiService.getOffspringMembers(authtoken);
                getClassificationCounts(responseJsonchildren);
                fetchSubscription();

                await Future.delayed(Duration(seconds: 1));

                if (sub?.currentPaymentNow == 1.0) {
                  Get.toNamed('/User');
                } else if (!isfreemember) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ProfessionalDialog(
                        onConfirm: () {
                          print("تم تأكيد الدفع");
                          Navigator.of(context).pop();
                        },
                        onCancel: () {
                          print("تم إلغاء الدفع");
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                } else {
                  Get.toNamed('/User');
                }
              }
            }
          }
        } catch (e) {
          authController.isLoading.value = false;
        }
        authController.isLoading.value = false;
      },
      height: height,
      width: width,
    );
  }
}
