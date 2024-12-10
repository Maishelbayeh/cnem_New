import 'package:flutter/material.dart';

import '../../res/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap});
  final Icon icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 0.4),
          child: icon),
    );
  }
}
