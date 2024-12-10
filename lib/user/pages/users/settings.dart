import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/Api/updateuser.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/user/pages/users/split.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/signupController.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/Textfield.dart';

import 'package:cenem/view/onbonding/authentication/componants/memberForm/custombirthdate.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String _dateToString(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}

List<String> name = splitStringBySpace(mem.memberName);
List<String> nameE = splitStringBySpace(mem.memberNameEnglish ?? "");
final SecondSignFormController controller = Get.put(SecondSignFormController());
final AuthController authController = Get.put(AuthController());
final SignUpFormController signUpFormController =
    Get.put(SignUpFormController());
final TextEditingController codeController =
    TextEditingController(text: mem.parentsToken);

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settings();
}

class _settings extends State<settings> {
  @override
  void initState() {
    controller.firstNameController.text = name[0];
    controller.middleNameController.text = name[1];
    controller.lastNameController.text = name[2];
    controller.firstNameEController.text = nameE[0];

    controller.lastNameEController.text = nameE[1];
    controller.memberIdController.text = mem.idNumber ?? "";
    authController.emailController.text = email;
    authController.phoneController.text = phone;
    controller.totalAmount.text =
        "${mem.totalAmount} دولارا مبلغ الانتساب الى الشبكة ";
    controller.dateEditingController.text = _dateToString(mem.birthday!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<DialogNavigationController>();

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: const AnimatedDescriptionText(
              start: 18, end: 22, text: "تعديل المعلومات الحساب"),
          backgroundColor: bgColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: second,
              size: 30,
            ),
          ),
        ),
        body: Center(
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
                                      RegExp(r'[\u0600-\u06FF]')),
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
                                      RegExp(r'[\u0600-\u06FF]')),
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
                                      RegExp(r'[\u0600-\u06FF]')),
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
                                      RegExp(r'[a-zA-Z\s]')),
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
                                      RegExp(r'[a-zA-Z\s]')),
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
                                  enabled: false,
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
                              CustomTextField(
                                  controller: controller.totalAmount,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  hintText: "",
                                  enabled: false,
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
                                lastDate: DateTime(DateTime.now().year - 18),
                                validator: controller.validateSelected,
                                onChanged: (DateTime? value) {
                                  controller.selectedDate.value =
                                      value ?? DateTime.now();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.6 / 3),
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: authController.emailController,
                              hintText: 'البريد الإلكتروني',
                              enabled: false,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                signUpFormController.validateEmail(value ?? '');
                                return null;
                              },
                            ),
                            Obx(() => Text(
                                  signUpFormController.emailError.value,
                                  style: const TextStyle(color: Colors.red),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.6 / 3),
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: authController.phoneController,
                              hintText: 'رقم الهاتف',
                              enabled: false,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                signUpFormController.validatePhone(value ?? '');
                                return null;
                              },
                            ),
                            Obx(() => Text(
                                  signUpFormController.phoneError.value,
                                  style: const TextStyle(color: Colors.red),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.6 / 3),
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: codeController,
                              hintText: "رمز الشخص الراعي",
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              enabled: false,
                              validator: (value) {
                                signUpFormController.validatePhone(value ?? '');
                                return null;
                              },
                            ),
                            Obx(() => Text(
                                  signUpFormController.phoneError.value,
                                  style: const TextStyle(color: Colors.red),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    buttonText: 'حفظ',
                    width: MediaQuery.of(context).size.width,
                    onTap: () async {
                      //   if (controller.firstENameError.isEmpty &&
                      //       controller.firstNameError.isEmpty) {
                      // ignore: non_constant_identifier_names
                      final Newmember = Member(
                        memberName:
                            "${controller.firstNameController.text} ${controller.middleNameController.text} ${controller.lastNameController.text}",
                        // Assuming membername is defined somewhere in your code

                        birthday: controller.selectedDate.value,

                        memberNameEnglish:
                            "${controller.firstNameEController.text} ${controller.lastNameEController.text}",
                      );
                      updateMember(Newmember);
                      await fetchOffspringMembers(user.userId);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
