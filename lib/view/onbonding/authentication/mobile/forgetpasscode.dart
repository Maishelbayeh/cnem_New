import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ConfirmEmailController _confirmEmailController =
      Get.put(ConfirmEmailController());
  final AuthController controller = Get.put(AuthController());
  Future<void> _submitOTP() async {
    bool success = await _confirmEmailController
        .submitOTP(authController.emailsignController.text);

    if (success) {
      Get.toNamed('/Home/ForgetPass/ResetPass');
    }
    Get.toNamed('/Home/ForgetPass/ResetPass');
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
          text: "تغيير كلمة السر",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/cnem.png'),
                height: 150,
              ),
              Responsive.isLargeMobile(context)
                  ? const SizedBox(height: 40)
                  : const SizedBox(height: 10),
              const Text(
                'أدخل الرمز المرسل إلى البريد الإلكتروني الخاص بك',
                style: TextStyle(
                  color: first,
                  fontSize: 15,
                  fontFamily: "Lateef",
                ),
              ),
              const SizedBox(height: 10),
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
                    _confirmEmailController.otpCode.value = pin;
                  },
                  onCompleted: (pin) {
                    _confirmEmailController.otpCode.value = pin;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => Text(
                    'الرمز المدخل: ${_confirmEmailController.otpCode.value}',
                    style: TextStyle(
                      color: first,
                      fontSize: 15,
                      fontFamily: "Lateef",
                    ),
                  )),
              if (_confirmEmailController.errorMessage.value.isNotEmpty)
                Obx(
                  () => Text(
                    _confirmEmailController.errorMessage.value,
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
    );
  }
}
