import 'package:cenem/Api/reserpasscode.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/controllers/saveController.dart';
import 'package:cenem/controllers/sendemail_controller.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/bankcontroller.dart';
import 'package:cenem/controllers/confirmController.dart';
import 'package:cenem/controllers/resetPass.controller.dart';
import 'package:cenem/services/childrencount.dart';
import 'package:cenem/services/saveSub.dart';
import 'package:cenem/services/saveTable.dart';
import 'package:cenem/services/saveVar.dart';
import 'package:cenem/services/seveChildren.dart';
import 'package:cenem/services/usersave.dart';
import 'package:cenem/view/BasicApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/Api/config.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:get_storage/get_storage.dart';

final ChildrenService childrenService = ChildrenService();
late Config config;
final SubscriptionService subscriptionService = SubscriptionService();
final SubscriptionPaymentService subscriptionPaymentService =
    SubscriptionPaymentService();
UserService userService = UserService();
final EmailController emailController = Get.put(EmailController());
final PasswordResetApiService apiService = Get.put(PasswordResetApiService());
final AuthController auth = Get.put(AuthController());
final SecondSignFormController secondauth = Get.put(SecondSignFormController());
final StorageService storageService = StorageService();
final ClassificationService classificationService = ClassificationService();
String baseurl = '';
String apiKey = '';

@override
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init();
  // Load environment variables from a remote URL

  Get.put(SecondSignFormController());
  Get.put(AuthController());
  Get.put(EmailController());
  Get.put(PasswordResetController());
  Get.put(DialogNavigationController());
  Get.put(ConfirmEmailController());
  Get.put(PasswordResetApiService());
  Get.put(Bankcontroller());
  Get.put(MenuController());
  Get.put(NavigationController());

  ConfirmEmailController().resetFields();
  SecondSignFormController controller = Get.find<SecondSignFormController>();
  controller.clearForm();

  // Initialize other services and variables
  await initializeMem();
  await initializeChildrenList();
  await initializeSubscriptionPayment();
  await initializeUser();
  await initializeCounts();
  await initializeSubscription();

  html.querySelector('#email')?.text = user.email;
  runApp(const MyApp());
}
