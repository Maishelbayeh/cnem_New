import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/social_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIconRow extends StatelessWidget {
  const CustomIconRow({Key? key}) : super(key: key);

  Widget buildButton(
      BuildContext context, IconData iconData, Color iconColor, String url) {
    return ElevatedButton.icon(
      icon: CustomIcon(
        icon: Icon(
          iconData,
          color: iconColor,
          size: Responsive.isMobile(context) ? 25 : 30,
        ),
      ),
      label: Text(
        'تواصل معنا عبر',
        style: TextStyle(
            color: Color.fromARGB(255, 5, 137, 73),
            fontSize: Responsive.isMobile(context) ? 10 : 20),
      ),
      onPressed: () => launchUrl(Uri.parse(url)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget buildSizedBox(
      BuildContext context, Widget child, double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: SizedBox(
        height: height,
        width: 350,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        Responsive.isDesktop(context) || Responsive.isExtraLargeScreen(context)
            ? 150
            : 40;
    double buttonWidth =
        Responsive.isDesktop(context) || Responsive.isExtraLargeScreen(context)
            ? MediaQuery.sizeOf(context).width / 4
            : MediaQuery.sizeOf(context).width * 0.41;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSizedBox(
          context,
          buildButton(
              context,
              FontAwesomeIcons.whatsapp,
              Color.fromARGB(255, 5, 137, 73),
              'https://whatsapp.com/channel/0029VaawoizIHphDlzrBWX1I'),
          buttonHeight,
          buttonWidth,
        ),
        const SizedBox(width: 20),
        buildSizedBox(
            context,
            buildButton(
                context,
                FontAwesomeIcons.telegram,
                Color.fromARGB(255, 105, 175, 240),
                'https://t.me/+dcwDj7c6bYcyOTNk'),
            buttonHeight,
            buttonWidth),
      ],
    );
  }
}
