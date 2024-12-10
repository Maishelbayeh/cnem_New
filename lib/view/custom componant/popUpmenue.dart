import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Define a data class for menu items
class MenuItem {
  final String label;
  final String url;
  final IconData icon;
  final Color color;
  final bool isEmailOption;

  MenuItem({
    required this.label,
    required this.url,
    required this.icon,
    required this.color,
    this.isEmailOption = false,
  });
}

class CustomPopupMenuButton {
  final List<MenuItem> menuItems;

  CustomPopupMenuButton({required this.menuItems});

  void showCustomPopupMenu(
      BuildContext context, Offset buttonPosition, double x, double y) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx - x,
        buttonPosition.dy + y,
        overlay.size.width - buttonPosition.dx,
        overlay.size.height - buttonPosition.dy,
      ),
      items: menuItems.map((menuItem) {
        return PopupMenuItem<String>(
          value: menuItem.url,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menuItem.label,
                style: TextStyle(
                  color: menuItem.color,
                  fontSize: Responsive.isMobile(context) ? 15 : 20,
                ),
              ),
              Icon(
                menuItem.icon,
                color: menuItem.color,
              ),
            ],
          ),
        );
      }).toList(),
    ).then((value) async {
      if (value != null) {
        final selectedItem = menuItems.firstWhere((item) => item.url == value);
        if (selectedItem.isEmailOption) {
        } else {
          launchUrl(Uri.parse(value));
        }
      }
    });
  }
}
