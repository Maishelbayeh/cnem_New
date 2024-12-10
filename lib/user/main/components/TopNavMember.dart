import 'package:cenem/res/constants.dart';

import 'package:cenem/view/custom%20componant/gradiantText.dart';

import 'package:cenem/view/intro/components/side_menu_button.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';

import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';

class TopNavigationBarMember extends StatelessWidget {
  const TopNavigationBarMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: !Responsive.isLargeMobile(context)
                  ? const CustomIconRow()
                  : const CustomIconRow()),
          //if (Responsive.isLargeMobile(context)) MenuButton(),
          const Spacer(
            flex: 2,
          ),

          const Spacer(
            flex: 2,
          ),
          // CustomButton(
          //   onTap: () {},
          //   buttonText: 'تسجيل الخروج',
          // ),
          const Spacer(),
          const TextWithGradient(start: 20, end: 25, text: "member.memberName"),
          const SizedBox(width: 20),
          MenuButton(onTap: () => Scaffold.of(context).openEndDrawer()),

          const Spacer(),
        ],
      ),
    );
  }
}
