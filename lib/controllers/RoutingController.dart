import 'package:cenem/user/pages/PaymentMoveTable.dart';
import 'package:cenem/view/onbonding/payment/recurenccypayment_html.dart';

import 'package:cenem/user/layout.dart';

import 'package:cenem/view/mobile_member/pages/dashboard.dart';
import 'package:cenem/view/onbonding/authentication/mobile/bank_info_page.dart';
import 'package:cenem/view/onbonding/authentication/mobile/coniform_email_page.dart';
import 'package:cenem/view/onbonding/authentication/mobile/forgetpasscode.dart';
import 'package:cenem/view/onbonding/authentication/mobile/register_page.dart';
import 'package:cenem/view/onbonding/authentication/mobile/second_sign_up_page.dart';
import 'package:cenem/view/onbonding/authentication/mobile/set_passPage.dart';
import 'package:cenem/view/onbonding/authentication/mobile/sign_in_page_form.dart';
import 'package:cenem/view/onbonding/authentication/term_condition_form.dart';
import 'package:cenem/view/splash/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => BackgroundVideoApp()),
    GetPage(name: '/Home/SignIn', page: () => const SignInPage()),
    GetPage(
      name: '/User',
      page: () => SiteLayout(),
    ),
    GetPage(
      name: '/User/pymentHistory',
      page: () => PaymentTable(),
    ),
    GetPage(
        name: '/Home/ForgetPass/ResetPass',
        page: () => const SetNewPasswordPage()),
    GetPage(name: '/Home/ForgetPass', page: () => ForgotPasswordScreen()),
    GetPage(
        name: '/Home/SiteCondition/AddMember', page: () => SecondSignUpPage()),
    GetPage(name: '/Home/RegisterForm', page: () => const RegisterForm()),
    GetPage(name: '/Home/confirmEmail', page: () => ConformEmailPage()),
    GetPage(
        name: '/Home/SiteCondition',
        page: () => const TermsAndConditionsPage()),
    GetPage(name: '/Home/MobileMember', page: () => const Dashboard()),
    GetPage(name: '/Home/receipt', page: () => const BankInfoPage()),
    GetPage(name: '/Home/payment', page: () => Iframe()),
  ];
}
