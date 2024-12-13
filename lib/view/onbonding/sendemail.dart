import 'package:cenem/Api/sendEmailapi.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(EmailPopup());
}

class EmailPopup extends StatefulWidget {
  State<EmailPopup> createState() => _EmailPopup();
}

class _EmailPopup extends State<EmailPopup> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    // Initialize the EmailController
    emailController.emailController.text = 'cnem.technichal@gmail.com';

    return Scaffold(
        backgroundColor: bgColor, // Replace `bgColor` with a valid color
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: bgColor,
          title: const Text(
            'إرسال بريد إلكتروني',
            style: TextStyle(
              fontSize: 18,
              color: second, // Replace `second` with a valid color
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Responsive(
                desktop: _buildEmailPopupContent(
                    constraints.maxWidth, constraints.maxHeight),
                largeMobile: _buildEmailPopupContent(
                    constraints.maxWidth, constraints.maxHeight),
                extraLargeScreen: _buildEmailPopupContent(
                    constraints.maxWidth, constraints.maxHeight),
                mobile: _buildEmailPopupContent(
                    constraints.maxWidth, constraints.maxHeight),
                tablet: _buildEmailPopupContent(
                    constraints.maxWidth, constraints.maxHeight),
              ),
            );
          },
        ));
  }

  Widget _buildEmailPopupContent(double width, double height) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: Responsive.isTablet(context)
            ? const EdgeInsets.only(left: defaultPadding, right: defaultPadding)
            : const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  return CircularProgressIndicator();
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
                    decoration: InputDecoration(
                      labelText: 'اختر موضوع الايميل',
                      labelStyle: const TextStyle(
                          color: second), // Customize label color
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: first), // Customize border color
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: second), // Customize focused border color
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: first), // Customize enabled border color
                      ),
                    ),
                    // ... Additional properties like validator
                  );
                }
              },
            ),
            SizedBox(height: height * 0.02),
            buildTextField(
              controller: emailController.messageController,
              label: 'الرسالة',
              maxLines: (height * 0.015).toInt(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال الرسالة';
                }
                return null;
              },
            ),
            SizedBox(height: height * 0.02),
            // This pushes the buttons to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, // => Get.back(),
                  child: const Text('إلغاء'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    //print("send");

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
      ),
    );
  }
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
      labelStyle: const TextStyle(color: second), // Customize label color
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: first), // Customize border color
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: second), // Customize focused border color
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: first), // Customize enabled border color
      ),
    ),
    cursorColor: second, // Customize cursor color
    style: const TextStyle(color: second), // Customize text color
  );
}

// This is the type used by the menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

Future<List<String>> fetchDropdownOptions() async {
  // Imagine this function fetches data from an external source
  // For instance, fetching from an API: https://api.example.com/options
  // Replace with your actual fetch logic
  return ['استفسار', 'ابلاغ', "شكوى", "طلب", "توصيه"];
}
