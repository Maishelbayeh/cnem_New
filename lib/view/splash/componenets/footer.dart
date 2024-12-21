import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreativeFooter extends StatelessWidget {
  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color.fromRGBO(69, 30, 156, 1),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // If the screen width is less than 600, use a column layout for the footer
            if (constraints.maxWidth < 600) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Column: Email Link
                  GestureDetector(
                    onTap: () => launchUrl(Uri(
                        scheme: 'mailto', path: 'cnem.technichal@gmail.com')),
                    child: Tooltip(
                      message: "اضغط هنا لارسال ايميل", // Tooltip message
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'للتواصل عبر البريد',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cnem.technichal@gmail.com',
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border, color: Colors.white, size: 30),
                        Text(
                          'الشبكة التعاونية للتسويق الالكتروني --2024-- ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchURL(
                              'https://www.facebook.com/profile.php?id=61560262301387');
                        },
                        icon: const Icon(Icons.facebook),
                        color: Colors.white,
                        iconSize: 30,
                        tooltip:
                            'https://www.facebook.com/profile.php?id=61560262301387',
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURL("https://t.me/cnemonline");
                        },
                        icon: const Icon(Icons.telegram),
                        color: Colors.white,
                        iconSize: 30,
                        tooltip: "https://t.me/cnemonline",
                      ),
                    ],
                  ),
                ],
              );
            } else {
              // If the screen width is large, use the original Row layout
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Column: Email Link
                  GestureDetector(
                    onTap: () => launchUrl(Uri(
                        scheme: 'mailto', path: 'cnem.technichal@gmail.com')),
                    child: Tooltip(
                      message: "اضغط هنا لارسال ايميل ", // Tooltip message
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'للتواصل عبر البريد', // Arabic text for 'Contact us via email'
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cnem.technichal@gmail.com',
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Center: Creative Element (Logo or Design)
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'الشبكة التعاونية للتسويق الالكتروني --2024-- ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Right Column: Social Media Links
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchURL(
                              'https://www.facebook.com/profile.php?id=61560262301387');
                        },
                        icon: const Icon(Icons.facebook),
                        color: Colors.white,
                        iconSize: 35,
                        tooltip:
                            'https://www.facebook.com/profile.php?id=61560262301387',
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURL("https://t.me/cnemonline");
                          // Replace with Telegram URL
                        },
                        icon: const Icon(Icons.telegram),
                        color: Colors.white,
                        iconSize: 35,
                        tooltip: "https://t.me/cnemonline",
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
