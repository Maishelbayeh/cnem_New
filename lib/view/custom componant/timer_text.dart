// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:cenem/Api/reserpasscode.dart';
import 'package:cenem/controllers/Signin_controller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PasswordResetApiService _apiService = PasswordResetApiService();
final sauthController = Get.find<SignInController>();
final authController = Get.find<AuthController>();

class TimerText extends StatefulWidget {
  const TimerText({super.key});

  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  late Timer _timer;
  int _start = 240; // 4 minutes in seconds
  bool _isClickable = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isClickable = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      _start = 240;
      _isClickable = false;
    });
    _timer.cancel();
    startTimer();
  }

  String get formattedTime {
    final minutes = _start ~/ 60;
    final seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _isClickable
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    resetTimer();
                    ////print("Resend code clicked");
                    await _apiService
                        .resetPassword(authController.emailsignController.text);
                  },
                  child: const Text(
                    "اعدّ الارسال",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            : Text(
                "اعد الارسال بعد  $formattedTime",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
      ],
    );
  }
}
