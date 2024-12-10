import 'package:cenem/res/variables.dart';
import 'package:cenem/user/widgets/about.dart';
import 'package:cenem/user/widgets/custom_text.dart';
import 'package:cenem/user/widgets/the_tree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/res/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuController());

    return Scaffold(
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: CustomText(
                      text: mem.memberName,
                      color: second,
                    )),
              ),
              const About(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: PersonTree(
                  person: Person(
                      name: 'العملاء',
                      isRoot: true,
                      children: responseJsonchildren),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
