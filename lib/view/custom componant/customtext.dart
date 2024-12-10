// custom_text.dart
import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final int? size;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 16,
            //  backgroundColor: color?.withOpacity(0.1),
            fontWeight: FontWeight.bold,
            color: color ?? second,
          ),
    );
  }
}
