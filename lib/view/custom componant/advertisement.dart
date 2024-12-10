// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({super.key});

  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the dialog on tap
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/adv.jpeg'), // Replace with your image path
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showImageDialog(); // Call _showImageDialog on tap
      },
      child: Container(
        height:
            MediaQuery.of(context).size.height * .1, // Specify a finite height
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
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
                    fontSize: MediaQuery.of(context).size.width *
                        0.012, // Adjust the multiplier as needed
                    fontWeight: FontWeight.bold,
                    color: second,
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  blankSpace: 20.0,
                  velocity: 50.0,
                  pauseAfterRound: const Duration(milliseconds: 0),
                  startPadding: 6,
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
