import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final Function(Offset) onTap;
  final String text;
  final double? size;
  final Color? color;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // Ensuring consistent padding
      alignment: Alignment.center, // Ensuring consistent alignment
      child: TextButton(
        onPressed: () {
          final RenderBox buttonBox = context.findRenderObject() as RenderBox;
          final Offset buttonPosition = buttonBox.localToGlobal(Offset.zero);
          onTap(buttonPosition);
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(69, 30, 156, 1),
                fontSize: size ?? 14,
              ),
        ),
      ),
    );
  }
}
