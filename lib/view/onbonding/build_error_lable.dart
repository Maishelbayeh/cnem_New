import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget buildErrorText(String errorText) {
  return Obx(
    () => Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            errorText.isNotEmpty ? errorText : '',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
