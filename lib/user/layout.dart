import 'package:cenem/res/constants.dart';
import 'package:cenem/user/widgets/large_screen.dart';
import 'package:cenem/user/widgets/top_nav.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/mobile_member/pages/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatefulWidget {
  const SiteLayout({super.key});

  @override
  _SiteLayoutState createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool isPopupVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void togglePopup() {
    setState(() {
      if (isPopupVisible) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      isPopupVisible = !isPopupVisible;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      extendBody: true,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kIsWeb && !Responsive.isLargeMobile(context)
                  ? const SizedBox(
                      height: defaultPadding * 2,
                    )
                  : const SizedBox(
                      height: defaultPadding / 2,
                    ),
              if (!Responsive.isLargeMobile(context))
                const Expanded(child: LargeScreen()),
              if (Responsive.isLargeMobile(context))
                const Expanded(child: Dashboard()),
            ],
          ),
          // Popup
          Positioned(
            top: 0, // Adjust this based on your UI
            right: 0, // Adjust this based on your UI
            child: SlideTransition(
              position: _offsetAnimation,
              child: _buildPopup(context),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: isPopupVisible ? 'اغلاق' : 'طلب العمولة',
        child: FloatingActionButton(
          onPressed: togglePopup,
          child: Icon(isPopupVisible ? Icons.close : Icons.attach_money_sharp),
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    return Material(
      elevation: 6.0, // Material elevation for built-in shadow
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Responsive width
        height: MediaQuery.of(context).size.height * 0.3, // Responsive height
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: second.withOpacity(0.15), // Shadow color with opacity
              offset: const Offset(0, 4), // Offset the shadow
              blurRadius: 10, // Blur radius for softness
              spreadRadius: 2, // Spread radius for shadow expansion
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // Center content
          children: [
            const Text(
              "طلب العمولة",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "يجب طلب العمولة قبل السادس من الشهر الحالي و الا يتم تخزينه في الحساب ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onTap: null,
              buttonText: "طلب العمولة",
              width: MediaQuery.of(context).size.width *
                  0.7, // Responsive button width
              height: MediaQuery.of(context).size.height *
                  0.07, // Responsive button height
            ),
          ],
        ),
      ),
    );
  }
}
