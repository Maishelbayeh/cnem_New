import 'package:cenem/view/onbonding/authentication/componants/checkpass.dart';
import 'package:get/get.dart';

class SignUpFormController extends GetxController {
  var emailError = ''.obs;
  var phoneError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  void validateEmail(String value) {
    try {
      if (value.isEmpty) {
        emailError.value = 'الرجاء إدخال البريد الإلكتروني';
      } else if (!emailRegExp.hasMatch(value)) {
        emailError.value = 'الرجاء إدخال بريد إلكتروني صحيح';
      } else {
        // Clear the error if the email is valid
        emailError.value = '';
      }
    } catch (e) {
      emailError.value = 'الرجاء التاكد من البريد المدخل';
      //print('الرجاء التاكد من البريد المدخل');
    }
  }

  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneError.value = 'الرجاء إدخال رقم الهاتف';
    } else {
      phoneError.value = '';
    }
  }

  void validatePassword(String value) {
    passwordError.value = PasswordValidator.validate(value) ?? '';
  }

  void validateEmptyPassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'الرجاء إدخال كلمة المرور';
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'يرجى تأكيد كلمة المرور الخاصة بكـ';
    } else if (value != password) {
      confirmPasswordError.value = 'كلمة المرور غير مطابقة.';
    } else {
      confirmPasswordError.value = '';
    }
  }
}
