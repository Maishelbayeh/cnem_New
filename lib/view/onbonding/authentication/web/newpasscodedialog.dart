import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';

import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/controllers/confirmController.dart';

import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';

import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final ConfirmEmailController confirmController =
      Get.find<ConfirmEmailController>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: bgColor,
            title: const AnimatedDescriptionText(
              start: 18,
              end: 22,
              text: "تغيير كلمة السر",
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Responsive(
                  desktop: _buildDialogContent(
                      constraints.maxWidth * 0.8, constraints.maxHeight * 0.8),
                  largeMobile: _buildDialogContent(
                      constraints.maxWidth * 0.8, constraints.maxHeight * 0.8),
                  extraLargeScreen: _buildDialogContent(
                      constraints.maxWidth * 0.9, constraints.maxHeight * 0.9),
                  mobile: _buildDialogContent(
                      constraints.maxWidth * 0.7, constraints.maxHeight * 0.8),
                  tablet: _buildDialogContent(
                      constraints.maxWidth * 0.7, constraints.maxHeight * 0.7),
                ),
              );
            },
          ),
        ),
        auth.isShowLoading.value
            ? CustomPositioned(
                child: LoadingAnimationWidget.discreteCircle(
                  color: second,
                  size: 100,
                ),
              )
            : const SizedBox(),
        // auth.isShowConfetti.value
        //     ? const CustomPositioned(
        //         scale: 6,
        //         child: RiveAnimation.asset(
        //           "assets/images/confetti.riv",
        //           onInit: onConfettiRiveInit,
        //           fit: BoxFit.cover,
        //         ),
        //       )
        //     : const SizedBox(),
      ]),
    );
  }

  Widget _buildDialogContent(double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cnem.png',
              height: height * 0.4,
            ),
            SizedBox(height: height * 0.02),
            const Text(
              'أدخل الرمز المرسل إلى البريد الإلكتروني الخاص بك',
              style: TextStyle(
                color: first,
                fontSize: 15,
                fontFamily: "Lateef",
              ),
            ),
            SizedBox(height: height * 0.02),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: second),
                  ),
                ),
                onChanged: (pin) {
                  confirmController.otpCode.value = pin;
                },
                onCompleted: (pin) {
                  if (confirmController.attempts.value <
                      confirmController.maxAttempts - 1) {
                    confirmController.attempts.value++;
                    confirmController.otpCode.value = pin;
                    // Handle OTP completion
                  } else {
                    confirmController.attempts.value = 0;
                    Get.back();
                    Get.snackbar(
                      "تنبيه!!",
                      "لقد تجاوزت العدد المسموح من المحاولات",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    // Optionally disable the input field or perform other actions
                  }
                },
              ),
            ),
            Obx(() => Text(
                  confirmController.errorMessage.value,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                )),
            CustomButton(
              onTap: () async {
                String email = authController.emailsignController.text;
                //print(email);
                //print(confirmController.otpCode.value);
                auth.isShowLoading.value = true;
                bool succes = await confirmController.submitOTP(email);
                auth.isShowLoading.value = false;
                if (succes) {
                  Future.delayed(const Duration(seconds: 2), () {});

                  Get.find<DialogNavigationController>()
                      .currentPage('/NewPass');
                } else {
                  //print("7777777");
                }
              },
              buttonText: "تحقق",
              width: width * 0.7,
            ),
            const TimerText(),
          ],
        ),
      ),
    );
  }
}
