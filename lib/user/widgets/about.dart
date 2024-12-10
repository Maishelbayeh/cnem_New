import 'package:cenem/res/variables.dart';
import 'package:cenem/user/widgets/header_info.dart';
import 'package:cenem/view/custom%20componant/customtext.dart';
import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: email,
            textAlign: TextAlign.center,
          ),
          AreaInfoText(title: "الجنسية", text: mem.nationality ?? ''),
          AreaInfoText(
            title: 'الرمز الشخصي',
            text: mem.memberToken ?? '00000',
          ),
          AreaInfoText(
            title: "رقم الهاتف",
            text: phone,
          ),
          if (mem.encodeMonthly == 100)
            const AreaInfoText(
              title: "تصنيف الحالي",
              text: "ملتزم",
            ),
          if (mem.encodeMonthly == 101)
            const AreaInfoText(
              title: "تصنيف الحالي",
              text: "منتسب",
            ),
          if (mem.encodeMonthly == 102)
            const AreaInfoText(
              title: "تصنيف الحالي",
              text: "مجمد",
            ),
          if (mem.encodeMonthly == 103)
            const AreaInfoText(
              title: "تصنيف الحالي",
              text: "موقوف",
            ),
          if (mem.encodeMonthly == 104)
            const AreaInfoText(title: "تصنيف الحالي", text: "مفصول"),
          // Default case: if encodeMonthly is not 100, 101, 102, 103, or 104
          if (mem.encodeMonthly != 100 &&
              mem.encodeMonthly != 101 &&
              mem.encodeMonthly != 102 &&
              mem.encodeMonthly != 103 &&
              mem.encodeMonthly != 104)
            const AreaInfoText(
              title: "تصنيف الحالي",
              text: "عضو حر",
            ),

          // Monthly Classification (تصنيف الشهري)
          if (mem.encodeMonthly == 100)
            const AreaInfoText(
              title: "تصنيف الشهري",
              text: "ملتزم",
            ),
          if (mem.encodeMonthly == 101)
            const AreaInfoText(
              title: "تصنيف الشهري",
              text: "منتسب",
            ),
          if (mem.encodeMonthly == 102)
            const AreaInfoText(
              title: "تصنيف الشهري",
              text: "مجمد",
            ),
          if (mem.encodeMonthly == 103)
            const AreaInfoText(
              title: "تصنيف الشهري",
              text: "موقوف",
            ),
          if (mem.encodeMonthly == 104)
            const AreaInfoText(title: "تصنيف الشهري", text: "مفصول"),
          if (mem.encodeMonthly == 105)
            const AreaInfoText(
              title: "تصنيف الشهري",
              text: "عضو حر",
            ),

          AreaInfoText(
            title: "عدد العملاء",
            text: responseJsonchildren.length.toString(),
            fsize: 16,
          ),
        ],
      ),
    );
  }
}
