import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/user/pages/PaymentMoveTable.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/customtext.dart';
import 'package:cenem/view/mobile_member/pages/informations.dart';
import 'package:cenem/view/mobile_member/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view/onbonding/customdialog.dart';
import 'package:cenem/view/onbonding/payment/payment.dart';
import 'package:get/get.dart';

final authController = Get.find<AuthController>();
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * .1,
      title: LayoutBuilder(
        builder: (context, constraints) {
          double iconSize = constraints.maxWidth > 800 ? 30 : 30;
          double spacing = constraints.maxWidth > 800 ? 16 : 8;
          return Row(
            children: [
              SizedBox(width: spacing),
              // Logout Button
              buildTooltipButton(
                context,
                message: "تسجيل الخروج",
                icon: Icons.door_front_door,
                onTap: () {
                  countOrange = 0;
                  countGreen = 0;
                  countRed = 0;
                  countBlack = 0;
                  countBlue = 0;
                  responseJsonchildren = [];
                  isSuperAdmin = false;
                  ismember = false;
                  email = '';
                  phone = '';
                  authtoken = '';
                  money = 20;
                  storageService.clearAll();
                  secondauth.clearForm();

                  // Navigate to Home and clear fields
                  Get.offAllNamed('/Home');
                  authController.emailController.text = "";
                  authController.passController.text = "";
                },
                iconSize: iconSize,
              ),
              SizedBox(width: spacing),
              // Settings Button
              buildTooltipButton(
                context,
                message: "تعديل المعلومات",
                icon: Icons.settings,
                onTap: () {
                  if (!Responsive.isLargeMobile(context)) {
                    Get.find<DialogNavigationController>()
                        .currentPage('/settings');
                    showDialogBox(context);
                  }
                  if (Responsive.isLargeMobile(context)) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  }
                },
                iconSize: iconSize,
              ),
              SizedBox(width: spacing),
              // User Profile Button
              buildTooltipButton(
                context,
                message: "المعلومات الشخصية",
                icon: Icons.person_outline,
                onTap: () {
                  if (!Responsive.isLargeMobile(context)) {
                    if (Get.currentRoute != '/User') {
                      Get.toNamed('/User');
                    } else {
                      print("Already on '/User' page");
                    }
                    visibleTree.value = !visibleTree.value;
                  }
                  if (Responsive.isLargeMobile(context)) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Info(),
                      ),
                    );
                  }
                },
                iconSize: iconSize,
              ),
              SizedBox(width: spacing),
              // Payment History Button
              buildTooltipButton(
                context,
                message: "سجل المدفوعات",
                icon: Icons.money_outlined,
                onTap: () {
                  if (!Responsive.isLargeMobile(context)) {
                    Get.toNamed('/User/pymentHistory');
                  }
                  if (Responsive.isLargeMobile(context)) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PaymentTable(),
                      ),
                    );
                  }
                },
                iconSize: iconSize,
              ),
              SizedBox(width: spacing),

              /// حركة دفعة
              buildTooltipButton(
                context,
                message: "حركة دفعة ",
                icon: Icons.attach_money,
                onTap: () {
                  Get.toNamed("/Home");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ProfessionalDialog(
                        onConfirm: () {
                          print("تم تأكيد الدفع");
                          Navigator.of(context).pop();
                        },
                        onCancel: () {
                          print("تم إلغاء الدفع");
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
                iconSize: iconSize,
              ),
              SizedBox(width: spacing),
              // Member Name
              CustomText(
                text: mem.memberName,
                size: constraints.maxWidth > 800 ? 18 : 14,
              ),
              const Spacer(),
              Container(
                width: constraints.maxWidth > 800 ? 2 : 1,
                color: second,
                height: 1,
              ),
            ],
          );
        },
      ),
      iconTheme: const IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: bgColor,
    );

// Helper function to build reusable Tooltip Button
Widget buildTooltipButton(
  BuildContext context, {
  required String message,
  required IconData icon,
  required VoidCallback onTap,
  required double iconSize,
}) {
  return Tooltip(
    message: message,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: second.withOpacity(.4),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(
            icon,
            color: second,
            size: iconSize,
          ),
        ),
      ),
    ),
  );
}
