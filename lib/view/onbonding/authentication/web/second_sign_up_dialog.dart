import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/Api/getchildren.dart';
import 'package:cenem/Api/paymentApi.dart';
import 'package:cenem/Api/reserpasscode.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/Textfield.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/custombirthdate.dart';
import 'package:cenem/view/onbonding/authentication/componants/popdown.dart';
import 'package:cenem/view/onbonding/authentication/componants/switchTile.dart';
import 'package:cenem/view/onbonding/payment/payment.dart';
import 'package:cenem/view/onbonding/payment/paymentError.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL() async {
  const url = 'https://discord.gg/uMmsEKY7bN';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final SecondSignFormController controller = Get.put(SecondSignFormController());

class DialogContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            centerTitle: true,
            title: const AnimatedDescriptionText(
                start: 18, end: 22, text: "تسجيل كعضو في الشبكة"),
            backgroundColor: bgColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                //  backcontroller.goBack();
                Get.find<DialogNavigationController>()
                    .currentPage('/Confirm condition');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: second,
                size: 30,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Responsive(
                  desktop: _buildDialogContent(context),
                  largeMobile: _buildDialogContent(context),
                  extraLargeScreen: _buildDialogContent(context),
                  mobile: _buildDialogContent(context),
                  tablet: _buildDialogContent(context),
                ),
              );
            },
          ),
        ),
        auth.isShowLoading.value
            ? CustomPositioned(
                child: LoadingAnimationWidget.discreteCircle(
                  color: second,
                  size: 100,
                ),
              )
            : const SizedBox(),
        // auth.isShowConfetti.value
        //     ? const CustomPositioned(
        //         scale: 6,
        //         child: RiveAnimation.asset(
        //           "assets/images/confetti.riv",
        //           onInit: onConfettiRiveInit,
        //           fit: BoxFit.cover,
        //         ),
        //       )
        //     : const SizedBox(),
      ]),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    final backcontroller = Get.find<DialogNavigationController>();
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() {
                      return Column(
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
                              ),
                            ],
                          ),
                          if (controller.firstNameError.value.isNotEmpty)
                            Text(
                              controller.firstNameError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Obx(() {
                      return Column(
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
                            Text(
                              controller.middleNameError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Obx(() {
                      return Column(
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
                              ),
                            ],
                          ),
                          if (controller.lastNameError.value.isNotEmpty)
                            Text(
                              controller.lastNameError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() {
                      return Column(
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
                            Text(
                              controller.lastENameError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.firstNameEController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: "First name",
                            validator: controller.validateFirstNameE,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r'[a-zA-Z\s]'), // English letters (a-z, A-Z) and spaces
                              ),
                            ],
                          ),
                          if (controller.firstENameError.value.isNotEmpty)
                            Text(
                              controller.firstENameError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return Column(
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
                              ]),
                          if (controller.memberIdError.value.isNotEmpty)
                            Text(
                              controller.memberIdError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDateTimeFormField(
                            controller: controller.dateEditingController,
                            dateFormat: DateFormat('yyyy-MM-dd'),
                            firstDate: DateTime(1930),
                            lastDate: DateTime(DateTime.now().year),
                            validator: controller.validateSelected,
                            onChanged: (DateTime? value) {
                              //print(value);
                              controller.selectedDate.value =
                                  value ?? DateTime.now();

                              //print(controller.dateEditingController.text);
                            },
                          ),
                          if (controller.dateEditingError.isNotEmpty)
                            Text(
                              controller.dateEditingError.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: CustomDropdownFormField(
                          hint: "الجنس",
                          items: const ["ذكر", "انثى"],
                          validator: controller.validategender,
                          // If the controller.gender.value is null, set it to an initial valid value
                          value: controller.gender.value.isEmpty
                              ? null
                              : controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value!;
                          },
                        ),
                      ),
                      if (controller.genderError.value.isNotEmpty)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.genderError.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ]),
                    const SizedBox(width: 20),
                    Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: CustomDropdownFormField(
                          validator: controller.validateNationality,
                          hint: "الجنسية",
                          items: const ["اردنية", "فلسطينية"],
                          // Check if the nationality is empty or not valid, and set it to null if necessary
                          value: controller.nationality.value.isEmpty
                              ? null
                              : controller.nationality.value,
                          onChanged: (value) {
                            controller.nationality.value = value!;
                          },
                        ),
                      ),
                      if (controller.nationalityError.value.isNotEmpty)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.nationalityError.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ]),
                    const SizedBox(width: 10),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          fontSize: MediaQuery.of(context).size.width * .015,
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
                        validator: controller.validateParentToken),
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
                        "استخدامك لرمز شخص في الشبكة يمنحك خصمًا على الاشتراك الشهري لتدفع\$\25 بدلاً من \$\30."),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() => Stack(
                    children: [
                      // Main UI including the button
                      Column(
                        children: [
                          CustomButton(
                            buttonText: 'التالي',
                            width: MediaQuery.of(context).size.width,
                            enabled: controller.isChecked.value &&
                                !controller.isButtonLoading.value,
                            onTap: () async {
                              if (controller.isButtonLoading.value)
                                return; // Prevent multiple presses

                              controller.isButtonLoading.value =
                                  true; // Start loading
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
                                    context: context,
                                    builder: (context) {
                                      return ProfessionalDialog(
                                        onConfirm: () {
                                          print("تم تأكيد الدفع");
                                          Navigator.of(context).pop();
                                        },
                                        onCancel: () {
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
                              controller.isButtonLoading.value =
                                  false; // Stop loading
                              controller.clearForm();
                            },
                          ),
                        ],
                      ),
                      // Loader widget when isShowLoading is true
                      if (auth.isShowLoading.value)
                        Container(
                          color: second
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
