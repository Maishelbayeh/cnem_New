import 'package:cenem/main.dart';
import 'package:get/get.dart';
import 'package:cenem/Api/confirmemailApi.dart';

class ConfirmEmailController extends GetxController {
  var otpCode = ''.obs;
  var errorMessage = ''.obs;
  var attempts = 0.obs; // Counter for attempts
  final maxAttempts = 5; // Maximum number of attempts

  // Method to reset the state
  void resetFields() {
    otpCode.value = '';
    errorMessage.value = '';
  }

  bool validateOTP() {
    if (otpCode.value.isEmpty) {
      errorMessage.value = 'يرجى إدخال رمز التحقق';
      return false;
    }
    errorMessage.value = '';
    return true;
  }

  Future<bool> submitOTP(String email) async {
    auth.isShowLoading.value = false;
    if (!validateOTP()) {
      errorMessage.value = 'يرجى إدخال رمز التحقق';
      return false;
    }

    try {
      auth.isShowLoading.value = true;
      bool? success = await confirmEmailApi(otpCode.value, email);
      if (!success!) {
        errorMessage.value = "قمت بادخال الرمز بشكل خاطئ";
        auth.isShowLoading.value = false;
        return false;
      } else {
        auth.isShowLoading.value = false;
        return true;
      }
    } catch (e) {
      auth.isShowLoading.value = false;
      errorMessage.value = "قمت بادخال الرمز بشكل خاطئ";
      return false;
    } finally {
      auth.isShowLoading.value = false;
    }
  }
}
