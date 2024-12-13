import 'package:cenem/res/variables.dart';
import 'package:cenem/view/mobile_member/components/info_sec.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(50.0), // Add padding of 16 around the column
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InfoRow(title: "الجنسية", value: mem.nationality!),
          const SizedBox(height: 15),
          InfoRow(title: "الرمز الشخصي", value: mem.memberToken!),
          const SizedBox(height: 15),
          InfoRow(title: "رقم الهاتف", value: user.phone),
          const SizedBox(height: 15),
          if (mem.encodeMonthly == 100)
            const InfoRow(
              title: "تصنيف الحالي",
              value: "ملتزم",
            ),
          if (mem.encodeMonthly == 101)
            const InfoRow(
              title: "تصنيف الحالي",
              value: "منتسب",
            ),
          if (mem.encodeMonthly == 102)
            const InfoRow(
              title: "تصنيف الحالي",
              value: "مجمد",
            ),
          if (mem.encodeMonthly == 103)
            const InfoRow(
              title: "تصنيف الحالي",
              value: "موقوف",
            ),
          if (mem.encodeMonthly == 104)
            const InfoRow(title: "تصنيف الحالي", value: "مفصول"),
          if (mem.encodeMonthly != 100 &&
              mem.encodeMonthly != 101 &&
              mem.encodeMonthly != 102 &&
              mem.encodeMonthly != 103 &&
              mem.encodeMonthly != 104)
            const InfoRow(
              title: "تصنيف الحالي",
              value: "عضو حر",
            ),
          if (mem.encodeMonthly == 100)
            const InfoRow(
              title: "تصنيف الشهري",
              value: "ملتزم",
            ),
          if (mem.encodeMonthly == 101)
            const InfoRow(
              title: "تصنيف الشهري",
              value: "منتسب",
            ),
          if (mem.encodeMonthly == 102)
            const InfoRow(
              title: "تصنيف الشهري",
              value: "مجمد",
            ),
          if (mem.encodeMonthly == 103)
            const InfoRow(
              title: "تصنيف الشهري",
              value: "موقوف",
            ),
          if (mem.encodeMonthly == 104)
            const InfoRow(title: "تصنيف الشهري", value: "مفصول"),
          if (mem.encodeMonthly == 105)
            const InfoRow(
              title: "تصنيف الشهري",
              value: "عضو حر",
            ),
          InfoRow(
            title: "عدد العملاء",
            value: responseJsonchildren.length.toString(),
          ),
        ],
      ),
    );
  }
}
