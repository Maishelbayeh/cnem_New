import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: size.height * 0.06,
                width: 2,
                margin:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
                decoration: BoxDecoration(
                    color: second,
                    borderRadius: BorderRadius.circular(defaultPadding)),
              ),

              Text(
                'استثمر اوقاتك وحولها الى دولارات',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: second, fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Container(
                height: size.height * 0.06,
                width: 2,
                margin:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
                decoration: BoxDecoration(
                    color: second,
                    borderRadius: BorderRadius.circular(defaultPadding)),
              ),
              //const SocialMediaIconColumn(),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
