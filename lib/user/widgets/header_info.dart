import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';
import '../../../../res/constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText(
      {super.key, required this.title, required this.text, size, this.fsize});
  final String title;
  final String text;
  final double? fsize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWithGradient(start: 10, end: 13, text: title),
          Text(
            text,
            style: TextStyle(
                color: second,
                fontSize: fsize ?? 12,
                fontWeight: FontWeight.w600),
          ),
          
        ],
      ),
    );
  }
}
