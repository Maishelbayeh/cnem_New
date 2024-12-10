import 'package:flutter/material.dart';
import 'package:cenem/view/custom%20componant/social_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIconColumn extends StatelessWidget {
  const CustomIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIcon(
          icon: const Icon(
            FontAwesomeIcons.whatsapp,
            color: Color.fromARGB(255, 5, 137, 73),
            size: 30,
          ),
          onTap: () => launchUrl(Uri.parse(
              'https://whatsapp.com/channel/0029VaawoizIHphDlzrBWX1I')),
        ),
        const SizedBox(width: 16), // Add space between icons
        CustomIcon(
          icon: const Icon(
            FontAwesomeIcons.telegram,
            color: Color.fromARGB(255, 105, 175, 240),
            size: 30,
          ),
          onTap: () => launchUrl(Uri.parse('https://t.me/+dcwDj7c6bYcyOTNk')),
        ),
      ],
    );
  }
}
