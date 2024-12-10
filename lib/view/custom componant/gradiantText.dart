import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class TextWithGradient extends StatelessWidget {
  const TextWithGradient({
    super.key,
    required this.start,
    required this.end,
    required this.text,
  });

  final double start;
  final double end;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      // Use Tween<double> instead of Tween(begin: start, end: end)
      tween: Tween<double>(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        // Adjust LinearGradient to match your intended gradient colors
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              // Adjust colors and positions as needed
              colors: [
                second, // Replace with your 'first' color
                first, // Replace with your 'second' color
              ],
              stops: [0.0, 1.0],
            ).createShader(bounds);
          },
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: value, // Use the animated value for fontSize
                  color: Colors.white, // Simplified color setting
                ),
          ),
        );
      },
    );
  }
}
