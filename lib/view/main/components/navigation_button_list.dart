import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/popUpmenue.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:cenem/view/video/components/video_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Responsive.isDesktop(context)) ...[
                // Image.asset(
                //   'assets/images/bank.png',
                // ),
                const SizedBox(
                  width: 200,
                ),
                NavigationTextButton(
                  onTap: (buttonPosition) {
                    Get.find<AuthController>().isSignUp.value = false;
                  },
                  text: "تسجيل الدخول",
                ),
                NavigationTextButton(
                  onTap: (buttonPosition) {
                    Get.find<AuthController>().isSignUp.value = true;
                    Get.find<DialogNavigationController>()
                        .currentPage('/signup');
                    showDialogBox(context);
                  },
                  text: "مشترك جديد",
                ),
              ],
              NavigationTextButton(
                onTap: (buttonPosition) {
                  List<MenuItem> menuItems = [
                    MenuItem(
                      label: "قنوات مجانية للمبتدئين",
                      url:
                          "https://youtube.com/@cnem.online?si=RgfXwxfYQ_q-SxkA",
                      icon: Icons.money_off,
                      color: second,
                    ),
                    MenuItem(
                      label: "قنوات تدريبيه مدفوعه",
                      url: "",
                      icon: Icons.attach_money_outlined,
                      color: second,
                    ),
                  ];

                  CustomPopupMenuButton customPopupMenuButton =
                      CustomPopupMenuButton(menuItems: menuItems);
                  customPopupMenuButton.showCustomPopupMenu(
                      context, buttonPosition, 220, 80);
                },
                text: 'القنوات التدريبية',
              ),
              NavigationTextButton(
                onTap: (buttonPosition) {
                  Get.toNamed('/Home/TeamPage');
                },
                text: 'من نحن',
              ),
              NavigationTextButton(
                onTap: (buttonPosition) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                text: 'فكرة الشبكه',
              ),
              NavigationTextButton(
                onTap: (buttonPosition) {
                  List<MenuItem> menuItems = [
                    MenuItem(
                      label: 'تواصل معنا عبر الفيسبوك',
                      url:
                          'https://www.facebook.com/profile.php?id=61560262301387',
                      icon: Icons.facebook,
                      color: const Color.fromARGB(255, 75, 126, 173),
                    ),
                  ];

                  CustomPopupMenuButton customPopupMenuButton =
                      CustomPopupMenuButton(menuItems: menuItems);
                  customPopupMenuButton.showCustomPopupMenu(
                      context, buttonPosition, 220, 80);
                },
                text: 'اتصل بنا',
              ),
            ],
          ),
        );
      },
    );
  }
}
