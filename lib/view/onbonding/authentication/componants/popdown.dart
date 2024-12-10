import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final BorderRadius borderRadius;

  CustomDropdownFormField({
    required this.hint,
    required this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.enabledBorderColor = first, // Default from constants.dart
    this.focusedBorderColor = second, // Default from constants.dart
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Align(
        alignment: Alignment.centerRight, // Align the hint text to the right
        child: Text(hint),
      ),
      value: value,
      borderRadius: borderRadius,
      items: items
          .map((label) => DropdownMenuItem<String>(
                value: label,
                child: Align(
                  alignment: Alignment.centerRight, // Align text to the right
                  child: Text(label),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: borderRadius,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.arrow_drop_down),
      ),
      iconSize: 24,
      iconEnabledColor:
          focusedBorderColor, // Adjusted the icon color to match focused border
    );
  }
}
