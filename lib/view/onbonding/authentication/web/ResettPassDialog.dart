import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/main.dart';
import 'package:cenem/view/onbonding/authentication/componants/customPosition.dart';
import 'package:cenem/view/onbonding/authentication/componants/newpassText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:cenem/controllers/resetPass.controller.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view%20model/responsive.dart';

class NewPass extends StatefulWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  _NewPassState createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final PasswordResetController _passwordResetController =
      Get.put(PasswordResetController());

  @override
  void dispose() {
    _passwordResetController.dispose();
    super.dispose();
  }

  bool validatePassword(String password) {
    // At least 1 uppercase, 1 digit, 1 special character, and 8+ characters
    final regex =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');
    return regex.hasMatch(password);
  }

  Future<void> _handlePasswordReset() async {
    final password = _passwordResetController.passwordController.text.trim();
    final confirmPassword =
        _passwordResetController.confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      Get.snackbar('خطأ', 'كلمتا المرور غير متطابقتين.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!validatePassword(password)) {
      Get.snackbar('خطأ',
          'كلمة المرور يجب أن تحتوي على حرف كبير، رقم، وحرف خاص وتكون 8 أحرف على الأقل.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    bool success = await _passwordResetController.resetPassword(
        Get.find<ConfirmEmailController>().otpCode.value,
        Get.find<AuthController>().emailsignController.text);

    if (success) {
      Get.back(); // Close the dialog
      Get.snackbar('نجاح', "تم تغيير كلمه السر بنجاح",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('خطأ', 'حدث خطأ أثناء اعاده تعيين كلمه المرور.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(children: [
          Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "اعـادة تعيين كلمة المرور",
                style: TextStyle(fontSize: 18, color: second),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.find<DialogNavigationController>()
                      .currentPage('/newpasscode');
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              backgroundColor: bgColor,
              elevation: 0,
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: Responsive(
                    desktop: _buildDialogContent(constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.8),
                    largeMobile: _buildDialogContent(constraints.maxWidth * 0.8,
                        constraints.maxHeight * 0.8),
                    extraLargeScreen: _buildDialogContent(
                        constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.8),
                    mobile: _buildDialogContent(constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.8),
                    tablet: _buildDialogContent(constraints.maxWidth * 0.7,
                        constraints.maxHeight * 0.8),
                  ),
                );
              },
            ),
          ),
          auth.isShowLoading.value
              ? CustomPositioned(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: second,
                    size: 100,
                  ),
                )
              : const SizedBox(),
        ]));
  }

  Widget _buildDialogContent(double width, double height) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lock_clock_outlined,
                    size: height * 0.45,
                    color: second,
                  ),
                  SizedBox(height: height * 0.02),
                  PasswordField(
                    controller: _passwordResetController.passwordController,
                    hintText: 'كلمة المرور',
                    prefixIconPath: "assets/icons/password.svg",
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "كلمة المرور يجب أن تحتوي على حرف كبير، رقم، وحرف خاص وتكون 8 أحرف على الأقل.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right, // Align text to the right (RTL)
                  ),
                  SizedBox(height: height * 0.02),
                  PasswordField(
                    controller:
                        _passwordResetController.confirmPasswordController,
                    hintText: 'تأكيد كلمة المرور',
                    prefixIconPath: "assets/icons/password.svg",
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "يرجى تأكيد كلمة المرور بحيث تكون متطابقة مع كلمة المرور الجديدة.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right, // Align text to the right (RTL)
                  ),
                  SizedBox(height: height * 0.02),
                  CustomButton(
                    buttonText: _passwordResetController.isLoading.isTrue
                        ? 'جارٍ التحميل...'
                        : 'تغيير كلمة السر',
                    width: width * 0.7,
                    onTap: _handlePasswordReset,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
