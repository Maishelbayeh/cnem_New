import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon icon;
  final String label;
  final Color textColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Size minimumSize;

  CustomElevatedButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.textColor = Colors.white,
    this.borderColor = Colors.blue,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.minimumSize = const Size(150, 50),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        textAlign: TextAlign.right,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        minimumSize: minimumSize,
      ),
    );
  }
}
