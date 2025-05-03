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
              "1 - العمل مع الشبكة هو بنظام تعاوني لإنجاح مشاريع تجارية مستقلة لكل عضو وأن العلاقة بين العضو والشبكة لا تخضع لأنظمة وقوانين العمل الفلسطيني وباقي الدول.",
              baseFontSize,
            ),
            _buildTermText(
              "2 - الهدف من العضوية في الشبكة هو تحقيق الأرباح المالية من الانترنت وفريق العمل ، لذلك يمنع تداول أو مناقشة أي موضوع أخر ( سياسي أو ديني أو اجتماعي  ... الخ ) في الشبكة.",
              baseFontSize,
            ),
            _buildTermText(
              "3 - يمنع استخدام شعار واسم الشبكة خارج القنوات الرسمية للشبكة ( الموقع والتطبيق ) الالكتروني فقط ويمنع استخدامه في إي إعلان أو ما شابه في مواقع التواصل الالكترونية العامه .",
              baseFontSize,
            ),
            _buildTermText(
              "4 – مما هو مفهوم ان الشبكة تقدم التعليم والارشاد لكسب الفرص المتاحة على المواقع العالمية وان جذب اعضاء جدد للشبكة هي فكرة تسويقية وليس نظام عمل او فرصة عمل لذلك يسمح للأعضاء والمنتسبين استخدام اسم وشعار الشبكة على صفحاتهم الشخصية فقط بشرط إضافة اسمهم الشخصي بجانب الاسم أو الشعار والدعوات تكون للاقارب والمعارف فقط .",
              baseFontSize,
            ),
            _buildTermText(
              "5 - لجذب أعضاء جدد للشبكة يتم من خلال العرض ألتقديمي فقط الموجود على القنوات الرسمية للشبكة .",
              baseFontSize,
            ),
            _buildTermText(
              "6 – لمنع تحول الشبكة الى نظام عمل يسمح للاعضاء بالحد الاعلى لكل عضو بضم 60 عضو فقط ولا يوجد شرط للحد الادنى .ملاحظة :\n  يستثنى من هذه القاعدة المدربين في الشبكة ضمن شروط في تقديم الدورات والارشاد .",
              baseFontSize,
            ),
            _buildTermText(
              "7 - يمنع إي نشاط مالي بين الاعضاء خارج الحساب البنكي الرسمي للشركة . ",
              baseFontSize,
            ),
            _buildTermText(
              "8 - رسوم العضوية والانتساب والشهادة (الأسعار أو نوع العملة قابلة للتغير مستقبلاً):\n  • الانتساب: 25 دولار أمريكي.\n  •  الشهرية: 35 دولار أمريكي.\n  • شهادة حضور دورة : 10 دولار امريكي \n •شهادة الدورات الالكترونية المعتمدة من طلال ابو غزالة للتدريب الرقمي : 30 دولار امريكي لكل شهادة . ",
              baseFontSize,
            ),
            _buildTermText(
              "9 – احتساب الشهور: يحتسب الشهر من الأول من كل شهر وحتى آخر يوم من الشهر.",
              baseFontSize,
            ),
            _buildTermText(
              "10 – مسميات العضوية في الشبكة:\n  أ. منتسب: وهو الشهر الأول للانضمام وعليه دفع رسوم الانتساب + الرسوم الشهرية \n ملاحظة : المنتسب  لا يحصل على عمولات من الفريق ولا يدفع عليه عمولات لمن احضره \n ملاحظة : أي يوم من الانضمام  حتى أخر يوم في الشهر يعتبر منتسب وعليه دفع رسوم الانتساب كاملة والرسوم الشهرية ( في حال تم التسجيل بعد الخامس من الشهر يتم احتساب القيمة عن كل يوم حتى نهاية الشهر) وبمجرد دخول الشهر الجديد يلتزم بدفع الرسوم الشهرية الجديدة كاملة.\n  ب. عضو ملتزم: وهو من بعد الالتزام بدفع اشتراك الشهر الثاني أو أي شهر ما بعده بشرط الالتزام بدفع الرسوم الشهرية أول خمس أيام من الشهر كحد أقصى والعضو يحصل على عمولات من فريقه المباشر من الأعضاء الملتزمين فقط ولا يحصل على عمولات من المنتسبين.\n  ج. عضو مجمد: وهو الغير ملتزم بدفع الرسوم الشهرية بالموعد المحدد حتى الخامس من كل شهر ( تم الدفع خلال ال 6 – نهاية الشهر) ويسمح له بالدفع في أي يوم من الشهر للحفاظ على فريقه للأشهر القادمة ويخسر عمولة الفريق عن الشهر المتأخر في سداده.\n   د. عضو موقوف: وهو من لم يسدد الرسوم الشهرية خلال الشهر وعليه يخسر فريقه ورقمه الخاص فيه بالشبكة والعمولات ولا يحق له بالمطالبة باستعادة فريقه أو العمولات ( في بعض الحالات القاهرة مثل السجن أو المرضي في المستشفى أو ما شابه يتم النظر باستعادة فريقه بشرط عدم المطالبة بالعمولات السابقة وتقديم الأوراق الاثباتية لذلك).\n هـ .عضو مفصول : وهو من خرج عن غايات وأهداف الشبكة و نشر أي نشاط سياسي أو حزبي أو ديني أو تجاوز أخلاقي أو ما شابه داخل الشبكه ويخسر جميع عمولاته ورقمه وفريقه ولا يحق له بالمطالبة للعودة إلى الشبكة أو أي تسجيل جديد مستقبلي.",
              baseFontSize,
            ),
            _buildTermText(
              "11 – المكافئات التشجيعية : وهي بقيمة ( 500 دولار ) وخاصة بمشتركين المستوى الثالث وتصرف لمن يشارك في رحلات العمل فقط ولا تستبدل بالقيمة المالية والهدف منها الانتشار وبناء فرق جديدة خارج حدود فلسطين . \n ملاحظة : تصرف للمشتركين لمرة واحدة فقط وغير محدودة للمدربين ضمن شروط .",
              baseFontSize,
            ),
            _buildTermText(
              "12 – نظام احتساب المكافئات: يتم احتساب الشهر كما هو مذكور في البند رقم 9 ضمن الشروط التالية :\n  أ. تسجيل 60 منتسب جديد خلال فترة لا تزيد عن ال 6 اشهر في المستوى الثاني .\n ب. لا يحقق للعضو او المدرب المطالبة بالمكافئة في حال لم يرغب في المشاركة بالرحلة كما هو مذكور في البند رقم 11 .",
              baseFontSize,
            ),
            _buildTermText(
              "13 –  من يشارك في الرحلة الخارجية يقوم بشراء اشتراك جديد دولي ( مع بقاء الاشتراك القديم بنفس الشروط ) وايضاً بنفس الشروط السابقة للبدء في جذب اعضاء جدد للشبكة في الخارج .",
              baseFontSize,
            ),
            _buildTermText(
              "14 – لا تتحمل الشبكة أية مسؤولية مدنية او جزائية ناتجة عن تصرفات العضو او المدرب مع الغير.",
              baseFontSize,
            ),
            _buildTermText(
              "شروط خاصة للاشتراك من خلال شركة فيتاس فلسطين",
              baseFontSize,
            ),
            _buildTermText(
              "1.	تعبئة طلب الكتروني خاص بشركة فيتاس .",
              baseFontSize,
            ),
            _buildTermText(
              "2.	دفع رسوم الانتساب لبرنامج الشبكة التعاونية : 25 دولار غير مستردة.",
              baseFontSize,
            ),
            _buildTermText(
              "3.	النجاح في تسجيل 10 اعضاء جدد في برنامج الشبكة التعاونية خلال 3 اسابيع .",
              baseFontSize,
            ),
            _buildTermText(
              "4.	الالتزام بتحقيق النقاط لتحويلها الى ارباح من الشهر الثالث.",
              baseFontSize,
            ),
            _buildTermText(
              "5.	موافقة شركة فيتاس خلال 3 اسابيع .",
              baseFontSize,
            ),
            _buildTermText(
              "6.	يخصم من ارباح الشهر 3 و 4 و5 و 6 بقيمة 60 دولار امريكي.",
              baseFontSize,
            ),
            _buildTermText(
              "7.	يمكن الاستمرار بالعمل في البرنامج بعد انتهاء الشهر السادس بدفع الرسوم الشهرية.",
              baseFontSize,
            ),
            _buildTermText(
              "8.	في حال رفض الطلب من شركة فيتاس يمكن الاستمرار بالانتساب باستكمال دفع الرشوم الشهرية.",
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
