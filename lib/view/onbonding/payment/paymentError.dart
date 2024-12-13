import 'package:cenem/controllers/Membercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

final SecondSignFormController controller = Get.put(SecondSignFormController());
void showPaymentProfessionalErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // لا يمكن إغلاق النافذة بالنقر خارجها
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // زوايا مدورة
        ),
        title: const Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 28.0,
            ),
            SizedBox(width: 8.0),
            Text(
              "تحذير!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
        content: Text(
          "هل أنت متأكد من التسجيل بدون رقم شخص؟\n"
          "إذا سمعت عن الشبكة من أحد، وأضفت رقم مشترك آخر، فسيتم خصم 5 دولارات من مبلغ الانتساب.",
          style: GoogleFonts.elMessiri(
            fontSize: 16.0,
            color: Colors.black87,
            height: 1.6, // تحسين المسافات بين السطور
          ),
          textAlign: TextAlign.center, // محاذاة للنص
        ),
        actionsAlignment: MainAxisAlignment.center, // تمركز الأزرار
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(69, 30, 156, 1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              "نعم متأكد",
              style: GoogleFonts.elMessiri(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  color: Color.fromRGBO(69, 30, 156, 1), width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      );
    },
  );
}
