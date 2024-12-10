import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimeFormField extends StatelessWidget {
  final DateFormat dateFormat;
  final DateTime firstDate;
  final DateTime lastDate;
  final FormFieldValidator<DateTime>? validator;
  final ValueChanged<DateTime?> onChanged;
  final TextEditingController controller;

  CustomDateTimeFormField({
    required this.dateFormat,
    required this.firstDate,
    required this.lastDate,
    this.validator,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        labelText: 'تاريخ الميلاد',
        hintText: 'ادخل تاريخ ميلادك',
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: first),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: second),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (validator != null) {
          DateTime? date = value != null && value.isNotEmpty
              ? dateFormat.parse(value)
              : null;
          return validator!(date);
        }
        return null;
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
          locale: const Locale('ar', ''), // Arabic localization
        );
        if (pickedDate != null) {
          controller.text = dateFormat.format(pickedDate);
          onChanged(pickedDate);
        }
      },
    );
  }
}
