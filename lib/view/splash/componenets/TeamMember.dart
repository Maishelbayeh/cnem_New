import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMember {
  final String name;
  final String description;
  final String imageUrl;
  final String position;
  bool isHovered;

  TeamMember({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.position,
    this.isHovered = false,
  });
}

final List<TeamMember> teamMembers = [
  TeamMember(
      name: 'طلال عقاد',
      description:
          'صاحب الفكرة ومالك التسجيلات لدى وزارة الاقتصاد وخبرة اكثر من 20 عام في التجارة والتنمية البشرية وتطوير الذات.',
      imageUrl: 'assets/talal.jpg',
      position: "مدير الشبكة"),
  TeamMember(
      name: 'صادق شخشير',
      description:
          'بكالوريوس علوم حاسوب- جامعة النجاح الوطنية خبرة اكثر من ٢٠ عاما في تطوير الانظمة المحوسبة',
      imageUrl: 'assets/sadeq.jpg',
      position: "مسؤول قسم ال IT"),
  TeamMember(
      name: 'ا.فادي الشخشير',
      description: 'خبره 20عاما في اداره المشاريع والعقود ومحاضر جامعي',
      imageUrl: 'assets/fadi.jpg',
      position: "مدير قسم العلاقات العامة "),
  TeamMember(
      name: "  د.ا منار حلمي عدوي",
      description:
          " شهادة الماجستير في قانون العمل الفلسطيني من جامعة النجاح الوطنية و شهادة  الدكتوراة في القانون الخاص في مجال عقود التجارة الإلكترونية من جامعة سوسة في تونس وحاصلة على  اجازة المحاماة الفلسطينية ولدي خبرة في مجال العمل ما يقارب ١٩ سنة ",
      imageUrl: 'assets/user.png',
      position: "المستشارة القانونية للشبكة"),
  TeamMember(
      name: 'أنصار صبحي عبد الكريم',
      description:
          'بكالوريوس الإذاعة والتلفزيون ، صحفية لدى الشبكة التعاونية للتسويق الالكتروني.',
      imageUrl: 'assets/anssar.jpg',
      position: "صحفية ومسؤولة اعلانات في الشبكة"),
  TeamMember(
      name: " مي حسام شلباية",
      description: " بكالوريوس هندسة حاسوب، من جامعة النجاح الوطنية",
      imageUrl: 'assets/mai.png',
      position: "FrontEnd developer"),
  TeamMember(
      name: " أ.ابراهيم احمد ",
      description:
          "  خريج بكالوريوس إدارة أعمال واقتصاد من جامعة القدس المفتوحة، بخبرة تزيد عن 8 سنوات في إدارة المشاريع الرقمية والتسويق الإلكتروني. حاصل على شهادات متخصصة من جوجل ومؤسسات محلية وأجنبية. مؤسس موقع *سوجلشي* لخدمات السوشيال ميديا وأكاديمية PS سابقًا. متخصص في إدارة الحملات الإعلانية عبر ميتا وتطوير أدوات منصات التواصل مثل تيك توك وإنستجرام. خبير في العمل الحر عبر منصات مثل مستقل وخمسات، ومتمكن من استخدام التطبيقات والمحافظ الرقمية لتلبية احتياجات العملاء بفعالية.",
      imageUrl: 'assets/ibrahim.png',
      position:
          "إدارة وتطوير أدوات الأعمال المختلفة الخاصة بجميع منصات التواصل الاجتماعي"),
  TeamMember(
      name: " م.ضحى احمد ",
      description: "بكالوريوس هندسة معماري",
      imageUrl: 'assets/user.png',
      position:
          "تقديم دورات هندسية في جامعة خضوري+دورات هندسية اونلاين في  البرامج المعمارية والديكور."),
  TeamMember(
      name: " مريم كردي ",
      description: " بكالوريوس نظم معلومات ادارية ",
      imageUrl: 'assets/user.png',
      position:
          "مسؤولة منصة ديسكورد و مدربة في قنوات الشبكة التعاونية للتسويق الالكتروني"),
  TeamMember(
      name: "  نور ابراهيم قويدر ",
      description: " بكالوريوس ادارة اعمال  ",
      imageUrl: 'assets/user.png',
      position: "ادارية لدى الشبكة التعاونية للتسويق  الالكتروني ."),
  TeamMember(
      name: " جيهان حازم فارس كخن ",
      description:
          " ماجستير في التسويق الرقمي والذكاء الاصطناعي، دبلوم عالي في اللغة الألمانية فرعي عبري، ودبلوم في تصميم الجرافيك والمونتاج. ",
      imageUrl: 'assets/user.png',
      position: "مدربة"),
  TeamMember(
      name: " يونس خضير",
      description:
          "ماجستير ذكاء صناعي جامعة النجاح الوطنية. ادارة مشاريع ومهندس برمجيات وخبرة 7 سنوات في تطوير البرامج والأنظمة الذكية ",
      imageUrl: 'assets/Yonis.jpg',
      position: "BackEnd developer"),
  TeamMember(
      name: " ميس اسماعيل ابو كشك",
      description: " بكالوريوس هندسة حاسوب، من جامعة النجاح الوطنية",
      imageUrl: 'assets/mays.jpg',
      position: "عضو في فريق ال it للشبكة والفريق الميداني"),
];

class MemberCard extends StatelessWidget {
  final TeamMember teamMember;

  const MemberCard({super.key, required this.teamMember});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.22,
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
          color: Colors.white, // خلفية بيضاء
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: const Color.fromRGBO(69, 30, 156, 1), // إطار بنفسجي
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(teamMember.imageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              teamMember.name,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(69, 30, 156, 1),
              ),
            ),
            Text(
              teamMember.position,
              style: GoogleFonts.elMessiri(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
