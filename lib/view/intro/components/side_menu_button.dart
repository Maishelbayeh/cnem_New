import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../res/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuButton({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 55,
        width: 55,
        //   padding: const EdgeInsets.all(defaultPadding / 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              first,
              second,
            ],
          ),
          boxShadow: const [
            BoxShadow(color: first, blurRadius: 10, offset: Offset(0, 2)),
            BoxShadow(color: second, blurRadius: 10, offset: Offset(0, -2)),
          ],
        ),
        child: Container(
          // Wrap with another container for white background
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor, // White background color
          ),
          padding: const EdgeInsets.all(3), // Adjust padding if needed
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Transform.rotate(
              angle: 0.1,
              child: const Icon(
                FontAwesomeIcons.user,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
