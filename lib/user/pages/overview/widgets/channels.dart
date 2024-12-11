import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, dynamic>> discordLinks = [
  {
    'name': 'ecwid',
    'image': '',
    'link': Uri.parse("https://discord.gg/BrXVmC23f3"),
    'trainer': ''
  },
  {
    'name': 'wix',
    'image': '',
    'link': Uri.parse("https://discord.gg/nUMFbC6cYs"),
    'trainer': ''
  },
  {
    'name': 'ووردبريس',
    'image': '',
    'link': Uri.parse("https://discord.gg/hJwdZpf7WJ"),
    'trainer': ''
  },
  //////////////////////////سوشال ميديا
  {
    'name': 'تيلجرام',
    'image': '',
    'link': Uri.parse("https://discord.gg/fyqNfmfq4n"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'تيك توك',
    'image': '',
    'link': Uri.parse("https://discord.gg/twEg6J5zUT"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'انستغرام',
    'image': '',
    'link': Uri.parse("https://discord.gg/w7vpzHerRg"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'فيس بوك',
    'image': '',
    'link': Uri.parse("https://discord.gg/VWcQySHxen"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'أدوات الاعمال',
    'image': '',
    'link': Uri.parse("https://discord.gg/nQ289ZjZnJ"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'مدير الإعلانات',
    'image': '',
    'link': Uri.parse("https://discord.gg/h5mv2GrEZf"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'يوتيوب',
    'image': '',
    'link': Uri.parse("https://discord.gg/fTcbCT7F6R"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'منصة x ',
    'image': '',
    'link': Uri.parse("https://discord.gg/ZjNf4S86Kf"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'سوشلجي',
    'image': '',
    'link': Uri.parse("https://discord.gg/PwtXg6jYFh"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'سناب شات',
    'image': '',
    'link': Uri.parse("https://discord.gg/Hwv2mqkxfE"),
    'trainer': 'ابراهيم احمد'
  },
  ///////////////////////////////عمل حر
  {
    'name': 'مستقل',
    'image': '',
    'link': Uri.parse("https://discord.gg/3uX6E5A7dC"),
    'trainer': 'ابراهيم احمد'
  },
  {
    'name': 'خمسات ',
    'image': '',
    'link': Uri.parse("https://discord.gg/7GZewXPJf6"),
    'trainer': 'ابراهيم احمد'
  },
  ///////////////////////////// تصميم
  {
    'name': 'ثري دي ماكس',
    'image': '',
    'link': Uri.parse("https://discord.gg/7eCaS4CAtQ"),
    'trainer': 'ضحى احمد'
  },
  {
    'name': 'فوتوشوب',
    'image': '',
    'link': Uri.parse("https://discord.gg/Dfqk7uRAY9"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'اوتوكاد',
    'image': '',
    'link': Uri.parse("https://discord.gg/dmzJMJqGJz"),
    'trainer': 'ضحى احمد'
  },
  {
    'name': 'كانفا',
    'image': '',
    'link': Uri.parse("https://discord.gg/abyHDqFpQt"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'كاب كات',
    'image': '',
    'link': Uri.parse("https://discord.gg/2vAc7SjvBm"),
    'trainer': 'جيهان كخن'
  },
  {
    'name': 'المصمم العربي',
    'image': '',
    'link': Uri.parse("https://discord.gg/rAr4HkbDkB"),
    'trainer': '',
  },
  ///////////////////////////// محافظ
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
  /////////////////////////////// ربح عن طريق الانترنت
  {
    'name': 'بيع الصور',
    'image': '',
    'link': Uri.parse("https://discord.gg/w46SeATN3n"),
    'trainer': '',
  },
  {
    'name': 'سماع الاغاني',
    'image': '',
    'link': Uri.parse("https://discord.gg/6MdsV9vqh4"),
    'trainer': '',
  },
  {
    'name': 'مشاهدة الافلام',
    'image': '',
    'link': Uri.parse("https://discord.gg/KShwPPj9kU"),
    'trainer': '',
  },
  {
    'name': 'العاب',
    'image': '',
    'link': Uri.parse("https://discord.gg/VdNg5M3fsH"),
    'trainer': '',
  },
  {
    'name': 'drop-shopping',
    'image': '',
    'link': Uri.parse("https://discord.gg/tyfKaMKZxm"),
    'trainer': '',
  },
];

final List<Map<String, dynamic>> coursesMoney = [
  {
    'name': 'ادوات الذكاء الاصطناعي',
    'image': 'assets/aitool.jpeg',
  },
  {
    'name': 'إجابة الاستبيان',
    'image': '',
  },
  {
    'name': 'البودكاست',
    'image': '',
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

  // Function to show a dialog with course information
  void _showCourseDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView.builder(
              itemCount: discordLinks.length, // Use the length of discordLinks
              itemBuilder: (BuildContext context, int index) {
                final item = discordLinks[index]; // Get each discord link item
                return Container(
                  height: 136,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            item['image'] != ''
                                ? Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(item['image']),
                                      ),
                                    ),
                                  )
                                : const Icon(Icons.link,
                                    size: 40, color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "المدرب: ${item['trainer']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icons.bookmark_border_rounded,
                                      Icons.share,
                                    ].map((e) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Icon(e, size: 16),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

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
          // Display the courses in a grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: SizedBox(
              height: height, // Ensure the GridView has a fixed height
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600
                      ? 4 // More columns for larger screens
                      : 2, // Fewer columns for smaller screens
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.8,
                ),
                itemCount: coursesMoney.length,
                itemBuilder: (context, index) {
                  final course = coursesMoney[index];
                  return GestureDetector(
                    onTap: () => _showCourseDialog(),
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
