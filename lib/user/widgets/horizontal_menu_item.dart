import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

// MenuController definition
class MenuController extends GetxController {
  var activeItem = ''.obs;
  var hoverItem = ''.obs;

  void onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isHovering(String itemName) => hoverItem.value == itemName;

  void onActive(String itemName) {
    activeItem.value = itemName;
  }

  bool isActive(String itemName) => activeItem.value == itemName;

  Icon returnIconFor(String itemName) {
    switch (itemName) {
      case 'تسجيل الخروج':
        return Icon(Icons.dashboard,
            color: isHovering(itemName) || isActive(itemName)
                ? Colors.white
                : Colors.grey);
      case 'اعدادات':
        return Icon(Icons.settings,
            color: isHovering(itemName) || isActive(itemName)
                ? Colors.white
                : Colors.grey);
      default:
        return Icon(Icons.circle,
            color: isHovering(itemName) || isActive(itemName)
                ? Colors.white
                : Colors.grey);
    }
  }
}

// CustomText widget definition
class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}

// VertticalMenuItem widget definition
class VertticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;

  const VertticalMenuItem({super.key, required this.itemName, this.onTap});

  @override
  Widget build(BuildContext context) {
    final MenuController menuController = Get.find();

    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? Colors.grey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    width: 3,
                    height: 72,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName),
                      ),
                      if (!menuController.isActive(itemName))
                        Flexible(
                          child: CustomText(
                            text: itemName,
                            color: menuController.isHovering(itemName)
                                ? Colors.white
                                : Colors.grey,
                          ),
                        )
                      else
                        Flexible(
                          child: CustomText(
                            text: itemName,
                            color: Colors.white,
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// MyApp definition
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Vertical Menu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VertticalMenuItem(
                itemName: 'Dashboard',
                onTap: () {
                  Get.find<MenuController>().onActive('Dashboard');
                },
              ),
              VertticalMenuItem(
                itemName: 'Settings',
                onTap: () {
                  Get.find<MenuController>().onActive('Settings');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
