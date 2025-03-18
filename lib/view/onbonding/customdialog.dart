import 'package:cenem/view/onbonding/authentication/web/confirmsms.dart';
import 'package:cenem/view/onbonding/authentication/web/newpasscodedialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/view/onbonding/payment/recurenccypayment_html.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/user/pages/users/settings.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/authentication/term_condition_form.dart';
import 'package:cenem/view/onbonding/authentication/web/bank_info_dialog.dart';
import 'package:cenem/view/onbonding/authentication/web/second_sign_up_dialog.dart';
import 'package:cenem/view/onbonding/authentication/web/confirmEmailDialog.dart';
import 'package:cenem/view/onbonding/authentication/web/ResettPassDialog.dart';
import 'package:cenem/view/onbonding/authentication/web/authentecation_dialog.dart';
import 'package:cenem/view/onbonding/sendemail.dart';

void dialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible:
        false, // Prevents closing the dialog when pressing outside
    barrierColor: Colors.black.withOpacity(0.3),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Responsive(
        desktop: _buildDialog(context, 0.8, 0.8),
        largeMobile: _buildDialog(context, 0.9, .9),
        mobile: _buildDialog(context, 0.9, .9),
        tablet: _buildDialog(context, 0.8, .8),
        extraLargeScreen: _buildDialog(context, 0.7, .8),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(CurvedAnimation(parent: anim, curve: Curves.easeInOut)),
        child: child,
      );
    },
  ).then(onValue);
}

Widget _buildDialog(
    BuildContext context, double widthFactor, double heightFactor) {
  final Size screenSize = MediaQuery.of(context).size;
  double dialogWidth = screenSize.width * widthFactor;
  double dialogHeight = screenSize.height * heightFactor;
  Get.find();

  return Center(
    child: Container(
      width: dialogWidth,
      height: dialogHeight,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: first,
            offset: Offset(-2, 0),
            blurRadius: 20,
          ),
          BoxShadow(
            color: second,
            offset: Offset(2, 0),
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(
        children: [
          Obx(() {
            final controller = Get.find<DialogNavigationController>();
            String currentRoute = controller.currentPage.value;

            switch (currentRoute) {
              case '/SignIn':
                return Signin(true, dialogWidth, dialogHeight);

              case '/signup':
                return Signin(false, dialogWidth, dialogHeight);
              case '/NewPass':
                return const NewPass();
              case '/Addmember':
                return DialogContent();
              case '/confirmEmail':
                return ConfirmEmailDialog();
              case '/Confirm condition':
                return const TermsAndConditionsPage();
              case '/newpasscode':
                return ForgotPasswordDialog();
              case '/settings':
                return const settings();
              case '/payment':
                return Iframe();
              case '/receipt':
                return BankInfoDialog();
              case '/sendEmail':
                return EmailPopup();
              case '/confirmSms':
                return ConfirmsmsDialog();

              default:
                return const Center(child: Text("Unknown Route"));
            }
          }),
          // Center(
          //   child: Obx(() {
          //     if (myController.isShowLoading.value && !isb)
          //       return const CustomPositioned(
          //         child: RiveAnimation.asset(
          //           'assets/images/check.riv',
          //           fit: BoxFit.cover,
          //           onInit: onCheckRiveInit,
          //         ),
          //       );
          //     if (myController.isShowConfetti.value)
          //       return const CustomPositioned(
          //         scale: 6,
          //         child: RiveAnimation.asset(
          //           "assets/images/confetti.riv",
          //           onInit: onConfettiRiveInit,
          //           fit: BoxFit.cover,
          //         ),
          //       );
          //     return const SizedBox.shrink();
          //   }),
          // ),
        ],
      ),
    ),
  );
}

void showDialogBox(BuildContext context) {
  dialog(context, onValue: (value) {
    //print('Dialog returned: $value');
    if (value == 'success') {
      // Navigate or perform other actions
    }
  });
}
