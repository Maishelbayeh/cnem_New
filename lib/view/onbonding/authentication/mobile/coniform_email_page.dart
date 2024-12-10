import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

class ConformEmailPage extends StatelessWidget {
  final ConfirmEmailController controller = Get.put(ConfirmEmailController());
  final AuthController emailController = Get.put(AuthController());

  Future<void> _submitOTP() async {
    String? confirmemail = storageService.loadString("email");
    //print("confirm $confirmemail");
    emailController.isLoading.value = true;
    bool success = await controller.submitOTP(confirmemail!);
    emailController.isLoading.value = false;

    if (success) {
      Get.toNamed('/Home/confirmEmail');
    }
    //Get.toNamed('/Home/ForgetPass/ResetPass');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        title: const AnimatedDescriptionText(
          start: 18,
          end: 22,
          text: 'تأكيد البريد الالكتروني',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Image(
                      image: AssetImage('assets/images/cnem.png'),
                      height: 150,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: const Text(
                        'أدخــل الـرمـز الـمـرســل إلـى البـريـد الإلــكتـرونــي الـخــاصـ بـــك',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: "Lateef",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                          controller.otpCode.value = pin;
                        },
                        onCompleted: (pin) {
                          controller.otpCode.value = pin;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => Text(
                          'الرمز المدخل: ${controller.otpCode.value}',
                          style: TextStyle(
                            color: first,
                            fontSize: 15,
                            fontFamily: "Lateef",
                          ),
                        )),
                    if (controller.errorMessage.value.isNotEmpty)
                      Obx(
                        () => Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    CustomButton(
                      onTap: _submitOTP,
                      buttonText: "تحقق",
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    const TimerText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
