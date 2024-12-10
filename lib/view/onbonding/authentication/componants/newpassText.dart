import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefixIconPath;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const PasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIconPath,
    this.obscureText = true,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Theme.of(context).colorScheme.secondary,
        validator: widget.validator,
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                widget.prefixIconPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: first),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: second),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
