import 'package:cenem/Api/ConfirmPhone.dart';
import 'package:cenem/Api/sendSms.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'signupController.dart';

String removePrefix(String phoneNumber) {
  // Check if the number starts with +970 and remove it
  if (phoneNumber.startsWith('+970')) {
    return phoneNumber.substring(4);
  }
  return phoneNumber;
}

class ConfirmphoneController extends GetxController {
  var otpCode = ''.obs;

  var errorMessage = ''.obs;
  var attempts = 0.obs; // Counter for attempts
  final maxAttempts = 5; // Maximum number of attempts
  bool validateOTP() {
    if (otpCode.value.isEmpty) {
      auth.isShowLoading.value = false;
      errorMessage.value = 'يرجى إدخال رمز التحقق';
      return false;
    }
    auth.isShowLoading.value = false;
    errorMessage.value = '';
    return true;
  }

  Future<bool> submitOTP(String email) async {
    auth.isShowLoading.value = true;
    if (!validateOTP()) {
      errorMessage.value = 'يرجى إدخال رمز التحقق';
      auth.isShowLoading.value = false;

      return false;
    }

    try {
      auth.isShowLoading.value = true;
      bool? succes = await confirmPhoneApi(otpCode.value, email);
      if (!succes) {
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
      auth.isLoading.value = false;
    }
  }
}

void confirmDialog(BuildContext context, String? phone) {
  final AuthController authController = Get.put(AuthController());
  Get.put(ConfirmphoneController());
  final SignUpFormController signUpFormController =
      Get.put(SignUpFormController());

  authController.completeNumber = "";
  signUpFormController.phoneError.value = "";
  authController.isShowLoading.value = false;
  authController.phoneController.text = removePrefix(phone!);
  String prefix = '+970'; // Default prefix

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            return Obx(() {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: screenWidth > 600 ? 500 : screenWidth * 0.9,
                      constraints: BoxConstraints(
                        maxHeight: screenHeight * 0.75,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey[200]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "التأكد من رقم الهاتف",
                            style: TextStyle(
                              fontSize: screenWidth > 600 ? 22 : 20,
                              fontWeight: FontWeight.bold,
                              color: second,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/cnem.png',
                            height: screenWidth > 600 ? 130 : 80,
                          ),
                          const SizedBox(height: 20),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: IntlPhoneField(
                              disableAutoFillHints: true,
                              disableLengthCheck: true,
                              controller: authController.phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(color: second),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: second),
                                ),
                                prefixIcon: const Icon(Icons.phone_android,
                                    color: Colors.grey),
                                hintText: "رقم الهاتف",
                              ),
                              initialCountryCode:
                                  getCountryCodeFromPhone(phone),
                              onChanged: (phone) {
                                prefix = phone.countryCode;
                                String number =
                                    authController.phoneController.text;
                                if (number.startsWith('0')) {
                                  number = number.substring(1);
                                }
                                authController.completeNumber =
                                    phone.countryCode + number;
                              },
                            ),
                          ),
                          Obx(
                            () => Text(
                              signUpFormController.phoneError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: second,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () async {
                                  String number =
                                      authController.phoneController.text;
                                  if (number.startsWith('0')) {
                                    number = number.substring(1);
                                  }
                                  String completeNumber = prefix + number;
                                  authController.completeNumber =
                                      completeNumber;

                                  if (completeNumber.isEmpty) {
                                    signUpFormController.phoneError.value =
                                        "يرجى إدخال رقم الهاتف";
                                    return;
                                  }

                                  authController.isShowLoading.value = true;
                                  if (await sendSmsToConfirmPhone(
                                      authController.phoneController.text)) {
                                    Navigator.of(context).pop();
                                    authController.isShowLoading.value = false;
                                    showDialogBox(context);
                                  } else {
                                    signUpFormController.phoneError.value =
                                        "قمت بادخال رقم الهاتف بشكل خاطئ";
                                    authController.completeNumber = '';
                                  }
                                },
                                child: const Text(
                                  "نعم متأكد",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "إغلاق",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (authController.isShowLoading.value)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              );
            });
          },
        ),
      );
    },
  );
}

String extractPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return "";
  }

  final countryCodes = [
    '+970', // فلسطين
    '+972', // إسرائيل
    '+971', // الإمارات
    '+1', // الولايات المتحدة
    '+20', // مصر
    '+90', // تركيا
    '+962', // الأردن
    '+973', // البحرين
    '+965', // الكويت
    '+966', // السعودية
    '+967', // اليمن
    '+974', // قطر
    '+968', // عمان
    '+963', // سوريا
    '+961', // لبنان
    '+964', // العراق
    '+249', // السودان
    '+218', // ليبيا
    '+216', // تونس
    '+213', // الجزائر
    '+212', // المغرب
    '+222', // موريتانيا
    '+252', // الصومال
    '+253', // جيبوتي
    '+269', // جزر القمر
  ];

  // Iterate over country codes and remove the matching one
  for (var code in countryCodes) {
    if (phoneNumber.startsWith(code)) {
      String numberWithoutCode = phoneNumber.substring(code.length);

      // Remove leading zero if present
      if (numberWithoutCode.startsWith('0')) {
        numberWithoutCode = numberWithoutCode.substring(1);
      }

      return code + numberWithoutCode;
    }
  }

  // If no country code is matched, check and format number
  if (phoneNumber.startsWith('0')) {
    return phoneNumber.substring(1); // Remove leading zero
  }

  return phoneNumber; // Return the original number if no changes are needed
}

String getCountryCodeFromPhone(String? phoneNumber) {
  const countryCodes = {
    '+970': 'PS', // Palestine
    '970': 'PS', // Palestine
    '+962': 'JO', // Jordan
    '+972': 'IL', // Israel
    '+1': 'US', // United States
    '+20': 'EG', // Egypt
    '+90': 'TR', // Turkey
    '+971': 'AE', // United Arab Emirates
    '+973': 'BH', // Bahrain
    '+965': 'KW', // Kuwait
    '+966': 'SA', // Saudi Arabia
    '+967': 'YE', // Yemen
    '+974': 'QA', // Qatar
    '+968': 'OM', // Oman
    '+963': 'SY', // Syria
    '+961': 'LB', // Lebanon
    '+964': 'IQ', // Iraq
    '+249': 'SD', // Sudan
    '+218': 'LY', // Libya
    '+216': 'TN', // Tunisia
    '+213': 'DZ', // Algeria
    '+212': 'MA', // Morocco
    '+222': 'MR', // Mauritania
    '+252': 'SO', // Somalia
    '+253': 'DJ', // Djibouti
    '+269': 'KM', // Comoros
  };

  for (String code in countryCodes.keys) {
    if (phoneNumber != null && phoneNumber.startsWith(code)) {
      return countryCodes[code]!;
    }
  }

  return 'PS'; // Default country code (you can change this)
}

String formatPhoneNumber(String phoneNumber) {
  // Check if the phone number starts with a '+' or a '0'
  if (phoneNumber.startsWith('+')) {
    // Remove the '+' symbol from the phone number
    return phoneNumber.substring(1);
  } else if (phoneNumber.startsWith('0')) {
    // Remove leading zero and return
    return phoneNumber.substring(1);
  }

  // Return the phone number as is if no modifications are needed
  return phoneNumber;
}

// Usage example
void main() {
  // Examples of phone numbers with and without '0'
  String phone1 = "0592678828";
  String phone2 = "592678828";

  // Extract and format numbers
  String formatted1 = extractPhoneNumber('+970$phone1');
  String formatted2 = extractPhoneNumber('+970$phone2');

  // Output
  print(formatted1); // Output: +970592678828
  print(formatted2); // Output: +970592678828
}
