import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:cenem/controllers/confirmSmsController.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ConfirmEmailDialog extends StatefulWidget {
  @override
  _ConfirmEmailDialogState createState() => _ConfirmEmailDialogState();
}

class _ConfirmEmailDialogState extends State<ConfirmEmailDialog> {
  final ConfirmEmailController _confirmEmailController =
      Get.put(ConfirmEmailController());
  final AuthController controller = Get.put(AuthController());
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _confirmEmailController.otpCode.value = '';
    _confirmEmailController.errorMessage.value = '';
  }

  Future<void> _submitOTP() async {
    String? confirmemail = storageService.loadString("email");
    controller.isLoading.value = true;
    bool success = await _confirmEmailController.submitOTP(confirmemail!);
    controller.isLoading.value = false;

    if (success) {
      Navigator.of(context).pop();

      confirmDialog(context, storageService.loadString("phone"));
    } else {
      _confirmEmailController.errorMessage.value =
          'الرمز غير صحيح، حاول مرة أخرى';
      _clearPinInput();
    }
  }

  void _clearPinInput() {
    _pinController.clear();
    _confirmEmailController.otpCode.value = '';
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
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
          text: "تاكيد كلمه السر",
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
                  controller: _pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: second),
                    ),
                  ),
                  onChanged: (pin) {
                    _confirmEmailController.otpCode.value = pin;
                    _confirmEmailController.errorMessage.value = '';
                  },
                  onCompleted: (pin) {
                    _confirmEmailController.otpCode.value = pin;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => Text(
                    'الرمز المدخل: ${_confirmEmailController.otpCode.value}',
                    style: const TextStyle(
                      color: first,
                      fontSize: 15,
                      fontFamily: "Lateef",
                    ),
                  )),
              Obx(() {
                if (_confirmEmailController.errorMessage.value.isNotEmpty) {
                  return Text(
                    _confirmEmailController.errorMessage.value,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
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
