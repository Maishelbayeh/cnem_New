// ignore_for_file: library_private_types_in_public_api

import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AddScreenMobile extends StatefulWidget {
  const AddScreenMobile({super.key});

  @override
  _AdsScreenMobileState createState() => _AdsScreenMobileState();
}

class _AdsScreenMobileState extends State<AddScreenMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showImageDialog() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Image",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/adv.jpeg'), // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImageDialog,
      child: Container(
        height: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.height * .08
            : MediaQuery.of(context).size.height *
                .06, // Specify a finite height
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: second,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: <Color>[first, second],
                  ).createShader(bounds);
                },
                child: Marquee(
                  text: 'اربح معنا رحلة مجانية لمزيد من التفاصيل اضغط هنا',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.3 * 0.07,
                    fontWeight: FontWeight.bold,
                    color: second,
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  blankSpace: 20.0,
                  velocity: 50.0,
                  pauseAfterRound: const Duration(milliseconds: 0),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                  fadingEdgeStartFraction: 0.1,
                  fadingEdgeEndFraction: 0.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
