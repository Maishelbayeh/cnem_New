import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final Map<String, String> discordLinks = {
  "أدوات الذكاء الاصطناعي": "https://discord.gg/2SqrNNA5eV",
  "إجابة الاستبيان": "https://discord.gg/MmCuJZQkNc",
  "البودكاست": "https://discord.gg/8mfVwPdFBY",
  "ecwid": "https://discord.gg/BrXVmC23f3",
  "wix": "https://discord.gg/nUMFbC6cYs",
  "ووردبريس": "https://discord.gg/hJwdZpf7WJ",
  "تيلجرام": "https://discord.gg/fyqNfmfq4n",
  "تيك توك": "https://discord.gg/twEg6J5zUT",
  "انستغرام": "https://discord.gg/w7vpzHerRg",
  "فيسبوك": "https://discord.gg/VWcQySHxen",
  "أدوات الاعمال": "https://discord.gg/nQ289ZjZnJ",
  "مدير الإعلانات": "https://discord.gg/h5mv2GrEZf",
  "يوتيوب": "https://discord.gg/fTcbCT7F6R",
  "تويتر": "https://discord.gg/ZjNf4S86Kf",
  "سوشلجي": "https://discord.gg/PwtXg6jYFh",
  "سناب شات": "https://discord.gg/Hwv2mqkxfE",
  "إرشادات قانونية": "https://discord.gg/TUQmgbVgFZ",
  "دليل الوزارات": "https://discord.gg/BydspZFNtX",
  "مستقل": "https://discord.gg/3uX6E5A7dC",
  "خمسات": "https://discord.gg/7GZewXPJf6",
  "ثري دي ماكس": "https://discord.gg/7eCaS4CAtQ",
  "فوتوشوب": "https://discord.gg/Dfqk7uRAY9",
  "اوتوكاد": "https://discord.gg/dmzJMJqGJz",
  "كانفا": "https://discord.gg/abyHDqFpQt",
  "كاب كت": "https://discord.gg/2vAc7SjvBm",
  "المصمم العربي": "https://discord.gg/rAr4HkbDkB",
  "بيع الصور": "https://discord.gg/w46SeATN3n",
  "سماع الأغاني": "https://discord.gg/6MdsV9vqh4",
  "مشاهدة الأفلام": "https://discord.gg/KShwPPj9kU",
  "العاب": "https://discord.gg/VdNg5M3fsH",
  "drop-shopping": "https://discord.gg/tyfKaMKZxm"
};

class ChannelSectionLarge extends StatefulWidget {
  const ChannelSectionLarge({super.key});

  @override
  _ChannelSectionLargeState createState() => _ChannelSectionLargeState();
}

class _ChannelSectionLargeState extends State<ChannelSectionLarge> {
  String? selectedValue;
  double height = 600.0;
  List<String> filteredChannels = discordLinks.keys.toList();
  TextEditingController searchController = TextEditingController();

  // Function to filter channels based on the search input
  void _filterChannels(String query) {
    final filtered =
        discordLinks.keys.where((channel) => channel.contains(query)).toList();
    setState(() {
      filteredChannels = filtered;
    });
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
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: TextField(
              controller: searchController,
              onChanged: _filterChannels,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: second, // Set your desired bottom border color
                    width: 1, // Adjust the thickness of the bottom border
                  ),
                ),
                hintText: "ابحث عن قناة...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide.none, // No border for the OutlineInputBorder
                ),
              ),
            ),
          ),
          // Display the channels in a grid
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
                itemCount: filteredChannels.length,
                itemBuilder: (context, index) {
                  final channel = filteredChannels[index];
                  return Tooltip(
                    message: channel,
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(discordLinks[channel]!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          Get.snackbar(
                            'Error',
                            'Could not open the link: $url',
                            snackPosition: SnackPosition.BOTTOM,
                          );
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
                            Icon(Icons.link, size: 40, color: second),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                channel,
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
