import 'package:cenem/res/variables.dart';
import 'package:cenem/user/widgets/the_tree.dart';
import 'package:cenem/view/mobile_member/widget/info_section.dart';
import 'package:flutter/material.dart';

class InfoScrollableContent extends StatelessWidget {
  const InfoScrollableContent({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.23,
        padding: const EdgeInsets.only(top: 4, bottom: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: (height / 1.333) * 0.07,
              left: 30,
              right: width * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
}
