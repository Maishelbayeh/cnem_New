import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cenem/view/onbonding/CourseDialog.dart'; // تأكد من استخدام المسار الصحيح

final List<Map<String, dynamic>> discordLinksStores = [
  {
    'name': 'ecwid',
    'image': 'assets/Ecwid.jpg',
    'link': Uri.parse("https://discord.gg/BrXVmC23f3"),
    'trainer': ''
  },
  {
    'name': 'wix',
    'image': 'assets/wix.jpg',
    'link': Uri.parse("https://discord.gg/nUMFbC6cYs"),
    'trainer': ''
  },
  {
    'name': 'ووردبريس',
    'image': 'assets/wordpress.jpg',
    'link': Uri.parse("https://discord.gg/hJwdZpf7WJ"),
    'trainer': ''
  },
];
final List<Map<String, dynamic>> discordLinksSocial = [
  {
    'name': 'تيلجرام',
    'image': 'assets/telegram.jpg',
    'link': Uri.parse("https://discord.gg/fyqNfmfq4n"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'تيك توك',
    'image': 'assets/tiktok.jpg',
    'link': Uri.parse("https://discord.gg/twEg6J5zUT"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'انستغرام',
    'image': 'assets/instagram.jpg',
    'link': Uri.parse("https://discord.gg/w7vpzHerRg"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'فيس بوك',
    'image': 'assets/facebook.jpg',
    'link': Uri.parse("https://discord.gg/VWcQySHxen"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'أدوات الاعمال',
    'image': 'assets/Businesstools.jpg',
    'link': Uri.parse("https://discord.gg/nQ289ZjZnJ"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'مدير الإعلانات',
    'image': 'assets/AdvManager.jpg',
    'link': Uri.parse("https://discord.gg/h5mv2GrEZf"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'يوتيوب',
    'image': 'assets/youtube.jpg',
    'link': Uri.parse("https://discord.gg/fTcbCT7F6R"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'منصة x ',
    'image': 'assets/Twitter.jpg',
    'link': Uri.parse("https://discord.gg/ZjNf4S86Kf"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'سوشلجي',
    'image': 'assets/Suchalji.jpg',
    'link': Uri.parse("https://discord.gg/PwtXg6jYFh"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'سناب شات',
    'image': 'assets/snapchat.jpg',
    'link': Uri.parse("https://discord.gg/Hwv2mqkxfE"),
    'trainer': 'ابراهيم احمد'
  },
];
final List<Map<String, dynamic>> discordLinksFreelance = [
  {
    'name': 'مستقل',
    'image': 'assets/mustaqilun.jpg',
    'link': Uri.parse("https://discord.gg/3uX6E5A7dC"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'خمسات ',
    'image': 'assets/khamsat.jpg',
    'link': Uri.parse("https://discord.gg/7GZewXPJf6"),
    'trainer': 'ابراهيم احمد'
  },
];
final List<Map<String, dynamic>> discordLinksdesign = [
  {
    'name': 'ثري دي ماكس',
    'image': 'assets/3Dmaxs.jpg',
    'link': Uri.parse("https://discord.gg/7eCaS4CAtQ"),
    'trainer': 'ضحى احمد'
  },
  {
    'name': 'فوتوشوب',
    'image': 'assets/Photoshop.jpg',
    'link': Uri.parse("https://discord.gg/Dfqk7uRAY9"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'اوتوكاد',
    'image': 'assets/AutoCAD.jpg',
    'link': Uri.parse("https://discord.gg/dmzJMJqGJz"),
    'trainer': 'ضحى احمد'
  },
  {
    'name': 'كانفا',
    'image': 'assets/Canva.jpg',
    'link': Uri.parse("https://discord.gg/abyHDqFpQt"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'كاب كات',
    'image': 'assets/Capcut.jpg',
    'link': Uri.parse("https://discord.gg/2vAc7SjvBm"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'المصمم العربي',
    'image': 'assets/Arabdesigner.jpg',
    'link': Uri.parse("https://discord.gg/rAr4HkbDkB"),
    'trainer': '',
  },
];
final List<Map<String, dynamic>> discordLinksBank = [
  {
    'name': 'جوال',
    'image': '',
    'link': Uri.parse("https://discord.gg/NCnrmkQQH9"),
    'trainer': '',
  },
  {
    'name': 'تطبيق البنك العربي',
    'image': '',
    'link': Uri.parse("https://discord.gg/xDFCq62Pry"),
    'trainer': '',
  },
  {
    'name': 'تطبيق بنك فلسطين',
    'image': '',
    'link': Uri.parse("https://discord.gg/NSwM2Xu7W5"),
    'trainer': '',
  },
];
final List<Map<String, dynamic>> discordLinksonline = [
  {
    'name': 'بيع الصور',
    'image': 'assets/Sellphotos.jpg',
    'link': Uri.parse("https://discord.gg/w46SeATN3n"),
    'trainer': '',
  },
  {
    'name': 'سماع الاغاني',
    'image': 'assets/Listeningtosongs.jpg',
    'link': Uri.parse("https://discord.gg/6MdsV9vqh4"),
    'trainer': '',
  },
  {
    'name': 'مشاهدة الافلام',
    'image': 'assets/watchingFilms.jpg',
    'link': Uri.parse("https://discord.gg/KShwPPj9kU"),
    'trainer': '',
  },
  {
    'name': 'العاب',
    'image': 'assets/games.jpg',
    'link': Uri.parse("https://discord.gg/VdNg5M3fsH"),
    'trainer': '',
  },
  {
    'name': 'drop-shopping',
    'image': 'assets/dropshopping.jpg',
    'link': Uri.parse("https://discord.gg/tyfKaMKZxm"),
    'trainer': '',
  },
];

final List<Map<String, dynamic>> coursesMoney = [
  {
    'name': 'ادوات الذكاء الاصطناعي',
    'image': 'assets/aitool.jpg',
  },
  {
    'name': 'إجابة الاستبيان',
    'image': 'assets/questionnaire.jpg',
  },
  {
    'name': 'البودكاست',
    'image': 'assets/Podcast.jpg',
  },
  {
    'name': 'المتاجر الالكتروني',
    'image': 'assets/Ecommerce.jpeg',
  },
  {
    'name': 'سوشال ميديا',
    'image': 'assets/socialmedia.jpeg',
  },
  {
    'name': 'العمل الحر',
    'image': 'assets/onlineworking.jpeg',
  },
  {
    'name': 'محافظ البنكية',
    'image': 'assets/bankpocket.jpeg',
  },
  {
    'name': 'برامج التصميم',
    'image': 'assets/design.jpeg',
  },
  {
    'name': 'الربح عن طريق الانترنت',
    'image': 'assets/profitviainternet.jpeg',
  },
];

class ChannelSectionLarge extends StatefulWidget {
  const ChannelSectionLarge({super.key});

  @override
  _ChannelSectionLargeState createState() => _ChannelSectionLargeState();
}

class _ChannelSectionLargeState extends State<ChannelSectionLarge> {
  double height = 600.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.03), // 3% of screen width
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: Colors.grey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
        border: Border.all(color: Colors.grey, width: .5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: SizedBox(
              height: height, // Ensure the GridView has a fixed height
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 4 : 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.8,
                ),
                itemCount: coursesMoney.length,
                itemBuilder: (context, index) {
                  final course = coursesMoney[index];
                  return GestureDetector(
                    onTap: () {
                      if (course['name'] == 'ادوات الذكاء الاصطناعي') {
                        launchUrl(Uri.parse('https://discord.gg/2SqrNNA5eV'));
                      } else if (course['name'] == 'إجابة الاستبيان') {
                        launchUrl(Uri.parse('https://discord.gg/MmCuJZQkNc'));
                      } else if (course['name'] == 'البودكاست') {
                        launchUrl(Uri.parse('https://discord.gg/8mfVwPdFBY'));
                      } else if (course['name'] == 'المتاجر الالكتروني') {
                        showCourseDialog(context, discordLinksStores);
                      } else if (course['name'] == 'سوشال ميديا') {
                        showCourseDialog(context, discordLinksSocial);
                      } else if (course['name'] == 'العمل الحر') {
                        showCourseDialog(context, discordLinksFreelance);
                      } else if (course['name'] == 'محافظ البنكية') {
                        showCourseDialog(context, discordLinksBank);
                      } else if (course['name'] == 'برامج التصميم') {
                        showCourseDialog(context, discordLinksdesign);
                      } else if (course['name'] == 'الربح عن طريق الانترنت') {
                        showCourseDialog(context, discordLinksonline);
                      }
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: course['image'] != ''
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12.0),
                                    ),
                                    child: Image.asset(
                                      course['image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  )
                                : const Icon(Icons.link,
                                    size: 40, color: Colors.blue),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              course['name']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.elMessiri(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(69, 30, 156, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
