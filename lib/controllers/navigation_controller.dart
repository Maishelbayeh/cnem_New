import 'package:cenem/model/member_model.dart';
import 'package:cenem/user/widgets/about.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigatorKey.currentState?.pop();
}

class DialogNavigationController extends GetxController {
  var currentPage = '/confirmEmail'.obs;
  List<String> routeHistory = [];

  void goToPage(String page) {
    routeHistory.add(currentPage.value);
    currentPage.value = page;
  }

  void goBack() {
    if (routeHistory.isNotEmpty) {
      currentPage.value = routeHistory.removeLast();
    }
  }
}

void navigateToAbout(BuildContext context, Member member) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const About(),
    ),
  );
}
