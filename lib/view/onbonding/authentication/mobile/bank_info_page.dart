import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';
import 'package:cenem/controllers/bankcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final Bankcontroller controller = Get.put(Bankcontroller());
DateTime now = DateTime.now();

class BankInfoPage extends StatefulWidget {
  const BankInfoPage({super.key});

  @override
  State<BankInfoPage> createState() => _BankInfoPageState();
}

class _BankInfoPageState extends State<BankInfoPage> {
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  @override
  Widget build(BuildContext context) {
    final backcontroller = Get.find<DialogNavigationController>();
    final controller = Get.find<Bankcontroller>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const AnimatedDescriptionText(
          start: 15,
          end: 18,
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
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
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
            const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
              ),
              child: Divider(
                color: second,
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
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
                    ),
                    Spacer(),
                    Container(
                      color: const Color.fromARGB(255, 222, 249, 222),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      child: Obx(() => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
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
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
              ),
              child: Divider(
                color: second,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomButton(
                buttonText: 'طباعة',
                width: MediaQuery.of(context).size.width * 0.35,
                height: 40,
                onTap: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
