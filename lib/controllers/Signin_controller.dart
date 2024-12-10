import 'package:cenem/view/onbonding/authentication/componants/checkpass.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  var emailsignError = ''.obs;
  var passwordsignError = ''.obs;
  var rememberMe = false.obs;
  var isShowLoading = false.obs;
  var isShowConfetti = false.obs;
  var errorMessage = ''.obs; // Observable to hold error messages
  var enteredEmails = <String>[].obs; // List to store entered emails
  // Regular expression for validating email
  final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  final box = GetStorage();
  void validateEmailsign(String value) {
    try {
      if (value.isEmpty) {
        emailsignError.value = 'الرجاء إدخال البريد الإلكتروني';
      } else if (!emailRegExp.hasMatch(value)) {
        emailsignError.value = 'الرجاء إدخال بريد إلكتروني صحيح';
      } else {
        // Clear the error if the email is valid
        emailsignError.value = '';
      }
    } catch (e) {
      errorMessage.value = 'الرجاء التاكد من البريد المدخل';
      //print('الرجاء التاكد من البريد المدخل');
    }
  }

  void validatePassword(String value) {
    passwordsignError.value = PasswordValidator.validate(value) ?? '';
  }

  void validatePasswordsign(String value) {
    try {
      if (value.isEmpty) {
        passwordsignError.value = 'الرجاء إدخال كلمة المرور';
      } else {
        // Clear the error if the password is not empty
        passwordsignError.value = '';
      }
    } catch (e) {
      errorMessage.value = 'الرجاء التاكد من كلمه المرور';
      //print('الرجاء التاكد من كلمه المرور');
    }
  }

  void addEmailToList(String email) {
    final emails = enteredEmails;
    if (!emails.contains(email)) {
      emails.add(email);
      box.write('emails', emails); // Persist the emails
    }
  }
}
