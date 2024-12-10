import 'package:cenem/view/onbonding/authentication/web/SignInButtonWeb.dart';
import 'package:cenem/view/onbonding/authentication/web/signUpForm.dart';
import 'package:cenem/view/onbonding/authentication/web/sign_in_form.dart';
import 'package:cenem/view/onbonding/authentication/web/signupWebButton.dart';
import 'package:cenem/view/onbonding/errordialog.dart';

import 'package:cenem/view/splash/componenets/TeamMember.dart';

import 'package:cenem/view/splash/componenets/footer.dart';
import 'package:cenem/view/splash/componenets/video.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late VideoPlayerController _controller2;
  late int _currentIndex = 0;
  ScrollController _scrollController = ScrollController();
  final GlobalKey _loginSectionKey = GlobalKey();
  final GlobalKey _newsubscriberSectionKey = GlobalKey();
  final GlobalKey _tochannelsSectionKey = GlobalKey();
  final GlobalKey _whoareweSectionKey = GlobalKey();
  final GlobalKey _networkIdeaSectionKey = GlobalKey();
  final GlobalKey _callUsSectionKey = GlobalKey();
  bool rememberMe = false;
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
      'image': 'assets/aitool.jpeg',
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
        position: "FrontEnd  developer"),
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
    // TeamMember(
    //     name: "  ",
    //     description: "  ",
    //     imageUrl: 'assets/images/mai.png',
    //     position: "")
  ];

  final _phoneController = TextEditingController();
  String _selectedCountryCode = '+1'; // Default country code

  final List<Map<String, String>> countryCodes = [
    {'code': '+1', 'flag': '🇺🇸'}, // Example: USA
    {'code': '+44', 'flag': '🇬🇧'}, // Example: UK
    {'code': '+971', 'flag': '🇦🇪'}, // Example: UAE
    {'code': '+91', 'flag': '🇮🇳'}, // Example: India
    // Add more country codes and flags here
  ];

  bool _isVideoReady = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset <= 0) {
          // إذا كان في أعلى الصفحة
          setState(() {
            _currentIndex = 0;
          });
        } else {
          // إذا كان في مكان آخر
          setState(() {
            _currentIndex = 1; // يمكن أن تعدل القيم بناءً على مواقع أخرى
          });
        }
      });

    // Initialize the video player with asset path (ensure you have the correct path)
    _controller1 = VideoPlayerController.asset('assets/background.mp4')
      ..initialize().then((_) {
        // Set the video to loop and mute it for autoplay to work in browsers
        setState(() {
          _controller1.setLooping(true);
          _controller1.setVolume(0); // Mute the video
          _controller1.play(); // Start playing the video
          _isVideoReady = true; // Flag to indicate video is ready
        });
      }).catchError((error) {
        print("Error loading video: $error");
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollToLoginSection() {
    final context = _loginSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToNewSubscriberSection() {
    final context = _newsubscriberSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToChannelsSection() {
    final context = _tochannelsSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToWhoareweSection() {
    final context = _whoareweSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToNetworkIdeaSection() {
    final context = _networkIdeaSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToCallUsSection() {
    final context = _callUsSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // Scroll to align the top of the section with the top of the viewport
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0, // الانتقال إلى أعلى الصفحة
      duration: const Duration(milliseconds: 500), // مدة الحركة
      curve: Curves.easeInOut, // منحنى الحركة
    );
  }

  void launchURL() async {
    const url =
        'https://www.youtube.com/watch?v=ONBzrKkW1yY'; // Replace with your desired URL
    if (await canLaunch(url)) {
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
    final crossAxisCount = screenWidth > 800
        ? 3
        : screenWidth > 600
            ? 2
            : 1;
    final crossAxisCountAbout = screenWidth > 800
        ? 4
        : screenWidth > 600
            ? 2
            : 2;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool _isHovered = false;
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
                  ) // No leading icon on large screens
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
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (item == 'تسجيل الدخول') {
                                        _currentIndex = 1;
                                        _scrollToLoginSection();
                                      } else if (item == 'مشترك جديد') {
                                        _currentIndex = 2;
                                        _scrollToNewSubscriberSection();
                                      } else if (item == 'القنوات التدريبية') {
                                        _currentIndex = 3;
                                        _scrollToChannelsSection();
                                      } else if (item == "القنوات المدفوعه") {
                                        _currentIndex = 4;
                                        _scrollToNetworkIdeaSection();
                                      } else if (item == 'من نحن') {
                                        _currentIndex = 5;
                                        _scrollToWhoareweSection();
                                      } else if (item == 'فكرة الشبكة') {
                                        _currentIndex = 6;
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
                      child: GestureDetector(
                        onTap: () {
                          _currentIndex = 0;
                          _scrollToTop();
                        },
                        child: Image.asset(
                          'assets/bank.jpg', // مسار الشعار
                          height: 100, // ضبط ارتفاع الشعار حسب الحاجة
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ]
                : [], // Empty actions for small screens
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
                    'القائمة الرئيسية',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ..._menuItems.map((item) {
                  return ListTile(
                      title: Text(item),
                      onTap: item == 'تسجيل الدخول'
                          ? _scrollToLoginSection // Scroll to login section
                          : item == 'مشترك جديد'
                              ? _scrollToNewSubscriberSection
                              : item == 'القنوات التدريبية'
                                  ? _scrollToChannelsSection
                                  : item == 'من نحن'
                                      ? _scrollToWhoareweSection
                                      : item == 'فكرة الشبكة'
                                          ? _scrollToNetworkIdeaSection
                                          // ignore: avoid_print
                                          : () => print(""));
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
                              // The background color with opacity
                              Container(
                                color: Colors.black, // Adjust opacity as needed
                              ),
                              // The video player with opacity
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
                          mainAxisAlignment:
                              MainAxisAlignment.center, // لضمان التوسيط العمودي
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // لضمان التوسيط الأفقي
                          children: [
                            Text(
                              'الشبكة التعاونية للتسويق الالكتروني \n',
                              style: GoogleFonts.lalezar(
                                color: const Color.fromRGBO(69, 30, 156, 1),
                                fontSize: 35,
                                // fontWeight: FontWeight.bold,
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
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 25), // مسافة بين النصوص والزر
                            ElevatedButton(
                              onPressed: () {
                                launchURL();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                    69, 30, 156, 1), // لون الزر
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize.min, // لتجنب تمدد الزر
                                children: [
                                  const Icon(
                                    Icons
                                        .play_circle_fill, // أيقونة تشغيل الفيديو
                                    color: Colors.white,
                                    size: 24, // حجم الأيقونة
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // مسافة صغيرة بين الأيقونة والنص
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
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      key: _loginSectionKey,
                      height: MediaQuery.of(context)
                          .size
                          .height, // Full screen height
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: Directionality(
                          textDirection: TextDirection
                              .rtl, // Right to Left for Arabic text
                          child: Center(
                            child: Row(
                              children: [
                                // Only show the image if the screen width is large enough (e.g., greater than 600px)
                                if (isLargeScreen)
                                  Expanded(
                                      child: Center(
                                    child: Image.asset(
                                      'assets/arabworld.png', // Path to your image file
                                      width: screenWidth *
                                          0.5, // Optional: Specify width
                                      height: screenHeight *
                                          0.5, // Optional: Specify height
                                      fit: BoxFit
                                          .cover, // Optional: Adjust how the image fits
                                    ),
                                  )),
                                // Login Form
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Center vertically
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                        ),
                                        // Title centered
                                        Text(
                                          "تسجيل الدخول",
                                          style: GoogleFonts.elMessiri(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                                69, 30, 156, 1),
                                          ),
                                          textAlign: TextAlign
                                              .center, // Title aligned in center
                                        ),
                                        const SizedBox(height: 20),
                                        // Email input field
                                        SignInForm(screenWidth, screenHeight),

                                        // Password input field
                                        const SizedBox(height: 20),
                                        // Login button
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
                    ),

                    SizedBox(
                      key: _newsubscriberSectionKey,
                      height: MediaQuery.of(context).size.height,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                      ),
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
                                      // Email Input Field
                                      SignUpForm(screenWidth, screenHeight),
                                      // Password Input Field
                                      SignupWebButton(),
                                      // Confirm Password Input Field

                                      // Phone Number with Country Code

                                      // Dropdown for Country Code

                                      // Confirm Button
                                    ],
                                  ),
                                ),
                              ),
                              // Image Section (only for larger screens)
                              if (isLargeScreen)
                                Expanded(
                                    child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    AutoPlayVideoContainer(
                                      videoPath:
                                          'assets/signIn.mp4', // Path to your video
                                      height: 700, // Custom height
                                      width: 700, // Custom width
                                      fit: BoxFit
                                          .cover, // Adjust how the video fits the container
                                    ),
                                  ],
                                )),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        key: _tochannelsSectionKey,
                        height: MediaQuery.of(context)
                            .size
                            .height, // Full screen height
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          body: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    crossAxisCount, // عدد الأعمدة الديناميكي
                                crossAxisSpacing: 25.0, // المسافة الأفقية
                                mainAxisSpacing: 40.0, // المسافة العمودية
                                childAspectRatio: 1.8, // نسبة العرض إلى الطول
                              ),
                              itemCount: courses.length,
                              itemBuilder: (context, index) {
                                final course = courses[index];
                                return GestureDetector(
                                  onTap: () {
                                    launchUrl(course['link']);
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 4,
                                    child: Column(
                                      children: [
                                        // صورة الدورة
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                              top: Radius.circular(12.0),
                                            ),
                                            child: Image.asset(
                                              course['image']!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),
                                        // اسم الدورة
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            course['name']!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.elMessiri(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromRGBO(
                                                  69, 30, 156, 1),
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
                        )),
                    SizedBox(
                      key: _networkIdeaSectionKey,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context)
                          .size
                          .width, // Full screen height
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  crossAxisCount, // Dynamic column count
                              crossAxisSpacing: 25.0, // Horizontal spacing
                              mainAxisSpacing: 40.0, // Vertical spacing
                              childAspectRatio: 1.8, // Aspect ratio
                            ),
                            itemCount: coursesMoney
                                .length, // Use the correct list for count
                            itemBuilder: (context, index) {
                              final course = coursesMoney[index];
                              return GestureDetector(
                                onTap: () {
                                  // Trigger dialog
                                  showDialog(
                                    context: context,
                                    barrierDismissible:
                                        false, // Prevent closing by tapping outside
                                    builder: (context) {
                                      return ProfessionalErrorDialog(
                                        title: 'تسجيل في الشبكة',
                                        content:
                                            'قم بتسجيل في الشبكة للتمتلك الفرصة للاطلاع على تفاصيل هذه القنوات',
                                        buttonText: 'تسجيل الدخول',
                                        onPressed: () {
                                          _currentIndex = 1;
                                          _scrollToLoginSection();
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 4,
                                  child: Column(
                                    children: [
                                      // Video container wrapped in GestureDetector to intercept taps
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(12.0),
                                          ),
                                          child: Image.asset(
                                            course['image']!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      // Course name
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          course['name']!,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.elMessiri(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                                69, 30, 156, 1),
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
                    ),

                    SizedBox(
                        key: _whoareweSectionKey,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context)
                            .size
                            .width, // Full screen height
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          body: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: isLargeScreen
                                  ? SingleChildScrollView(
                                      child: Center(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              for (int i = 0;
                                                  i < teamMembers.length;
                                                  i += 3)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      for (int j = i;
                                                          j < i + 3 &&
                                                              j <
                                                                  teamMembers
                                                                      .length;
                                                          j++)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _showMemberDialog(
                                                                  context,
                                                                  teamMembers[
                                                                      j]);
                                                            },
                                                            child: MemberCard(
                                                              teamMember:
                                                                  teamMembers[
                                                                      j],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: teamMembers.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              _showMemberDialog(
                                                  context, teamMembers[index]);
                                            },
                                            child: MemberCard(
                                              teamMember: teamMembers[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        )),

                    Container(
                      height:
                          100, // Height of the container with background color
                      color: Colors.white, // Background color
                      child: SizedBox(
                        width:
                            screenWidth, // Use the screen width for the footer
                        height: 100, // Height of the footer
                        child: CreativeFooter(),
                      ), // Empty content or placeholder
                    ), // Space between video and buttons
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

void _showMemberDialog(BuildContext context, TeamMember member) {
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl, // Right to Left for Arabic text
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          content: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.35, // تحديد عرض الصندوق
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(member.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        member.name,
                        style: GoogleFonts.elMessiri(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(69, 30, 156, 1),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "الوظيفة: ${member.position}",
                  style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  member.description,
                  style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color.fromRGBO(69, 30, 156, 1), width: 1.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        ),
      );
    },
  );
}
