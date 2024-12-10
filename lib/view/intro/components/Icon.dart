import 'package:flutter/material.dart';
import 'package:cenem/view/video/components/video_grid.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({
    super.key,
    this.height = 200,
    this.width = 200,
    this.hasVideo = false,
  });

  final double? width;
  final double? height;
  final bool hasVideo;

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      debugLabel: "فيديو التعريفي",
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToVideo() {
    if (widget.hasVideo) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;

        return Transform.translate(
          offset: Offset(0, 2 * value),
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                first,
                second,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: first,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: second,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: _navigateToVideo,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/cnem.png',
                      height: Responsive.isLargeMobile(context)
                          ? MediaQuery.sizeOf(context).width * 0.2
                          : Responsive.isTablet(context)
                              ? MediaQuery.sizeOf(context).width * 0.14
                              : 120,
                      width: Responsive.isLargeMobile(context)
                          ? MediaQuery.sizeOf(context).width * 0.2
                          : Responsive.isTablet(context)
                              ? MediaQuery.sizeOf(context).width * 0.14
                              : 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.hasVideo)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_filled_outlined,
                            size: widget.width! * 0.15,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "اضغط هنا",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedImageContainer(hasVideo: true),
              SizedBox(height: 20),
              AnimatedImageContainer(hasVideo: false),
            ],
          ),
        ),
      ),
    ));
