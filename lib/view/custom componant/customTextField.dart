import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final double start;
  final double end;

  const CustomTextField({
    super.key,
    required this.text,
    required this.start,
    required this.end,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), // Default duration
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: widget.start),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: second, width: widget.end),
        ),
      ),
      cursorColor: second,
    );
  }
}
