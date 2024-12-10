import 'dart:async';

import 'package:cenem/Api/fetchmember.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/onbonding/payment/recurenccypayment_html.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

final ValueNotifier<bool> _showFees = ValueNotifier<bool>(false);
Timer? _timer;

class ProfessionalDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ProfessionalDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _dateToString(DateTime date) {
      return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      backgroundColor: Colors.white, // Background color
      insetPadding: const EdgeInsets.all(20), // Adjust padding for dialog size
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400), // Set a max width
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height based on content
            children: [
              // Icon or Header
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(69, 30, 156, 1),
                child: Icon(
                  Icons.payment,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                "تأكيد الدفع",
                style: GoogleFonts.elMessiri(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(69, 30, 156, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Message
              Text(
                "هل ترغب في تأكيد الدفع للمبلغ التالي؟",
                style:
                    GoogleFonts.elMessiri(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Payment Details
              Column(
                children: [
                  _buildPaymentDetailRow("الاسم:", mem.memberName),
                  _buildPaymentDetailRow(
                      "البريد:", storageService.loadString("email")!),
                  _buildPaymentDetailRow("الهاتف:", user.phone),
                  _buildPaymentDetailRow(
                      "المبلغ:", sub!.currentPaymentNow.toString()),
                  _buildPaymentDetailRow(
                      "أول خصم:", _dateToString(sub!.recurringStartDate)),
                  _buildPaymentDetailRow("مبلغ الاشتراك الشهري:",
                      sub!.recurringMonthlyPayment.toString()),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تاكيد الدفعة",
                    style: GoogleFonts.elMessiri(
                        fontSize: 16, color: Colors.black87),
                  ),
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

              // Confirm and Cancel Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _showFees,
                      builder: (context, value, child) {
                        return Visibility(
                          visible: value,
                          child: Column(
                            children: [
                              Iframe(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: const BorderSide(
                          color: Color.fromRGBO(69, 30, 156, 1),
                          width: 2,
                        ),
                      ),
                      onPressed: onCancel,
                      child: Text(
                        "إلغاء",
                        style: GoogleFonts.elMessiri(
                          fontSize: 16,
                          color: const Color.fromRGBO(69, 30, 156, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 20), () {
      _showFees.value = false;
      Get.back();
      Get.find<AuthController>().isSignUp.value = false;
      subscriptionService.clearSubscription();

      userService.clearUser();
      memberService.clearMember();
      secondauth.clearForm();
    });
  }

  Widget _buildPaymentDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.elMessiri(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.elMessiri(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
