import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseRow extends StatefulWidget {
  final String link;
  const CourseRow({Key? key, required this.link}) : super(key: key);

  @override
  _CourseRowState createState() => _CourseRowState();
}

class _CourseRowState extends State<CourseRow> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // زر الإعجاب
        InkWell(
          onTap: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: isLiked ? Colors.red : Colors.grey, // اللون عند الإعجاب
            ),
          ),
        ),
        InkWell(
          onTap: () {
            launchUrl(widget.link as Uri); // استدعاء الرابط الممرر
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.open_in_browser, size: 16),
          ),
        ),
      ],
    );
  }
}
