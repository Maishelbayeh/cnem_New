import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart'; // Make sure this path is correct

class CardInfo extends StatelessWidget {
  final String title;
  final String value;
  final Color? topColor;
  final bool isActive;
  final double height;
  final double width;
  final Function() onTap;

  const CardInfo({
    super.key,
    required this.title,
    required this.value,
    this.isActive = false,
    required this.onTap,
    this.topColor,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              color: topColor ?? active,
              width: 5,
              height: height,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: isActive ? active : lightGrey,
                          ),
                        ),
                        const TextSpan(
                          text: "\n",
                          style: TextStyle(fontSize: 10),
                        ),
                        TextSpan(
                          text: value,
                          style: TextStyle(
                            fontSize: 25,
                            color: isActive ? active : dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
