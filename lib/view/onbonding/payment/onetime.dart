import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/user/widgets/header_info.dart';
import 'package:cenem/view/onbonding/payment/onetime-html.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

final ValueNotifier<bool> _showFees = ValueNotifier<bool>(false);
Timer? _timer;

void showCustomDialogonetime() {
  Get.dialog(
    AlertDialog(
      title: const Text(
        'الانتقال الى مرحله الدفع ..',
        style: TextStyle(
          fontSize: 24, // Change the font size
          fontWeight: FontWeight.bold, // Change the font weight
          color: second, // Change the color
          // Use a custom font family
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          AreaInfoText(
            title: "الاسم",
            text: mem.memberName,
          ),
          AreaInfoText(
            title: "البريد الالكتروني",
            text: user.email,
          ),
          AreaInfoText(
            title: "رقم الهاتف",
            text: user.phone,
          ),
          const AreaInfoText(
            title: "الاشتراك لمره واحده",
            text: "35 دولارا",
          ),

          // Add the slider to control the visibility of the fees
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('تاكيد الدفعه'),
              ValueListenableBuilder<bool>(
                valueListenable: _showFees,
                builder: (context, value, child) {
                  return Switch(
                    value: value,
                    onChanged: (newValue) {
                      _showFees.value = newValue;
                      if (newValue) {
                        _startTimer();
                      } else {
                        _timer?.cancel();
                      }
                    },
                  );
                },
              ),
            ],
          ),
          // Conditionally show the fee information
          ValueListenableBuilder<bool>(
            valueListenable: _showFees,
            builder: (context, value, child) {
              return Visibility(
                visible: value,
                child: Column(
                  children: [
                    Iframeonetime(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

void _startTimer() {
  _timer?.cancel();
  _timer = Timer(const Duration(seconds: 20), () {
    _showFees.value = false;
    Get.back();
  });
}
