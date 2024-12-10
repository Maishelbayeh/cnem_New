import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Replace these constants with your actual theme values

// Mock email controller class
class EmailController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
}

final emailController = EmailController();

class SendEmailSectionLarge extends StatefulWidget {
  const SendEmailSectionLarge({super.key});

  @override
  _SendEmailSectionLargeState createState() => _SendEmailSectionLargeState();
}

class _SendEmailSectionLargeState extends State<SendEmailSectionLarge> {
  String? selectedValue;
  double height = 600.0; // Example height value for layout consistency

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.03), // 2% of screen width
      margin: const EdgeInsets.symmetric(vertical: 30),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: lightGrey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Icon(
            Icons.mark_email_read,
            size: height * 0.2,
            color: second,
          ),
          SizedBox(height: height * 0.04),
          buildTextField(
            isEnabel: false,
            controller: emailController.emailController,
            label: 'البريد الإلكتروني',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال البريد الإلكتروني';
              }
              if (!GetUtils.isEmail(value)) {
                return 'يرجى إدخال بريد إلكتروني صالح';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
          FutureBuilder<List<String>>(
            future: fetchDropdownOptions(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return DropdownButtonFormField<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  items: snapshot.data!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'اختر موضوع الايميل',
                    labelStyle: TextStyle(color: second),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: first),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: second),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: first),
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(height: height * 0.02),
          buildTextField(
            controller: emailController.messageController,
            label: 'الرسالة',
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال الرسالة';
              }
              return null;
            },
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close dialog
                },
                child: const Text('إلغاء'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () async {
                  bool success = await sendMail(
                    subject: selectedValue ?? "",
                    body: emailController.messageController.text,
                    attachments: [],
                  );

                  if (success) {
                    Get.back(); // Close the alert dialog
                    Get.snackbar(
                      'نجاح',
                      'تم إرسال البريد الإلكتروني بنجاح',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      'خطأ',
                      'حدث خطأ أثناء إرسال البريد الإلكتروني. حاول مرة أخرى.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text('إرسال'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    bool isEnabel = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      enabled: isEnabel,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: second),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: first),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: second),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: first),
        ),
      ),
      cursorColor: second,
      style: const TextStyle(color: second),
    );
  }
}

Future<List<String>> fetchDropdownOptions() async {
  return ['استفسار', 'ابلاغ', "شكوى", "طلب", "توصيه"];
}

Future<bool> sendMail({
  required String subject,
  required String body,
  required List<String> attachments,
}) async {
  // Mock sending email
  await Future.delayed(const Duration(seconds: 2));
  return true; // Simulate successful email sending
}
