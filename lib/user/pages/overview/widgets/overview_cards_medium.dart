import 'package:cenem/res/variables.dart';
import 'package:cenem/user/pages/overview/widgets/info_card.dart';
import 'package:cenem/view/custom%20componant/error.dart';
import 'package:flutter/material.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "الاعضاء المنتسبون",
              value: countOrange.toString(),
              onTap: () {
                showProfessionalErrorDialog(context, countOrange.toString());
              },
              topColor: Colors.orange,
            ),
            SizedBox(
              width: width / 64,
            ),
            InfoCard(
              title: "الاعضاء الملتزمون",
              value: countGreen.toString(),
              topColor: Colors.lightGreen,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: "الاعضاء الموقوفون",
              value: countRed.toString(),
              topColor: Colors.redAccent,
              onTap: () {},
            ),
            SizedBox(
              width: width / 64,
            ),
            InfoCard(
              title: "الاعضاء المفصولون",
              value: countBlack.toString(),
              topColor: const Color.fromARGB(255, 0, 0, 0),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
