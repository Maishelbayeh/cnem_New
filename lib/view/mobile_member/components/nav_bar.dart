import 'package:cenem/res/variables.dart';
import 'package:cenem/view/main/components/navigation_button.dart';
import 'package:cenem/view/mobile_member/components/picture_with_name.dart';
import 'package:cenem/view/mobile_member/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  final String name;
  final String imagePath;
  const NavBar({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PictureWithName(name: name, imagePath: imagePath),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                }),
            NavigationTextButton(
              color: Colors.white,
              onTap: (buttonPosition) {
                countOrange = 0; // encodeClassification 101
                countGreen = 0; // encodeClassification 100
                countRed = 0; // encodeClassification 103
                countBlack = 0; // encodeClassification 102
                countBlue = 0; // encodeClassification 102
                responseJsonchildren = [];
                print(responseJson);
                ismember = false;
                money = 20;
                user.clear();
                mem.clear();
                Get.toNamed("/Home");
              },
              text: 'تسجيل خروج',
            )
          ],
        ),
      ],
    );
  }
}
