import 'package:cenem/main.dart';
import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/model/paymentModel.dart';
import 'package:cenem/model/paymentTable.dart';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/services/childrencount.dart';
import 'package:cenem/services/countsave.dart';
import 'package:cenem/services/saveMember.dart';
import 'package:cenem/user/pages/users/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initializeMem() async {
  MemberService memberService = MemberService();
  Member? loadedMember = await memberService.loadMember();
  if (loadedMember != null) {
    mem = loadedMember;
  }
}

Future<void> initializeChildrenList() async {
  List<Children>? loadedChildrenList = childrenService.loadChildrenList();
  responseJsonchildren = loadedChildrenList;
}

Future<void> initializeSubscription() async {
  Subscription? loadedSubscription = subscriptionService.loadSubscription();
  if (loadedSubscription != null) {
    sub = loadedSubscription;
  }
}

void loadSavedEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedEmail = prefs.getString('saved_email');
  if (savedEmail != null) {
    authController.emailsignController.text = savedEmail;
    authController.toggleRememberMe(true);
  }
}

Future<void> initializeSubscriptionPayment() async {
  List<SubscriptionPayment>? loadedSubscriptionPayments =
      subscriptionPaymentService.loadSubscriptionPayments();
  if (loadedSubscriptionPayments != null) {
    subscriptionPayment = loadedSubscriptionPayments;
  }
}

Future<void> initializeUser() async {
  User? loadedUser = userService.loadUser();
  if (loadedUser != null) {
    Loadduser = loadedUser;
  }
}

Future<void> initializeClassificationCounts() async {
  final ClassificationService classificationService = ClassificationService();
  Map<String, int>? loadedCounts =
      classificationService.loadClassificationCounts();

  if (loadedCounts != null) {
    classificationCounts = loadedCounts;
  } else {
    // If no data is available, initialize with default values
    classificationCounts = {
      'منتسب': 0,
      'عضو ملتزم': 0,
      'عضو موقوف': 0,
      'عضو مفصول': 0,
    };
  }
}

Map<String, int> classificationCounts = {
  'منتسب': 0,
  'عضو ملتزم': 0,
  'عضو موقوف': 0,
  'عضو مفصول': 0,
};

Future<void> initializeCounts() async {
  final CountService countService = CountService();
  final counts = countService.loadCounts();

  if (counts != null) {
    countOrange = counts['countOrange'] ?? 0;
    countGreen = counts['countGreen'] ?? 0;
    countRed = counts['countRed'] ?? 0;
    countBlack = counts['countBlack'] ?? 0;
    countBlue = counts['countBlue'] ?? 0;
  } else {
    // Initialize with default values if no saved data
    countOrange = 0;
    countGreen = 0;
    countRed = 0;
    countBlack = 0;
    countBlue = 0;
  }
}
