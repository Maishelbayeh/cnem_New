// // info_settings.dart

// import 'package:cenem/view/mobile_member/components/form_fields.dart';
// import 'package:flutter/material.dart';

// class InfoSettings extends StatefulWidget {
//   final double height;
//   final double width;
//   final Color first;
//   final Color second;

//   InfoSettings({required this.height, required this.width})
//       : first = Colors.grey,
//         second = Colors.blue;

//   @override
//   _InfoSettingsState createState() => _InfoSettingsState();
// }

// class _InfoSettingsState extends State<InfoSettings> {
//   @override
//   Widget build(BuildContext context) {
//     double height = widget.height;
//     double width = widget.width;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: (height / 1.333) * 0.05,
//             left: 30,
//             right: width * 0.1,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildTextFormField(
//                     label: "نضال",
//                     width: width * 0.37,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                   SizedBox(width: width * 0.06),
//                   buildTextFormField(
//                     label: "ديما",
//                     width: width * 0.37,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildTextFormField(
//                     label: "987748757",
//                     width: width * 0.37,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                   SizedBox(width: width * 0.06),
//                   buildTextFormField(
//                     label: "خليلي",
//                     width: width * 0.37,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15),
//               buildTextFormField(
//                 label: "khalilidema@gmail.com",
//                 width: double.infinity,
//                 isEmail: true,
//                 isCentered: true,
//                 first: widget.first,
//                 second: widget.second,
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildDropdownFormField(
//                     hint: 'الجنسية',
//                     value: 'اردنية',
//                     items: ['اردنية', 'فلسطينية'],
//                     width: width * 0.35,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                   SizedBox(width: width * 0.06),
//                   buildDropdownFormField(
//                     hint: '',
//                     value: 'انثى',
//                     items: ['انثى', 'ذكر'],
//                     width: width * 0.35,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15),
//               buildTextFormField(
//                 label: "19-9-2001",
//                 width: double.infinity,
//                 isCentered: true,
//                 first: widget.first,
//                 second: widget.second,
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildTextFormField(
//                     label: "A0001",
//                     width: width * 0.35,
//                     isCentered: true,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                   SizedBox(width: width * 0.06),
//                   buildTextFormField(
//                     label: "0592073408",
//                     width: width * 0.35,
//                     isCentered: true,
//                     first: widget.first,
//                     second: widget.second,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/signupController.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/user/pages/users/split.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/custombirthdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cenem/view/onbonding/authentication/componants/memberForm/Textfield.dart';
import 'package:intl/intl.dart';

List<String> name = splitStringBySpace(mem.memberName);
List<String> nameE = splitStringBySpace(mem.memberNameEnglish ?? "");
final SecondSignFormController controller = Get.put(SecondSignFormController());
final AuthController authController = Get.put(AuthController());
final SignUpFormController signUpFormController =
    Get.put(SignUpFormController());
final TextEditingController codeController =
    TextEditingController(text: mem.memberToken);

class InfoSettings extends StatefulWidget {
  final double height;
  final double width;
  const InfoSettings({super.key, required this.height, required this.width});

  @override
  State<InfoSettings> createState() => _InfoSettings();
}

class _InfoSettings extends State<InfoSettings> {
  @override
  void initState() {
    controller.firstNameController.text = name[0];
    controller.middleNameController.text = name[1];
    controller.lastNameController.text = name[2];
    controller.firstNameEController.text = nameE[0];
    controller.lastNameEController.text = nameE[1];
    controller.memberIdController.text = mem.Id.toString();
    authController.emailController.text = user.email;
    authController.phoneController.text = user.phone;
    controller.dateEditingController.text = mem.birthday.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: (widget.height / 1.333) * 0.05,
          left: 30,
          right: widget.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
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
            const SizedBox(
              height: 15,
            ),
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
            const SizedBox(height: 15),
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
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
                Expanded(
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: codeController,
                        hintText: 'الرمز',
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
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width * 0.6),
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
          ],
        ),
      ),
    );
  }
}
