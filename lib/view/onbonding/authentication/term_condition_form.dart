import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cenem/controllers/auth_controller.dart';
import 'package:cenem/controllers/navigation_controller.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/res/constants.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  final AuthController authController = Get.put(AuthController());

  Widget _buildTermText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(
          color: second,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      ),
    );
  }

  void _onNextPressed() {
    authController.isSignUp.value = false;
    if (Responsive.isExtraLargeScreen(context) ||
        Responsive.isDesktop(context)) {
      Get.find<DialogNavigationController>().currentPage('/Addmember');
    } else {
      Get.toNamed('/Home/SiteCondition/AddMember');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double baseFontSize = Responsive.isLargeMobile(context) ? 14 : 14.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          'سـيـاسـات وشـروطـ العـضـويـة فـي الشــبكـة',
          style: TextStyle(
            color: second,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTermText(
              "1 - العمل مع الشبكة هو بنظام تعاوني لإنجاح مشاريع تجارية مستقلة لكل عضو وأن العلاقة بين العضو والشبكة لا تخضع لأنظمة وقوانين العمل الفلسطيني وباقي الدول .",
              baseFontSize,
            ),
            _buildTermText(
              "2 - الهدف من العضوية في الشبكة هو تحقيق الأرباح المالية من الانترنت وفريق العمل، لذلك يمنع تداول أو مناقشة أي موضوع أخر (سياسي أو ديني أو اجتماعي ... الخ) في الشبكة.",
              baseFontSize,
            ),
            _buildTermText(
              "3 - يمنع استخدام شعار واسم الشبكة خارج القنوات الرسمية للشبكة (الموقع والتطبيق) الالكتروني فقط ويمنع استخدامه في أي إعلان أو ما شابه في مواقع التواصل الالكترونية العامة.",
              baseFontSize,
            ),
            _buildTermText(
              "4 – مما هو مفهوم أن الشبكة تقدم التعليم والإرشاد لكسب الفرص المتاحة على المواقع العالمية، وأن جذب أعضاء جدد للشبكة هي فكرة تسويقية وليس نظام عمل أو فرصة عمل، لذلك يسمح للأعضاء والمنتسبين استخدام اسم وشعار الشبكة على صفحاتهم الشخصية فقط بشرط إضافة اسمهم الشخصي بجانب الاسم أو الشعار والدعوات تكون للأقارب والمعارف فقط.",
              baseFontSize,
            ),
            _buildTermText(
              "5 - لجذب أعضاء جدد للشبكة يتم من خلال العرض التقديمي فقط الموجود على القنوات الرسمية للشبكة.",
              baseFontSize,
            ),
            _buildTermText(
              "6 – لمنع تحول الشبكة إلى نظام عمل يسمح بالحد الأعلى لكل عضو بضم 60 عضواً فقط ولا يوجد شرط للحد الأدنى.",
              baseFontSize,
            ),
            _buildTermText(
              "7 - يمنع أي نشاط مالي بين الأعضاء خارج الحساب البنكي الرسمي للشبكة.",
              baseFontSize,
            ),
            _buildTermText(
              "8 - رسوم العضوية والانتساب والشهادة (الأسعار أو نوع العملة قابلة للتغير مستقبلاً):\n  • الانتساب: 25 دولار لمرة واحدة فقط.\n  • الشهرية: 25 دولار.\n  • الشهادة: 20 دولار لكل شهادة.",
              baseFontSize,
            ),
            _buildTermText(
              "9 – احتساب الشهور: يحتسب الشهر من الأول من كل شهر وحتى آخر يوم من الشهر.",
              baseFontSize,
            ),
            _buildTermText(
              "10 – مسميات العضوية في الشبكة:\n  أ. منتسب: يدفع رسوم الانتساب + الرسوم الشهرية. لا يحصل على عمولات من الفريق.\n  ب. عضو ملتزم: يحصل على عمولات من الأعضاء الملتزمين فقط.\n  ج. عضو مجمد: يُسمح له بالدفع خلال الشهر للحفاظ على الفريق لكنه يخسر العمولة للشهر المتأخر.\n  د. عضو موقوف: يخسر الفريق والرقم الخاص بالشبكة.\n  هـ. عضو مفصول: يخسر جميع العمولات ولا يُسمح له بالعودة.",
              baseFontSize,
            ),
            _buildTermText(
              "11 – المكافئات التشجيعية: بقيمة (500 دولار) تصرف فقط لمن يشارك في رحلات العمل الخارجية.",
              baseFontSize,
            ),
            _buildTermText(
              "12 – نظام احتساب المكافئات:\n  أ. تسجيل 50 منتسب جديد خلال 3 أشهر.\n  ب. لا يحق المطالبة بالمكافأة إذا لم يرغب بالمشاركة بالرحلة.",
              baseFontSize,
            ),
            _buildTermText(
              "13 – من يشارك في الرحلة الخارجية يجب شراء اشتراك جديد دولي.",
              baseFontSize,
            ),
            _buildTermText(
              "14 – لا تتحمل الشبكة أي مسؤولية مدنية أو جزائية ناتجة عن تصرفات العضو مع الغير.",
              baseFontSize,
            ),
            _buildTermText(
              "15 – يحظر تداول المادة التدريبية أو الفيديوهات التعليمية دون موافقة الشبكة تحت طائلة المساءلة القانونية.",
              baseFontSize,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: second,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 20.0,
                  ),
                ),
                child: const Text(
                  "التالي",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
