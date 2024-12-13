import 'package:flutter/material.dart';

abstract class MainView extends StatelessWidget {
  const MainView({Key? key, required this.pages}) : super(key: key);
  final List<Widget> pages;

  @override
  Widget build(BuildContext context);
}
