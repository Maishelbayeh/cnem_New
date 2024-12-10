import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/mobile_member/components/nav_bar.dart';
import 'package:cenem/view/mobile_member/components/top_card.dart';
import 'package:cenem/view/mobile_member/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTopSection extends StatelessWidget {
  const DashboardTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 36, 76, 112),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                // top: 15.0,
                right: 10.0,
                // left: 10.0,
              ),
              child: Column(
                children: [
                  NavBar(
                    imagePath: '/assets/images/women.png',
                    name: mem.memberName,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TopCard(
                    title: "المبلغ الشهري",
                    value: "10\$",
                    color: Color(0xFFA0E4D1),
                  ),
                  TopCard(
                      title: "المبلغ المستحق",
                      value: "20\$",
                      color: Color(0xFFDCBCB5))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
