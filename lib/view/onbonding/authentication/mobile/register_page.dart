import 'package:cenem/Api/UserSignUpApi.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';

import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/authentication/mobile/registerform.dart';
import 'package:cenem/view/onbonding/authentication/web/signUpForm.dart';
import 'package:cenem/view/onbonding/authentication/web/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double defaultPaddingsign = 16.0;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AnimatedDescriptionText(
              start: 18, end: 22, text: "انشاء حساب"),
          leading: IconButton(
            onPressed: () {
              Get.toNamed('/Home');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: second,
              size: 30,
            ),
          ),
          backgroundColor: bgColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 1.5),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/cnem.png',
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  SignUpFormMobile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
