import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/onbonding/authentication/web/SignInButtonWeb.dart';
import 'package:cenem/view/onbonding/authentication/web/signUpForm.dart';
import 'package:cenem/view/onbonding/authentication/web/sign_in_form.dart';
import 'package:cenem/view/onbonding/authentication/web/signupWebButton.dart';
import 'package:cenem/view/onbonding/errordialog.dart';
import 'package:cenem/view/splash/componenets/CourseCard.dart';
import 'package:cenem/view/splash/componenets/TeamMember.dart';
import 'package:cenem/view/splash/componenets/footer.dart';
import 'package:cenem/view/splash/componenets/video.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cenem/view/onbonding/MemberDialog.dart';

void main() {
  runApp(const MaterialApp(
    home: BackgroundVideoApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class BackgroundVideoApp extends StatefulWidget {
  const BackgroundVideoApp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BackgroundVideoAppState createState() => _BackgroundVideoAppState();
}

class _BackgroundVideoAppState extends State<BackgroundVideoApp> {
  late VideoPlayerController _controller1;
  late int _currentIndex = 0;
  ScrollController _scrollController = ScrollController();
  final GlobalKey _loginSectionKey = GlobalKey();
  final GlobalKey _newsubscriberSectionKey = GlobalKey();
  final GlobalKey _tochannelsSectionKey = GlobalKey();
  final GlobalKey _whoareweSectionKey = GlobalKey();
  final GlobalKey _topaidchannelsSectionKey = GlobalKey();
  final List<String> _menuItems = [
    'تسجيل الدخول',
    'مشترك جديد',
    'القنوات التدريبية',
    "القنوات المدفوعه",
    'من نحن',
    'فكرة الشبكة',
  ];
  final List<Map<String, dynamic>> courses = [
    {
      'name': 'انشاء حساب ريفلكت',
      'image': 'assets/reflect.jpg',
      'link': Uri.parse(
          'https://discord.com/channels/1293901250257096714/1293912696797921280'),
    },
    {
      'name': 'انشاء بريد الكتروني',
      'image': 'assets/email.jpg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293912620239425536"),
    },
    {
      'name': 'انشاء حساب pay pal',
      'image': 'assets/paypal.png',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293913084636823583"),
    },
    {
      'name': 'انشاء حساب في الشبكة التعاونية',
      'image': 'assets/logo.jpg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293913154203684864"),
    },
    {
      'name': 'الارشادات القانونية',
      'image': 'assets/law.jpg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293930850735489098"),
    },
  ];
  final List<Map<String, dynamic>> coursesMoney = [
    {
      'name': '  ادوات الذكاء الاصطناعي',
      'image': 'assets/aitool.jpg',
      'link': Uri.parse(
          'https://discord.com/channels/1293901250257096714/1293912696797921280'),
    },
    {
      'name': '  متجر الالكتروني',
      'image': 'assets/Ecommerce.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293912620239425536"),
    },
    {
      'name': '  سوشال ميديا ',
      'image': 'assets/socialmedia.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293913084636823583"),
    },
    {
      'name': '    العمل الحر',
      'image': 'assets/onlineworking.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293913154203684864"),
    },
    {
      'name': ' محافظ البنكية',
      'image': 'assets/bankpocket.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293930850735489098"),
    },
    {
      'name': '  برامج التصميم',
      'image': 'assets/design.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293930850735489098"),
    },
    {
      'name': '  الربح عن طريق الانترنت',
      'image': 'assets/profitviainternet.jpeg',
      'link': Uri.parse(
          "https://discord.com/channels/1293901250257096714/1293930850735489098"),
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset <= 0) {
          setState(() {
            _currentIndex = 0;
          });
        } else {
          setState(() {
            _currentIndex = 1; // يمكن أن تعدل القيم بناءً على مواقع أخرى
          });
        }
      });
    _controller1 = VideoPlayerController.asset('assets/background.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller1.setLooping(true);
          _controller1.setVolume(0); // Mute the video
          _controller1.play(); // Start playing the video
        });
      }).catchError((error) {
        // ignore: avoid_print
        print("Error loading video: $error");
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.0,
        duration: const Duration(milliseconds: 500), // مدة التمرير
        curve: Curves.easeInOut, // منحنى الحركة
      );
    }
  }

  void launchURL() async {
    const url =
        'https://youtu.be/GOEjPh3h0CU?si=nwUqS8IsT0s5cuja'; // Replace with your desired URL
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url,
          forceSafariVC: false,
          forceWebView: false); // Opens in the default browser
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600
        ? 1 // شاشة صغيرة (مثلاً الهواتف) عدد الأعمدة 2
        : screenWidth < 1200
            ? 2 // شاشة متوسطة (مثلاً التابلت) عدد الأعمدة 4
            : 3;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth > 800;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _currentIndex == 0
                ? Colors.transparent // شريط شفاف للصفحة الأولى
                : const Color.fromRGBO(69, 30, 156, 1),
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 150,
            leading: isLargeScreen
                ? Builder(
                    builder: (context) {
                      return const Text("");
                    },
                  )
                : Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
            actions: isLargeScreen
                ? [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Image.asset(
                        'assets/logo.jpg', // Path for the second logo
                        height: 100, // Adjust the height as needed
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ..._menuItems.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (item == 'تسجيل الدخول') {
                                        _currentIndex = 1;
                                        _scrollToSection(_loginSectionKey);
                                      } else if (item == 'مشترك جديد') {
                                        _currentIndex = 2;
                                        _scrollToSection(
                                            _newsubscriberSectionKey);
                                      } else if (item == 'القنوات التدريبية') {
                                        _currentIndex = 3;
                                        _scrollToSection(_tochannelsSectionKey);
                                      } else if (item == "القنوات المدفوعه") {
                                        _currentIndex = 4;
                                        _scrollToSection(
                                            _topaidchannelsSectionKey);
                                      } else if (item == 'من نحن') {
                                        _currentIndex = 5;
                                        _scrollToSection(_whoareweSectionKey);
                                      } else if (item == 'فكرة الشبكة') {
                                        _currentIndex = 1;
                                        launchURL();
                                      }
                                    });
                                  },
                                  child: Text(
                                    item,
                                    style: GoogleFonts.elMessiri(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.asset(
                        'assets/bank.jpg',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]
                : [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0), // Adds space between logos
                      child: Image.asset(
                        'assets/logo.jpg',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ], // Empty actions for small screens
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(69, 30, 156, 1),
                  ),
                  child: Text(
                    'Cenm',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ..._menuItems.map((item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      if (item == 'تسجيل الدخول') {
                        _currentIndex = 1;
                        _scrollToSection(_loginSectionKey);
                      } else if (item == 'مشترك جديد') {
                        _currentIndex = 2;
                        _scrollToSection(_newsubscriberSectionKey);
                      } else if (item == 'القنوات التدريبية') {
                        _currentIndex = 3;
                        _scrollToSection(_tochannelsSectionKey);
                      } else if (item == "القنوات المدفوعه") {
                        _currentIndex = 4;
                        _scrollToSection(_topaidchannelsSectionKey);
                      } else if (item == 'من نحن') {
                        _currentIndex = 5;
                        _scrollToSection(_whoareweSectionKey);
                      } else if (item == 'فكرة الشبكة') {
                        _currentIndex = 1;
                        launchURL();
                      }
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
          body: Stack(
            children: [
              _controller1.value.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller1.value.size.width,
                          height: _controller1.value.size.height,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                color: Colors.black, // Adjust opacity as needed
                              ),
                              Opacity(
                                opacity: .7, // Full opacity for the video
                                child: VideoPlayer(_controller1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الشبكة التعاونية للتسويق الالكتروني \n',
                              style: GoogleFonts.lalezar(
                                color: const Color.fromRGBO(69, 30, 156, 1),
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              'كن شريكا في النجاح مع اول منصة عربية \n ',
                              style: GoogleFonts.lalezar(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'للباحثين عن عمل ...للباحثين عن عمل اضافي \n ',
                              style: GoogleFonts.lalezar(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'للمتعلمين وغير المتعلمين ',
                              style: GoogleFonts.lalezar(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 25),
                            ElevatedButton(
                              onPressed: () {
                                launchURL();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(69, 30, 156, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'تشغيل الفيديو',
                                    style: GoogleFonts.lalezar(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      key: _loginSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: Center(
                          child: Row(
                            children: [
                              if (isLargeScreen)
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/arabworld.png',
                                          width: screenWidth *
                                              0.5, // Keep width as desired
                                          height: screenHeight *
                                              0.5, // Increased height for larger image
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "تسجيل الدخول",
                                        style: GoogleFonts.elMessiri(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromRGBO(
                                              69, 30, 156, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      SignInForm(screenWidth, screenHeight),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        child: SignInButtonWeb(
                                            screenHeight, screenWidth),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      key: _newsubscriberSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                            height:
                                                20), // Adjusted height for better spacing
                                        Text(
                                          "إنشاء حساب",
                                          style: GoogleFonts.elMessiri(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                                69, 30, 156, 1),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20),
                                        SignUpForm(screenWidth, screenHeight),
                                        SignupWebButton(),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isLargeScreen)
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: const Column(
                                        children: [
                                          SizedBox(height: 100),
                                          AutoPlayVideoContainer(
                                            videoPath: 'assets/signIn.mp4',
                                            height: 700,
                                            width: 700,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      key: _tochannelsSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.isMobile(context)
                                      ? 20.0
                                      : Responsive.isLargeMobile(context)
                                          ? 50.0 // وسط بين الموبايل والديسكتوب
                                          : 100.0, // بادينغ أكبر للشاشات الأكبر
                                  vertical: 20.0,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 25.0,
                                    mainAxisSpacing: 40.0,
                                    childAspectRatio: 1.8,
                                  ),
                                  itemCount: courses.length,
                                  itemBuilder: (context, index) {
                                    final course = courses[index];
                                    return GestureDetector(
                                      onTap: () {
                                        launchUrl(course['link']);
                                      },
                                      child: CourseCard(course: course),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      key: _topaidchannelsSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.isMobile(context)
                                      ? 20.0
                                      : Responsive.isLargeMobile(context)
                                          ? 50.0 // وسط بين الموبايل والديسكتوب
                                          : 100.0, // بادينغ أكبر للشاشات الأكبر
                                  vertical: 20.0,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 25.0,
                                    mainAxisSpacing: 40.0,
                                    childAspectRatio: 1.8,
                                  ),
                                  itemCount: coursesMoney.length,
                                  itemBuilder: (context, index) {
                                    final course = coursesMoney[index];
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return ProfessionalErrorDialog(
                                              title: 'تسجيل في الشبكة',
                                              content:
                                                  'قم بتسجيل في الشبكة للتمتلك الفرصة للاطلاع على تفاصيل هذه القنوات',
                                              buttonText: 'تسجيل الدخول',
                                              onPressed: () {
                                                _currentIndex = 1;
                                                _scrollToSection(
                                                    _loginSectionKey);
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: CourseCard(course: course),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      key: _whoareweSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.isMobile(context)
                                      ? 20.0
                                      : Responsive.isLargeMobile(context)
                                          ? 50.0 // وسط بين الموبايل والديسكتوب
                                          : 100.0, // بادينغ أكبر للشاشات الأكبر
                                  vertical: 20.0,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 25.0,
                                    mainAxisSpacing: 40.0,
                                    childAspectRatio: 1.8,
                                  ),
                                  itemCount: teamMembers.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        showMemberDialog(
                                            context, teamMembers[index]);
                                      },
                                      child: MemberCard(
                                        teamMember: teamMembers[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      color: Colors.white,
                      child: SizedBox(
                        width: screenWidth,
                        height: 100, // Height of the footer
                        child: CreativeFooter(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
