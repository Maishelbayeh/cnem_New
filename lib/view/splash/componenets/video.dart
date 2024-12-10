import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AutoPlayVideoContainer extends StatefulWidget {
  final String videoPath; // Path to the video file (asset or network)
  final double height;
  final double width;
  final BoxFit fit;

  const AutoPlayVideoContainer({
    super.key,
    required this.videoPath,
    this.height = 200.0,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  _AutoPlayVideoContainerState createState() => _AutoPlayVideoContainerState();
}

class _AutoPlayVideoContainerState extends State<AutoPlayVideoContainer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player dynamically based on the video path type
    _controller = widget.videoPath.startsWith('http')
        ? VideoPlayerController.network(widget.videoPath)
        : VideoPlayerController.asset(widget.videoPath);

    _controller.initialize().then((_) {
      setState(() {
        _controller.setLooping(true);
        _controller.setVolume(0); // Mute the video for autoplay
        _controller.play(); // Start playing the video
      });
    }).catchError((error) {
      print("Error loading video: $error");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Fallback background color
      ),
      child: _controller.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10), // Optional styling
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Show loader while initializing
            ),
    );
  }
}
