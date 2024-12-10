// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;

  const CustomPopupMenuButton(
      {super.key, required this.options, required this.onSelected});

  @override
  _CustomPopupMenuButtonState createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: _selectedOption,
      itemBuilder: (BuildContext context) {
        return widget.options.map((String option) {
          return PopupMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          _selectedOption = value;
        });
        widget.onSelected(value);
      },
    );
  }
}
