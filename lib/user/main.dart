import 'package:cenem/Api/config.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/user/layout.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart'; // Import Get package

late Config config;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // config = await Config.loadFromAsset();
  // //print(config.apiBaseUrl);
  // //print(config.apiProxyUrl);
  // baseurl = config.apiBaseUrl;
  // proxyurl = config.apiProxyUrl;
  // // Load the configuration

  // Get.put(AuthController());
  // Get.put(DialogNavigationController());
  // final result = await loginUser("younes.khdeir@gmail.com", "Asdf@2255", true);
  // //print(result);
  // await fetchOffspringMembers(user.userId);
  runApp(const UserMain());
}

class UserMain extends StatelessWidget {
  final String? initialRoute;

  const UserMain({super.key, this.initialRoute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: const Locale('ar'), // Set the default locale to Arabic

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: second),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme:
            GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: second,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/member', page: () => SiteLayout()),
      ],
      home: SiteLayout(), // Main layout of your application
    );
  }
}
