import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';
import 'package:cenem/view/mobile_member/components/email_section.dart';
import 'package:cenem/view/mobile_member/widget/info_scrollable_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.8,
                  decoration: const BoxDecoration(
                    color: second,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          right: 25.0,
                          left: 10.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CupertinoButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Color(0xFFF8BB7C),
                                        size: 25.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "../assets/images/woman.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      EmailSection(
                        height: height,
                        width: width,
                        email: mem.memberName,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.35,
                  decoration: const BoxDecoration(
                    color: second,
                  ),
                ),
              ),
              InfoScrollableContent(height: height, width: width),
            ],
          ),
        ),
      ),
    );
  }
}
