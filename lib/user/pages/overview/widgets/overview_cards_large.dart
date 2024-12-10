import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/user/pages/overview/widgets/info_card.dart';
import 'package:cenem/view/custom%20componant/error.dart';
import 'package:flutter/material.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCard(
          title: "الاعضاء المنتسبون",
          value: countOrange.toString(),
          onTap: () {},
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
        SizedBox(
          width: width / 64,
        ),
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
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "الاعضاء المجمدون",
          value: countBlue.toString(),
          topColor: second,
          onTap: () {},
        ),
      ],
    );
  }
}
