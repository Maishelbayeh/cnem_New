import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final double start;
  final double end;
  String? text;
  final Color? color;
  final double? fontsize;
  CustomText({
    super.key,
    required this.start,
    required this.end,
    this.text,
    this.fontsize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text ?? 'o',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
                height: 0,
                fontSize: value,
              ),
        );
      },
    );
  }
}
