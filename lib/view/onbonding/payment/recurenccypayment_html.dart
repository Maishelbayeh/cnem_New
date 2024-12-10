import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:cenem/Api/config.dart';
import 'package:cenem/Api/loginApi.dart';
import 'package:cenem/main.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/controllers/Membercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late Config config;

final SecondSignFormController authController =
    Get.put(SecondSignFormController());

class Iframe extends StatelessWidget {
  Iframe({super.key}) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();

      // Define your dynamic variables here

      // Create query parameters from variables
      String queryParams =
          '&authToken=${Uri.encodeComponent(user.authToken ?? authtoken)}';

      iframe.src = 'assets/assets/html/home.html?$queryParams';
      //print("hello");
      iframe.style.border = 'none';
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: 400,
      height: 120,
      child: HtmlElementView(viewType: 'iframe'),
    );
  }
}
