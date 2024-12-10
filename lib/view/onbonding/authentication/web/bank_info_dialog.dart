import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/bankcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html; // Import this for browser tab control

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.dialog(BankInfoDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delayed Dialog Example'),
      ),
      body: Center(
        child: Text('Wait for 3 seconds to see the dialog...'),
      ),
    );
  }
}

class BankInfoDialog extends StatelessWidget {
  final Bankcontroller controller = Get.put(Bankcontroller());
  final DateTime now = DateTime.now();
  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final backcontroller = Get.find<DialogNavigationController>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const AnimatedDescriptionText(
          start: 18,
          end: 22,
          text: "ايصال",
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            backcontroller.goBack();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: second,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "التاريخ:",
                      style: TextStyle(
                        color: second,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: second,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'رقم الطلب:',
                      style: TextStyle(
                        color: second,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(() => Text(
                          controller.orderNumber.value,
                          style: const TextStyle(
                            color: second,
                            fontSize: 16,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(
              color: second,
            ),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "معلومات الفاتورة",
                      style: TextStyle(
                        color: second,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.customerName.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.address.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.city.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.state.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.postalCode.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.country.value,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
            const Divider(
              color: second,
            ),
            const SizedBox(height: 9),
            Row(
              children: [
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "بيانات الدفع",
                          style: TextStyle(
                            color: second,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              "نوع البطاقة",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              controller.cardType.value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "رقم البطاقة",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              controller.cardNumber.value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "تاريخ انتهاء الصلاحية",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              controller.expiryDate.value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    color: const Color.fromARGB(255, 222, 249, 222),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => Row(
                            children: [
                              const Text(
                                "اجمالي المبلغ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                controller.totalAmount.value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: second,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomButton(
                buttonText: 'اغلاق',
                width: MediaQuery.of(context).size.width * 0.15,
                height: 40,
                onTap: () async {
                  html.window.close(); // Close the current browser tab
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
