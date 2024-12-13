import 'package:cenem/res/constants.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/authentication/mobile/SignInButtonmobile.dart';
import 'package:cenem/view/onbonding/authentication/mobile/register_page.dart';
import 'package:cenem/view/onbonding/authentication/web/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              start: 18, end: 22, text: "تسجيل الدخول"),
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
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/cnem.png',
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  SignInForm(screenWidth, screenHeight),
                  const SizedBox(height: defaultPaddingsign),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: SignInButtonMobile(screenHeight, screenWidth)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
