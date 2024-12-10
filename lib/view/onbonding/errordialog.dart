import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfessionalErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  const ProfessionalErrorDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      backgroundColor: Colors.white, // Background color
      insetPadding: const EdgeInsets.all(20), // Padding around the dialog
      child: Directionality(
        textDirection: TextDirection.rtl, // RTL for Arabic content
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400), // Set max width
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height based on content
            children: [
              // Icon at the top
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: Icon(
                  Icons.error_outline,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                title,
                style: GoogleFonts.elMessiri(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              // Content
              Text(
                content,
                style: GoogleFonts.elMessiri(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(69, 30, 156, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        buttonText,
                        style: GoogleFonts.elMessiri(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(69, 30, 156, 1),
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        'إغلاق', // Arabic text for 'Close'
                        style: GoogleFonts.elMessiri(
                          fontSize: 14.0,
                          color: const Color.fromRGBO(69, 30, 156, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
