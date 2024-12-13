import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/main/components/navigation_button_list.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:get/get.dart';
import '../../../res/constants.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isMobile(context) &&
                  !Responsive.isLargeMobile(context)) ...[
                const SizedBox(
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: NavigationButtonList(),
                ),
                const Spacer(),
                Transform.scale(
                  scaleX: screenWidth * .0003,
                  scaleY: screenWidth * .0003,
                  child: Image.asset(
                    "assets/images/cnem.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const Spacer(),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Responsive.isTablet(context) &&
                      !Responsive.isDesktop(context)) ...[
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width * 0.4
                          : 150,
                      child: CustomButton(
                        onTap: () {
                          Get.toNamed('/Home/SignIn');
                        },
                        buttonText: 'تسجيل دخول',
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width * 0.4
                          : 150,
                      child: CustomButton(
                        onTap: () {
                          Get.toNamed('/Home/RegisterForm');
                        },
                        buttonText: 'انشاء حساب',
                      ),
                    ),
                  ],
                ],
              )
            ]));
  }
}
