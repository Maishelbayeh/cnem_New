import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/controllers/confirmSmsController.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/timer_text.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ConfirmsmsDialog extends StatefulWidget {
  @override
  _ConfirmsmsDialogState createState() => _ConfirmsmsDialogState();
}

class _ConfirmsmsDialogState extends State<ConfirmsmsDialog> {
  final ConfirmphoneController _confirmEmailController =
      Get.put(ConfirmphoneController());
  final DialogNavigationController _navigationController =
      Get.find<DialogNavigationController>();
  final AuthController controller = Get.put(AuthController());

  Future<void> _submitOTP() async {
    String? confirmemail = storageService.loadString("email");
    print(storageService.loadString("email"));
    controller.isLoading.value = true;
    bool success = await _confirmEmailController.submitOTP(confirmemail!);
    controller.isLoading.value = false;

    if (success) {
      await fetchOffspringMembers(user.userId);
      var offspringMembers = await fetchOffspringMembers(user.userId);

      if (offspringMembers == null) {
        if (!Responsive.isDesktop(context)) {
          Get.toNamed('/Home/SiteCondition');
        } else {
          _navigationController.currentPage('/Confirm condition');
        }

        Get.snackbar(
          'نجاح',
          'تم تاكيد رقم الهاتف بنجاح',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'نجاح',
          'تم تاكيد رقم الهاتف بنجاح',
          snackPosition: SnackPosition.TOP,
        );
        Navigator.of(context).pop();
      }
    } else {
      Get.snackbar(
        'فشل',
        'فشلت عملية تاكيد الرجاء المحاوله مره اخرى',
        snackPosition: SnackPosition.TOP,
      );
    }
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
          text: "تاكيد رقم الهاتف",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              color: bgColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: bgColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.sms,
                          size: 60,
                          color: second,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'أدخل الرمز المرسل إلى رقم الهاتف الخاص بك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: first,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Lateef",
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
                            fontSize: 14,
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
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: _submitOTP,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: second,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "تحقق",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TimerText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
