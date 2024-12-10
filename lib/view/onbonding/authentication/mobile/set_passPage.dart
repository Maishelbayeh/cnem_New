import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:cenem/controllers/resetPass.controller.dart';
import 'package:cenem/view/onbonding/authentication/componants/newpassText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PasswordResetController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const AnimatedDescriptionText(
            start: 18, end: 22, text: "اعـادة تعيين كلمة المرور"),
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Get.toNamed('/confirmEmailForResetPass');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.lock,
                size: 100.0,
                color: second,
              ),
              const SizedBox(height: 40.0),
              PasswordField(
                controller:
                    Get.find<PasswordResetController>().passwordController,
                hintText: 'كلمة المرور',
                prefixIconPath: "assets/icons/password.svg",
              ),
              const SizedBox(height: 20.0),
              PasswordField(
                controller: Get.find<PasswordResetController>()
                    .confirmPasswordController,
                hintText: 'تأكيد كلمة المرور',
                prefixIconPath: "assets/icons/password.svg",
              ),
              const SizedBox(height: 40.0),
              CustomButton(
                buttonText: 'تغيير كلمة السر',
                width: MediaQuery.of(context).size.width * 0.7,
                onTap: () {
                  Get.find<PasswordResetController>().resetPassword(
                      Get.find<ConfirmEmailController>().otpCode.value,
                      Get.find<AuthController>().emailsignController.text);
                  Get.toNamed('/Home/SignIn');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
