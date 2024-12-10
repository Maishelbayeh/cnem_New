import 'package:cenem/view/custom%20componant/popUpmenue.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const secondaryColor = Color.fromARGB(255, 10, 10, 10);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color.fromARGB(255, 20, 20, 20);
const bgColor = Color.fromARGB(255, 244, 245, 246);
const defaultPadding = 20.0;
const light = Color.fromARGB(255, 244, 245, 246);
const lightGrey = Color(0xFFA4A6B3);
const dark = Color(0xFF363740);
const active = Color.fromARGB(255, 34, 74, 106);

const first = Color.fromARGB(255, 171, 171, 172);

const second = const Color.fromRGBO(69, 30, 156, 1);
final defaultPinTheme = PinTheme(
  width: 60,
  height: 60,
  textStyle: const TextStyle(fontSize: 22, color: second),
  decoration: BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: second),
  ),
);
final List<MenuItem> menuItems = [
  MenuItem(
    label: 'تواصل معنا عبر الايميل',
    url: 'mailto:example@example.com',
    icon: Icons.email_rounded,
    color: const Color.fromARGB(255, 181, 56, 47),
  ),
  MenuItem(
    label: 'تواصل معنا عبر الفيسبوك',
    url: 'https://www.facebook.com/profile.php?id=61560262301387',
    icon: Icons.facebook,
    color: const Color.fromARGB(255, 75, 126, 173),
  ),
];
