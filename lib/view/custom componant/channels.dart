// ignore_for_file: unused_import

import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPopupMenuButton {
  void showCustomPopupMenu(BuildContext context, Offset buttonPosition) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + 80,
        overlay.size.width - buttonPosition.dx,
        overlay.size.height - buttonPosition.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: '',
          child: Row(
            children: [
              Text(
                'تواصل معنا عبر الايميل',
                style: TextStyle(
                  color: const Color.fromARGB(255, 181, 56, 47),
                  fontSize: Responsive.isMobile(context) ? 15 : 20,
                ),
              ),
              const Icon(
                Icons.email_rounded,
                color: Color.fromARGB(255, 181, 56, 47),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'https://www.facebook.com/profile.php?id=61560262301387',
          child: Row(
            children: [
              Text(
                'تواصل معنا عبر الفيسبوك',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 126, 173),
                  fontSize: Responsive.isMobile(context) ? 15 : 20,
                ),
              ),
              const Icon(
                Icons.facebook,
                color: Color.fromARGB(255, 75, 126, 173),
              ),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        launchUrl(Uri.parse(value));
      }
    });
  }
}
