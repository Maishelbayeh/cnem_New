import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/main/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with a network video
    _controller = VideoPlayerController.network(
      'assets/6268-190550874_small.mp4',
    )..initialize().then((_) {
        setState(() {
          // Play the video and set it to loop
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Full-screen video background
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            // Foreground login widget

            // Top navigation bar on top of video
            Column(
              children: [
                // Navigation bar
                SizedBox(
                  height: Responsive.isDesktop(context)
                      ? 150
                      : Responsive.isTablet(context)
                          ? 90
                          : 90,
                  child: TopNavigationBar(),
                ),
                // Other widgets or login content here
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the controller when the widget is disposed
    _controller.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 300,
        height: 250,
        color: Colors.grey.withAlpha(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Username field
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            // Password field
            TextField(
              obscureText: true, // Ensure the password is obscured
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            // Login button
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                // Handle login logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
