import 'package:cenem/view/intro/components/headline.dart';
import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'description_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height,
              ),
            const CombinetitleText(),
            if (!Responsive.isDesktop(context))
              const SizedBox(
                height: 5,
              ),
            //const CombineSubtitleText(),
            const SizedBox(height: defaultPadding * 2),
            const Column(children: [
              AnimatedDescriptionText(
                  start: 15,
                  end: 22,
                  text: "كن شريكا في النجاح مع اول منصة عربيه"),
              SizedBox(
                height: defaultPadding * 2,
              ),
            ]),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AnimatedDescriptionText(
                        start: 15, end: 17, text: " للباحثين عن العمل "),
                  ],
                ),
                SizedBox(
                  height: defaultPadding * 2,
                  width: defaultPadding * 2,
                ),
                Row(
                  children: [
                    AnimatedDescriptionText(
                        start: 15, end: 17, text: "للباحثين عن عمل اضافي  "),
                    SizedBox(
                      height: defaultPadding * 2,
                      width: defaultPadding * 2,
                    ),
                    AnimatedDescriptionText(
                        start: 15, end: 17, text: "للمتعلمين و غير المتعلمين "),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ],
    );
  }
}
