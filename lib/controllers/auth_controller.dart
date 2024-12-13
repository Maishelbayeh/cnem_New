import 'package:cenem/Api/UserSignUpApi.dart';
import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/Api/sendSms.dart';
import 'package:cenem/controllers/confirmSmsController.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:cenem/view/onbonding/errordialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var isLoading = false.obs;

  final TextEditingController emailsignController = TextEditingController();
  final TextEditingController passsignController = TextEditingController();
  RxBool isShowLoading = false.obs;
  RxBool isShowConfetti = false.obs;
  RxBool isSignUp = false.obs; // Default to sign-in
  RxBool rememberMe = false.obs;
  RxBool iSmember = false.obs; // Observable bool for remembering login
  String completeNumber = '';
  final SignInController sauthController = Get.put(SignInController());

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  Future<bool> signIn(BuildContext context) async {
    //isShowConfetti.value = true;
    isShowLoading.value = true;

    var result = await loginUser(
        emailsignController.text, passsignController.text, rememberMe.value);
    storageService.saveString("email", emailsignController.text);
    if (result?['status'] == 'success') {
      if (result?['confirmPhone'] == false) {
        String? phone = storageService.loadString("phone");
        // ignore: use_build_context_synchronously
        confirmDialog(context, phone);
        Future.delayed(const Duration(seconds: 2), () {
          isShowLoading.value = false;
        });

        return false;
      }
      passsignController.clear();
      emailsignController.clear();

      Future.delayed(const Duration(seconds: 3), () {
        isShowLoading.value = false;
      });

      // Handle successful login response

      user.confirmEmail = result?['confirmEmail'];

      return true;
    } else if (result?['status'] == 'email-not-exist') {
      sauthController.emailsignError.value =
          "الرجاء التاكد من البريد الالكتروني";

      ////print("invalid");

      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });

      return false;
    } else if (result?['status'] == 'email-not-confirmed') {
      confirmEmail = false;
      ////print('hiiii');
      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });
    } else if (result?['status'] == 'Phone not confirmed') {
      //print("ll");
      Get.find<DialogNavigationController>().currentPage('/confirmEmail');
      showDialogBox(context);
      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });

      if (!confirmEmail) {
        await apiService.resetPassword(emailsignController.text);
        isShowLoading.value = false;
        ////print('hiiii');
        Get.find<DialogNavigationController>().currentPage('/confirmEmail');
      }

      return false;

      //'Invalid password.
    } else if (result?['status'] == 'invalid-password') {
      ////print("invalid");
      // confirmEmail = result['confirmEmail'];

      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });

      sauthController.passwordsignError.value = "كلمه المرور خاطئه";

      return false;
    }
    isShowLoading.value = false;
    return false;
  }

  // ignore: non_constant_identifier_names
  Future<bool> AddUser(BuildContext context) async {
    user = User(
        email: emailController.text,
        phone: completeNumber,
        password: passController.text,
        confirmPassword: confirmPasswordController.text,
        confirmEmail: false);

    ////print(completeNumber!);
    String? result = await signUpUser(user);

    if (result! == 'success') {
      storageService.saveString("email", emailController.text);
      return true;
    } else if (result == 'email-already-exists') {
      user.clear();
      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });
      Get.snackbar(
        '',
        ('البريد الالكتروني موجود بالفعل'),
        snackPosition: SnackPosition.BOTTOM,
      );

      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return ProfessionalErrorDialog(
            title: 'خطأ',
            content: 'البريد الالكتروني موجود بالفعل',
            buttonText: 'موافق',
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        },
      );
      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });
      return false;
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        isShowLoading.value = false;
      });
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return ProfessionalErrorDialog(
            title: 'خطأ',
            content: 'يرجى التاكد من صحه المعلومات المدخلة',
            buttonText: 'موافق',
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        },
      );
      isShowLoading.value = false;
      //  user.clear();
      return false;
    }
  }

  void validateAndSignIn(BuildContext context) {
    sauthController.validateEmailsign(emailsignController.text);
    sauthController.validatePasswordsign(passsignController.text);
    sauthController.validatePasswordsign(passsignController.text);

    if (sauthController.emailsignError.isEmpty &&
        sauthController.passwordsignError.isEmpty) {
      signIn(context);
    }
  }

  void validateAndSignUp(BuildContext context) {
    sauthController.validateEmailsign(emailsignController.text);
    sauthController.validatePasswordsign(passsignController.text);
    sauthController.validatePasswordsign(passsignController.text);

    if (sauthController.emailsignError.isEmpty &&
        sauthController.passwordsignError.isEmpty) {
      signIn(context);
    }
  }

  void toggleForm() {
    isSignUp.value = !isSignUp.value;
  }
}
