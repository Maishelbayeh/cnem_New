import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'package:intl/intl.dart'; // Import the intl package

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat('yyyy-MM-dd').format('2004-12-03' as DateTime);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: defaultPadding / 2,
        ),
        //  AreaInfoText(title: 'تاريخ الانضمام', text: formattedDate),
        // AreaInfoText(
        //     title: 'رقم الهاتف', text: memberInfo.phonenumber.toString()),
        // AreaInfoText(title: 'الايميل', text: memberInfo.email.toString()),
        // AreaInfoText(title: 'LinkedIn', text: '@hamad-anwar'),
        // AreaInfoText(title: 'Github', text: '@hamad-anwar'),
        SizedBox(
          height: defaultPadding,
        ),

        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
