import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final double height;
  final double width;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.height = 60.0,
    this.width = 100.0,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(69, 30, 156, 1), // Correct color syntax
            borderRadius: BorderRadius.circular(10), // Correct border radius
          ),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
