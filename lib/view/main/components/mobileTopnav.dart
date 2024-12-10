import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';

import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';

class MobileTopNavigationBar extends StatelessWidget {
  const MobileTopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isExtraLargeScreen(context) ||
              Responsive.isDesktop(context) ||
              !Responsive.isTablet(context))
            const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: CustomIconRow()),

          SizedBox(
            width: !Responsive.isDesktop(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : 150,
          ),
          //const Spacer(),
        ],
      ),
    );
  }
}
    // if (Responsive.isLargeMobile(context)) MenuButton(),
          // const Spacer(
          //   flex: 2,
          // ),
          // if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
          // const Spacer(
          //   flex: 2,
          // ),