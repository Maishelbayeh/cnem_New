import 'package:flutter/material.dart';
import 'package:cenem/user/pages/overview/overview.dart';
import 'package:cenem/user/widgets/side_menu.dart';
import 'package:cenem/res/variables.dart'; // Make sure visibleTree is declared in this file

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable:
          visibleTree, // Assuming visibleTree is a ValueNotifier<bool>
      builder: (context, isVisible, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isVisible) const Expanded(child: SideMenu()),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const OverviewPage(),
              ),
            ),
          ],
        );
      },
    );
  }
}
