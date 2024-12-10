import 'package:cenem/res/constants.dart';
import 'package:cenem/user/pages/overview/widgets/revenue_info.dart';
import 'package:flutter/material.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile Layout
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12,
                ),
              ],
              border: Border.all(color: lightGrey, width: .5),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RevenueInfo(
                    title: "ارباح هذا الشهر",
                    amount: "0",
                  ),
                  const SizedBox(width: 16),
                  RevenueInfo(
                    title: "ارباح الشهر الماضي",
                    amount: "0",
                  ),
                  const SizedBox(width: 16),
                  RevenueInfo(
                    title: "ارباح اخر سته اشهر",
                    amount: "0",
                  ),
                  const SizedBox(width: 16),
                  RevenueInfo(
                    title: "ارباح السنه",
                    amount: "0",
                  ),
                ],
              ),
            ),
          );
        } else {
          // Desktop Layout
          return Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12,
                ),
              ],
              border: Border.all(color: lightGrey, width: .5),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          RevenueInfo(
                            title: "ارباح هذا الشهر",
                            amount: "0",
                          ),
                          RevenueInfo(
                            title: "ارباح الشهر الماضي",
                            amount: "0",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          RevenueInfo(
                            title: "ارباح اخر سته اشهر",
                            amount: "0",
                          ),
                          RevenueInfo(
                            title: "ارباح السنه",
                            amount: "0",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 120,
                  color: lightGrey,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 200,
                          height: 200, // Adjust height as needed
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/cnem.png'), // Provide your image path here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
