import 'package:cenem/res/constants.dart';
import 'package:cenem/user/helpers/reponsiveness.dart';
import 'package:cenem/user/pages/overview/widgets/channels.dart';
import 'package:cenem/user/pages/overview/widgets/overview_cards_large.dart';
import 'package:cenem/user/pages/overview/widgets/overview_cards_medium.dart';
import 'package:cenem/user/pages/overview/widgets/revenue_section_large.dart';
import 'package:cenem/user/pages/overview/widgets/sennemail.dart';
import 'package:cenem/view/custom%20componant/advertisement.dart'; // Ensure the correct path
import 'package:cenem/view/onbonding/sendemail.dart';
import 'package:cenem/view/splash/componenets/footer.dart';

import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  OverviewCardsLargeScreen(),
                  RevenueSectionLarge(),
                  ChannelSectionLarge(),
                  SendEmailSectionLarge(),
                  AdScreen(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
