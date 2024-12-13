import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:flutter/material.dart';
import '../../../view model/responsive.dart';

class CombinetitleText extends StatelessWidget {
  const CombinetitleText({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              second,
              second,
            ]).createShader(bounds);
          },
          // child: const Responsive(
          //   desktop: ColredText(
          //     start: 30,
          //     end: 35,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   largeMobile: ColredText(
          //     start: 10,
          //     end: 20,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   mobile: ColredText(
          //     start: 10,
          //     end: 15,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          //   tablet: ColredText(
          //     start: 50,
          //     end: 40,
          //     text: 'الشبكة التعاونية للتسويق الالكتروني',
          //   ),
          // ),
          child: const Responsive(
            desktop: TextWithGradient(
              start: 20,
              end: 24,
              text: 'الشبكة التعاونية للتسويق الالكتروني ',
            ),
            largeMobile: TextWithGradient(
              start: 14,
              end: 16,
              text: 'الشبكة التعاونية للتسويق الالكتروني ',
            ),
            mobile: TextWithGradient(
              start: 14,
              end: 16,
              text: 'الشبكة التعاونية للتسويق الالكتروني ',
            ),
            tablet: TextWithGradient(
              start: 20,
              end: 22,
              text: 'الشبكة التعاونية للتسويق الالكتروني ',
            ),
          ),
        )
      ],
    );
  }
}
