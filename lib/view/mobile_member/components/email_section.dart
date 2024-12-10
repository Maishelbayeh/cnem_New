
import 'package:cenem/view/mobile_member/components/glassmorphism.dart';
import 'package:flutter/material.dart';
class EmailSection extends StatelessWidget {
  const EmailSection({
    super.key,
    required this.height,
    required this.width,
    required this.email,
  });

  final double height;
  final double width;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: (height / 5) * 0.1),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GlassMorphism(
              blur: 0,
              opacity: 0.2,
              child: SizedBox(
                height: 35,
                width: width * 0.7,
                child: Center(
                    child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
