import 'package:cenem/view/custom%20componant/customtext.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CustomText(
              text: title,
              color: const Color(0xFFF8BB7C),
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomText(
              text: value,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
