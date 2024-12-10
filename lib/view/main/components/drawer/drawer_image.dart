import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../../res/constants.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      padding: const EdgeInsets.all(defaultPadding / 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.blue.shade900,
          ],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.pink, blurRadius: 10, offset: Offset(0, 2)),
          BoxShadow(color: Colors.blue, blurRadius: 10, offset: Offset(0, -2)),
        ],
      ),
      child: Container(
        // Wrap with another container for white background
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // White background color
        ),
        padding: const EdgeInsets.all(3), // Adjust padding if needed
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Transform.rotate(
            angle: 0.1,
            child: Icon(
              FontAwesomeIcons.user,
            ),
          ),
        ),
      ),
    );
  }
}
