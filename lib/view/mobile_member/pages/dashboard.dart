import 'package:cenem/res/constants.dart';
import 'package:cenem/user/pages/overview/widgets/channels.dart';
import 'package:cenem/user/pages/overview/widgets/mobileRev.dart';
import 'package:cenem/user/pages/overview/widgets/sennemail.dart';
import 'package:cenem/view/custom%20componant/Addvertismentmobile.dart';
import 'package:cenem/view/mobile_member/widget/dashboard_bottom_section.dart';
import 'package:cenem/view/splash/componenets/footer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        color: bgColor, // Set background color to gray
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight, // Allow scrolling by not constraining height
            child: ListView(
              shrinkWrap: true, // Ensures ListView doesn't try to expand
              children: [
                // Background white top section
                const SizedBox(
                  child: mobilerev(),
                ),
                // Revenue Section
                SizedBox(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                          padding: const EdgeInsets.all(16),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 6),
                                // ignore: deprecated_member_use
                                color: Colors.grey.withOpacity(.1),
                                blurRadius: 12,
                              ),
                            ],
                            border: Border.all(color: Colors.grey, width: .5),
                          ),
                          child: const DashboardBottomSection());
                    },
                  ),
                ),
                const SizedBox(
                  child: ChannelSectionLarge(),
                ),
                const SizedBox(
                  child: SendEmailSectionLarge(),
                ),
                const SizedBox(
                  child: AddScreenMobile(),
                ),
                SizedBox(
                  height: screenHeight * .055,
                ),
                SizedBox(
                  child: CreativeFooter(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
