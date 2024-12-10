import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../res/constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText(String status,
      {super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          TextWithGradient(start: 10, end: 12, text: title)
        ],
      ),
    );
  }
}
