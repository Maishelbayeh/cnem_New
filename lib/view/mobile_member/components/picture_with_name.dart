import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class PictureWithName extends StatelessWidget {
  const PictureWithName({
    super.key,
    required this.name,
    required this.imagePath,
  });

  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
            image: const DecorationImage(
              image: AssetImage("../assets/images/woman.png"),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            color: light,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
