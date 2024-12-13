import 'package:cenem/view/splash/componenets/TeamMember.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showMemberDialog(BuildContext context, TeamMember member) {
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl, // Right to Left for Arabic text
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          content: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.35, // تحديد عرض الصندوق
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(member.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        member.name,
                        style: GoogleFonts.elMessiri(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(69, 30, 156, 1),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "الوظيفة: ${member.position}",
                  style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  member.description,
                  style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color.fromRGBO(69, 30, 156, 1), width: 1.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "إغلاق",
                style: GoogleFonts.elMessiri(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(69, 30, 156, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق النافذة
              },
            ),
          ],
        ),
      );
    },
  );
}
