import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool enabled; // Changed from bool? to bool with default value
  final TextInputAction textInputAction;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? lableText;

  CustomTextField({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.enabled = true, // Default value is true
    required this.textInputAction,
    this.enabledBorderColor = first,
    this.focusedBorderColor = second,
    this.inputFormatters,
    this.validator,
    this.lableText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: TextAlign.right,
      inputFormatters: inputFormatters,
      validator: validator,
      enabled: enabled, // Use the enabled property here
      decoration: InputDecoration(
        label: Text(lableText ?? hintText),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
