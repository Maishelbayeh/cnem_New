import 'package:cenem/Api/GetRoleOfuser.dart';
import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/Api/getchildren.dart';
import 'package:cenem/Api/paymentApi.dart';
import 'package:cenem/Api/reserpasscode.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/view/mobile_member/pages/dashboard.dart';
import 'package:cenem/view/onbonding/authentication/componants/SignInbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PasswordResetApiService _apiService = PasswordResetApiService();

class SignInButtonMobile extends StatelessWidget {
  final controller = Get.find<DialogNavigationController>();
  final sauthController = Get.find<SignInController>();
  final authController = Get.find<AuthController>();
  double height;
  double width;
  SignInButtonMobile(this.height, this.width);

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
              authController.isShowLoading.value = false;
              Get.find<DialogNavigationController>()
                  .currentPage('/newpasscode');
            } else {
              authController.isShowLoading.value = false;
              sauthController.emailsignError.value =
                  'البريد الالكتروني غير موجود';

              Get.snackbar(
                '',
                ('البريد الالكتروني غير موجود'),
                snackPosition: SnackPosition.BOTTOM,
              );
              authController.isShowLoading.value = false;
            }
            authController.isShowLoading.value = false;
          }
        } catch (e) {
          authController.isShowLoading.value = false;
        }
        try {
          sauthController
              .validateEmailsign(authController.emailsignController.text);
          if (sauthController.emailsignError.isEmpty) {
            authController.isShowLoading.value = true; // Show loading indicator

            // Call the API service to reset the password
            resetSuccess = await _apiService
                .resetPassword(authController.emailsignController.text);

            if (resetSuccess) {
              authController.isShowLoading.value = false;
              Get.toNamed('/Home/ForgetPass');
            } else {
              authController.isShowLoading.value = false;
              sauthController.emailsignError.value =
                  'البريد الالكتروني غير موجود';

              Get.snackbar(
                '',
                ('البريد الالكتروني غير موجود'),
                snackPosition: SnackPosition.BOTTOM,
              );
              authController.isShowLoading.value = false;
            }
          }
        } catch (e) {
          authController.isShowLoading.value = false;
        }
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
            await Future.delayed(const Duration(seconds: 2));
            authController.isLoading.value = false;
            if (signInSuccess) {
              //   await Future.delayed(const Duration(seconds: 2)

              isSuperAdminRoleSelected();
              await fetchOffspringMembers(user.userId);
              var offspringMembers = await fetchOffspringMembers(user.userId);
              // //print("mae${mem.status}");
              if (offspringMembers == null) {
                Get.toNamed('/Home/SiteCondition');
              } else if (mem.status!) {
                responseJsonchildren =
                    await ApiService.getOffspringMembers(authtoken);
                getClassificationCounts(responseJsonchildren);
                fetchSubscription();
                //   await Future.delayed(Duration(seconds: 1));

                Get.toNamed('/Home/MobileMember');
              } else {
                responseJsonchildren =
                    await ApiService.getOffspringMembers(authtoken);
                getClassificationCounts(responseJsonchildren);
                fetchSubscription();

                await Future.delayed(Duration(seconds: 1));
                if (!isfreemember) {
                  Get.toNamed('/Home/reccurency');
                } else {
                  Get.toNamed('/Home/MobileMember');
                }
              }
            }
          }
        } catch (e) {
          //print('Error in onSignInTap: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('حدث خطأ يرجى المحاولة مرة أخرى')),
          );
        }
      },
      height: height,
      width: width,
    );
  }
}
