import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/Api/paymentApi.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/custombirthdate.dart';
import 'package:cenem/view/onbonding/payment/paymentError.dart';
import 'package:cenem/view/onbonding/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/Textfield.dart';
import 'package:cenem/view/onbonding/authentication/componants/popdown.dart';
import 'package:cenem/view/onbonding/authentication/componants/switchTile.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL() async {
  const url = 'https://discord.gg/uMmsEKY7bN';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Second Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SecondSignUpPage(),
    );
  }
}

final SecondSignFormController controller = Get.put(SecondSignFormController());

class SecondSignUpPage extends StatelessWidget {
  const SecondSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AnimatedDescriptionText(
            start: 10, end: 15, text: "تسجيل كعضو في الشبكة"),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/Home/SiteCondition');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: second,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(children: [
                        Image.asset(
                          'assets/images/cnem.png',
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: defaultPadding * 2),
                      ]))),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.firstNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: 'الاسم الأول',
                            validator: controller.validateFirstName,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r'[\u0600-\u06FF\s]'), // Arabic characters and space
                              ), // Allow Arabic characters and spaces
                            ],
                          ),
                          if (controller.firstNameError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.firstNameError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.middleNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: "الاسم الثاني",
                            validator: controller.validateMiddleName,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r'[\u0600-\u06FF\s]'), // Arabic characters and space
                              ),
                            ],
                          ),
                          if (controller.middleNameError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.middleNameError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.lastNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: "اسم العائلة",
                            validator: controller.validateLastName,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r'[\u0600-\u06FF\s]'), // Arabic characters and space
                              ), // English letters (a-z, A-Z) and spaces
                            ],
                          ),
                          if (controller.lastNameError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.lastNameError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.firstNameEController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: 'First name',
                            validator: controller.validateFirstNameE,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r'[a-zA-Z\s]'), // English letters (a-z, A-Z) and spaces
                              ),
                            ],
                          ),
                          if (controller.firstENameError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.firstENameError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(
                () {
                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.lastNameEController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              hintText: 'Last name',
                              validator: controller.validateLastNameE,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(
                                      r'[a-zA-Z\s]'), // English letters (a-z, A-Z) and spaces
                                ),
                              ],
                            ),
                            if (controller.lastENameError.value.isNotEmpty)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  controller.lastENameError.value,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.memberIdController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            hintText: 'رقم الهوية',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(9),
                            ],
                          ),
                          if (controller.memberIdError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.memberIdError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDateTimeFormField(
                            controller: controller.dateEditingController,
                            dateFormat: DateFormat('yyyy-MM-dd'),
                            firstDate: DateTime(1930),
                            lastDate: DateTime(DateTime.now().year - 18),
                            validator: controller.validateSelected,
                            onChanged: (DateTime? value) {
                              controller.selectedDate.value = value;
                            },
                          ),
                          if (controller.dateEditingError.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.dateEditingError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownFormField(
                            hint: "الجنس",
                            items: const ["ذكر", "انثى"],
                            validator: controller.validategender,
                            value: controller.gender.value,
                            onChanged: (value) {
                              controller.gender.value = value!;
                            },
                          ),
                          if (controller.genderError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.genderError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownFormField(
                            validator: controller.validateNationality,
                            hint: "الجنسية",
                            items: const ["اردنية", "فلسطينية"],
                            value: controller.nationality.value,
                            onChanged: (value) {
                              controller.nationality.value = value!;
                            },
                          ),
                          if (controller.nationalityError.value.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.nationalityError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column for the TextField
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: controller.Discordname,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          hintText: 'اسم المستخدم على منصة ديسكورد',
                          inputFormatters: const [], // Add your input formatters here
                        ),
                        // Error message if any
                        if (controller.memberIdError.value.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.memberIdError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const Padding(
                          padding: EdgeInsets.only(left: 25.0, top: 20),
                          child: InkWell(
                            onTap: _launchURL, // When clicked, it opens the URL
                            child: Text(
                              'لاملك حساب على منصة ديسكورد',
                              style: TextStyle(
                                color: second,
                                fontSize: 20,
                                fontWeight: FontWeight.bold, //
                                // Replace 'second' with the correct color
                                // Makes it look like a link
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right: InkWell for clickable link
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (bool? value) {
                          controller.toggleisChecked(value ?? false);
                        },
                      )),
                  Obx(() => Text(
                        "أوافق على شروط وأحكام الشبكة",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .044,
                          color: controller.isChecked.value ? second : first,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSwitchListTile(
                      title: 'هل سمعت عن الشبكة من شخص فيها ؟',
                      value: controller.heardFromPerson.value,
                      onChanged: (bool value) {
                        controller.heardFromPerson.value = value;
                        if (!value) {
                          controller.parentTokenController.text = '00000';
                        } else {
                          controller.parentTokenController.clear();
                        }
                      },
                      validator: controller.validateParentToken,
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: controller.heardFromPerson.value,
                      child: Column(children: [
                        CustomTextField(
                          controller: controller.parentTokenController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          hintText: 'رقم الشخص',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9]')),
                            LengthLimitingTextInputFormatter(7),
                          ],
                          validator: controller.validateParentToken,
                        ),
                        if (controller.parentError.value.isNotEmpty)
                          Text(
                            controller.parentError.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                      ]),
                    ),
                    const Text(
                        "استخدامك لرمز شخص في الشبكة يمنحك خصمًا على الاشتراك الشهري لتدفع\$25 بدلاً من \$30."),
                  ],
                );
              }),
              Obx(() => Stack(
                    children: [
                      // Main UI including the button
                      Column(
                        children: [
                          CustomButton(
                            buttonText: 'التالي',
                            width: MediaQuery.of(context).size.width,
                            enabled: controller.isChecked.value,
                            onTap: () async {
                              controller.printValidationResults();
                              if (controller.validateForm()) {
                                if (!controller.heardFromPerson.value) {
                                  controller.parentTokenController.text =
                                      "00000";
                                  showPaymentProfessionalErrorDialog(context);
                                }

                                if (await controller.addMember(context)) {
                                  auth.isShowLoading.value = true;

                                  await fetchOffspringMembers(user.userId);
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  fetchSubscription();
                                  await Future.delayed(
                                      const Duration(seconds: 1));

                                  Get.snackbar(
                                    'نجاح',
                                    'تم التسجيل بنجاح',
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  Get.toNamed("/Home");
                                }
                                if (sub?.currentPaymentNow != 1.0) {
                                  auth.isShowLoading.value = false;
                                  Get.snackbar(
                                    'نجاح',
                                    'تم التسجيل بنجاح',
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  Get.toNamed("/Home");
                                  showDialog(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    builder: (context) {
                                      return ProfessionalDialog(
                                        onConfirm: () {
                                          // ignore: avoid_print
                                          print("تم تأكيد الدفع");
                                          Navigator.of(context).pop();
                                        },
                                        onCancel: () {
                                          // ignore: avoid_print
                                          print("تم إلغاء الدفع");
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  Get.snackbar(
                                    'نجاح',
                                    'تم التسجيل بنجاح',
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  Get.toNamed("/Home");
                                }
                                auth.isShowLoading.value = false;
                                controller.clearForm();
                                await fetchOffspringMembers(user.userId);

                                await fetchSubscription();
                              }
                              controller.clearForm();
                            },
                          ),
                        ],
                      ),
                      // Loader widget when isShowLoading is true
                      if (auth.isShowLoading.value)
                        Container(
                          color: second
                              // ignore: deprecated_member_use
                              .withOpacity(0.5), // Semi-transparent background
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
