import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: screenWidth * 0.22, // Adjust as per design
        height: screenHeight * 0.35, // Adjust as per design
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: const Color.fromRGBO(69, 30, 156, 1),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                child: Image.asset(
                  course['image'] ?? '', // Safely access the image key
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course['name'] ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(
                  fontSize: screenWidth < 600
                      ? 18 // حجم أصغر للشاشات الصغيرة
                      : screenWidth < 1200
                          ? 16 // حجم متوسط للشاشات المتوسطة
                          : 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(69, 30, 156, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
