import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  CustomSwitchListTile(
      {required this.title,
      required this.value,
      required this.onChanged,
      this.controller,
      this.inputFormatters,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(
              title,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            value: value,
            onChanged: onChanged,
          ),
          if (value && controller != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  hintText: 'أدخل القيمة',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
