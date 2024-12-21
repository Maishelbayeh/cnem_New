import 'dart:convert';
import 'package:cenem/Api/membersignUp.dart';
import 'package:cenem/main.dart';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/onbonding/errordialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SecondSignFormController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController totalAmount = TextEditingController();
  final TextEditingController Discordname = TextEditingController();
  final TextEditingController parentTokenController =
      TextEditingController(text: '');
  final TextEditingController firstNameEController = TextEditingController();

  final TextEditingController lastNameEController = TextEditingController();
  var parent = '00000';
  var gender = ''.obs;
  var nationality = ''.obs;
  var heardFromPerson = true.obs;
  var isChecked = false.obs;
  var isButtonLoading = false.obs;
  var firstNameError = ''.obs;

  var parentneme = ''.obs;
  var dateEditingError = ''.obs;
  var middleNameError = ''.obs;
  var lastNameError = ''.obs;
  var memberIdError = ''.obs;
  var dateError = ''.obs;
  var parentError = ''.obs;
  var genderError = ''.obs;
  var nationalityError = ''.obs;

  var firstENameError = ''.obs;
  var middleENameError = ''.obs;
  var lastENameError = ''.obs;

  late String t;
  var selectedDate = Rxn<DateTime>();
  var selectedTime = TimeOfDay.now().obs;
  TextEditingController dateEditingController = TextEditingController();
  RegExp arabicRegex = RegExp(r'^[\u0600-\u06FF\u0750-\u077F\s]+$');

  RegExp englishRegex = RegExp(r'^[a-zA-Z\s]+$');

  @override
  void onInit() {
    super.onInit();
    parentTokenController.addListener(_onParentTokenChanged);
  }

  void _onParentTokenChanged() {
    if (parentTokenController.text.length == 7) {
      fetchParentToken();
    }
  }

  void fetchParentToken() async {
    String token = parentTokenController.text;
    parent = token;
    String url = 'https://cnem.online/BE/api/Members/MemberExistsToken/$token';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "X-Api-Key": "e7bba24d-32ed-42bb-833c-30c4eec9088d",
        'Authorization': 'Bearer ${user.authToken ?? authtoken}',
      });

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData != null && responseData['memberName'] != null) {
          List<String> words = responseData['memberName'].split(' ');
          parentneme.value = parentTokenController.text = words[0];
          parentName = words[0];
          "اسم العضو ${words[0]}   صاحب رقم    $token";

          //print('Member Name: ${parentTokenController.text}');
        } else {
          parentError.value = 'العضو غير موجود';
        }
      }
    } catch (e) {
      parentError.value = 'فشل الاتصال بالخادم';
    }
  }

  String? validateParentToken(String? value) {
    //print("paarent+${value}");
    if (value == '00000') {
      //print("parent");
      parent = '00000';
      parentTokenController.text = '00000';
      parentError.value = '';
      return null;
    } else if (parent.length != 7) {
      parentError.value = 'يجب أن يكون رقم  مكوناً من 7 أرقام';
      return parentError.value;
    }
    parentError.value = '';
    return null;
  }

  @override
  void onClose() {
    parentTokenController.removeListener(_onParentTokenChanged);
    parentTokenController.dispose();
    super.onClose();
  }

  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dateEditingController.text =
          DateFormat('dd-MM-yyyy').format(selectedDate.value!).toString();
    }
  }

  int saveGenderValue(String? value) {
    if (value == null || value.isEmpty) {
      return 2;
    }

    if (value == 'ذكر') {
      return 0;
    } else {
      return 1;
    }
  }

  String removeAllSpaces(String input) {
    return input.replaceAll(RegExp(r'\s+'), ''); // Remove all spaces
  }

  void toggleisChecked(bool value) {
    isChecked.value = value;
  }

  Future<bool> addMember(BuildContext context) async {
    String first = removeAllSpaces(firstNameController.text);
    String second = removeAllSpaces(middleNameController.text);
    String third = removeAllSpaces(lastNameController.text);
    String firstE = removeAllSpaces(firstNameEController.text);
    String laste = removeAllSpaces(lastNameEController.text);

    final member = Member(
        memberName: "$first $second $third",
        // Assuming membername is defined somewhere in your code
        idNumber: removeAllSpaces(memberIdController.text),
        gender: saveGenderValue(gender.value), // Assuming 0 represents male
        birthday: selectedDate.value,
        parentsToken: removeAllSpaces(parent),
        nationality: nationality.string,
        userId: user.userId,
        memberNameEnglish: "$firstE $laste",
        companyPolicyApproval: true,
        DiscordNameMember: removeAllSpaces(Discordname.text));

    bool result = await addMemberAPI(member);
    Future.delayed(const Duration(seconds: 2));
    if (result) {
      Future.delayed(const Duration(seconds: 1), () {
        auth.isShowLoading.value = false;
      });

      return true;
    } else {
      auth.isShowLoading.value = false;
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
      auth.isShowLoading.value = false;
      return false;
    }
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      firstNameError.value = 'يرجى إدخال الاسم الأول';
      return firstNameError.value;
    }

    if (!arabicRegex.hasMatch(value)) {
      firstNameError.value = 'الرجاء إدخال اسم باللغة العربية فقط';
      return firstNameError.value;
    }
    firstNameError.value = '';
    return null;
  }

  String? validateMiddleName(String? value) {
    if (value == null || value.isEmpty) {
      middleNameError.value = 'يرجى إدخال الاسم الأوسط';
      return middleNameError.value;
    }

    if (!arabicRegex.hasMatch(value)) {
      middleNameError.value = 'الرجاء إدخال اسم باللغة العربية فقط';
      return middleNameError.value;
    }
    middleNameError.value = '';
    return null;
  }

  String? validateFirstNameE(String? value) {
    if (value == null || value.isEmpty) {
      firstENameError.value = 'يرجى إدخال الاسم الأول';
      return firstENameError.value;
    }

    if (!englishRegex.hasMatch(value)) {
      firstENameError.value = 'الرجاء إدخال اسم باللغة الانجليزية فقط';
      return firstENameError.value;
    }
    firstENameError.value = '';
    return null;
  }

  String? validateMiddleNameE(String? value) {
    if (value == null || value.isEmpty) {
      middleENameError.value = 'يرجى إدخال الاسم الأوسط';
      return middleENameError.value;
    }

    if (!englishRegex.hasMatch(value)) {
      middleENameError.value = 'الرجاء إدخال اسم باللغة الانجليزية فقط';
      return middleENameError.value;
    }
    middleENameError.value = '';
    return null;
  }

  String? validateNationality(String? value) {
    if (value == null || value.isEmpty) {
      nationalityError.value = 'يرجى اختيار الجنسية';
      return nationalityError.value;
    }
    nationalityError.value = '';
    return null;
  }

  String? validategender(String? value) {
    if (value == null || value.isEmpty) {
      genderError.value = "يرجى اختيار جنس المستخدم"; // Set the error message
      return genderError.value; // Return the error message
    }
    genderError.value = ''; // Clear the error message
    return null; // No error
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      lastNameError.value = 'يرجى إدخال اسم العائلة';
      return lastNameError.value;
    }
    if (!arabicRegex.hasMatch(value)) {
      lastNameError.value = 'الرجاء إدخال اسم باللغة العربية فقط';
      return lastNameError.value;
    }
    lastNameError.value = '';
    return null;
  }

  String? validateLastNameE(String? value) {
    if (value == null || value.isEmpty) {
      lastENameError.value = 'يرجى إدخال الاسم العائلة';
      return lastENameError.value;
    }

    lastENameError.value = '';
    return null;
  }

  String? validateMemberId(String? value) {
    if (value == null || value.isEmpty) {
      memberIdError.value = 'يرجى إدخال رقم الهوية';
      return memberIdError.value;
    } else if (value.length != 9) {
      memberIdError.value = 'يجب أن يكون رقم الهوية مكوناً من 9 أرقام';
      return memberIdError.value;
    }
    memberIdError.value = '';
    return null;
  }

  String? validateSelected(DateTime? value) {
    if (value == null || value == DateTime.now()) {
      dateEditingError.value = 'يرجى إدخال تاريخ الميلاد';
      dateEditingController.clear();
      return dateEditingError.value;
    }

    dateEditingError.value = '';
    dateEditingController.text = value.toString();
    return null;
  }

  bool validateForm() {
    validateFirstName(firstNameController.text);
    validateMiddleName(middleNameController.text);
    validateLastName(lastNameController.text);

    validateFirstNameE(firstNameEController.text);

    validateLastNameE(lastNameEController.text);

    validateMemberId(memberIdController.text);

    validateParentToken(parentTokenController.text);
    validateNationality(nationality.value);
    validategender(gender.value);
    validateSelected(selectedDate.value);

    if (firstNameError.value.isEmpty &&
        middleNameError.value.isEmpty &&
        lastNameError.value.isEmpty &&
        firstENameError.value.isEmpty &&
        //middleENameError.value.isEmpty &&
        lastENameError.value.isEmpty &&
        memberIdError.value.isEmpty &&
        //parentTokenError.value.isEmpty &&
        nationalityError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateEditingError.value.isEmpty) {
      return true;
    }
    return false;
  }

  void printValidationResults() {
    validateFirstName(firstNameController.text);
    validateMiddleName(middleNameController.text);
    validateLastName(lastNameController.text);
    validateFirstNameE(firstNameEController.text);

    validateLastNameE(lastNameEController.text);
    validateMemberId(memberIdController.text);
    validateParentToken(parentTokenController.text);
    validateNationality(nationality.value);
    validategender(gender.value);
    validateSelected(selectedDate.value);
  }

  void clearForm() {
    firstNameController.clear();
    middleNameController.clear();
    lastNameController.clear();
    memberIdController.clear();
    parentTokenController.clear();
    firstNameEController.clear();
    lastNameEController.clear();
    dateEditingController.clear();

    gender.value = '';
    nationality.value = '';
    heardFromPerson.value = false;
    isChecked.value = false;
    selectedDate.value = null;

    firstNameError.value = '';
    dateEditingError.value = '';
    middleNameError.value = '';
    lastNameError.value = '';
    memberIdError.value = '';
    dateError.value = '';
    parentError.value = '';
    genderError.value = '';
    nationalityError.value = '';

    firstENameError.value = '';
    middleENameError.value = '';
    lastENameError.value = '';
  }
}
