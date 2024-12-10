import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/mobile_member/components/card.dart';
import 'package:flutter/material.dart';

class DashboardBottomSection extends StatelessWidget {
  const DashboardBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              CardInfo(
                title: "الاعضاء المنتسبون",
                value: countOrange.toString(),
                onTap: () {},
                height: 80,
                width: (MediaQuery.of(context).size.width) * 0.8,
                topColor: Colors.orange,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 1.322) * 0.05,
              ),
              CardInfo(
                title: "الاعضاء الملتزمون",
                value: countGreen.toString(),
                onTap: () {},
                height: 80,
                width: (MediaQuery.of(context).size.width) * 0.8,
                topColor: Colors.lightGreen,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 1.322) * 0.05,
              ),
              CardInfo(
                title: "الاعضاء الموقوفون",
                value: countRed.toString(),
                onTap: () {},
                height: 80,
                width: (MediaQuery.of(context).size.width) * 0.8,
                topColor: Colors.redAccent,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 1.322) * 0.05,
              ),
              CardInfo(
                title: "الاعضاء المفصولون",
                value: countBlack.toString(),
                onTap: () {},
                height: 100,
                width: (MediaQuery.of(context).size.width) * 0.8,
                topColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 1.322) * 0.05,
              ),
              CardInfo(
                title: "الاعضاء المجمدون",
                value: countBlue.toString(),
                onTap: () {},
                height: 80,
                width: (MediaQuery.of(context).size.width) * 0.8,
                topColor: second,
              ),
            ],
          ),
    );
    
  
  }
}
