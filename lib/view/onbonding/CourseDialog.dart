import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cenem/user/pages/overview/widgets/newrow.dart';

void showCourseDialog(BuildContext context, List<Map<String, dynamic>> links) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: links.length,
            itemBuilder: (BuildContext context, int index) {
              final item = links[index]; // احصل على العنصر الحالي
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          item['image'] != ''
                              ? Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(item['image']),
                                    ),
                                  ),
                                )
                              : const Icon(Icons.link,
                                  size: 40, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    launchUrl(item['link']);
                                  },
                                  child: Text(
                                    item['name'],
                                    style: GoogleFonts.elMessiri(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(69, 30, 156, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "المدرب: ${item['trainer']}",
                                  style: GoogleFonts.elMessiri(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CourseRow(link: item['link']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
