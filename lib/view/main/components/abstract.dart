import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

abstract class MainView extends StatelessWidget {
  const MainView({Key? key, required this.pages}) : super(key: key);
  final List<Widget> pages;

  @override
  Widget build(BuildContext context);
}
