import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
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
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: second,
                wordSpacing: 2,
                fontSize: value,
                fontWeight: FontWeight.bold,

                // Animating font size from start to end
              ),
        );
      },
    );
  }
}
