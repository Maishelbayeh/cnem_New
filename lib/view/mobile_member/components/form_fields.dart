import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

Widget buildTextFormField({
  required String label,
  required double width,
  bool isEmail = false,
  bool isCentered = false,

}) {
  return SizedBox(
    width: width,
    height: 40,
    child: TextFormField(
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.name,
      enabled: false,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        label: Align(
          alignment: isCentered ? Alignment.center : Alignment.centerRight,
          child: Text(label),
        ),
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
    ),
  );
}

Widget buildDropdownFormField({
  required String hint,
  required String value,
  required List<String> items,
  required double width,

}) {
  return SizedBox(
    width: width,
    child: DropdownButtonFormField<String>(
      hint: Align(
        alignment: Alignment.centerRight,
        child: Text(hint),
      ),
      value: value,
      isExpanded: true,
      borderRadius: BorderRadius.circular(15),
      items: items
          .map((label) => DropdownMenuItem(
                value: label,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    label,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ))
          .toList(),
      onChanged: null,
      decoration: InputDecoration(
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
    ),
  );
}
