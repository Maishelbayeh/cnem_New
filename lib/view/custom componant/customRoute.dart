// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;

  SlidePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const Offset begin = Offset(0, -1); // Slide from top to bottom
            const Offset end = Offset.zero;
            final Tween<Offset> tween = Tween(begin: begin, end: end);
            final Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class CustomSlideTransition extends PageRouteBuilder {
  final Widget page;

  CustomSlideTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const Offset begin = Offset(0, -1); // Slide from top to bottom
            const Offset end = Offset.zero;
            final Tween<Offset> tween = Tween(begin: begin, end: end);
            final Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
