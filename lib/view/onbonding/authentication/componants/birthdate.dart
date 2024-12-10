import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/onbonding/authentication/mobile/second_sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void openDatePicker(
    BuildContext context, void Function(DateTime) onDateSelected) {
  BottomPicker.date(
    displayCloseIcon: false,
    pickerTitle: const Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        "اختر تاريخ الميلاد",
        style: TextStyle(
          color: second,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
    dateOrder: DatePickerDateOrder.dmy,
    pickerTextStyle: const TextStyle(
      color: second,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    onChange: (selectedDate) {
      //print(selectedDate);
      onDateSelected(selectedDate); // Pass selected date to the callback
    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);
}
